defmodule VnptInvoice.WebServices.PublishService do
  use OK.Pipe
  use Memoize

  require Logger

  @spec import_invoice(List.t()) :: {:ok, :any} | {:error, :any}
  def import_invoice(invoices) do
    init_soap()
    ~>> Soap.call("ImportInv", %{
      xmlInvData: invoices |> VnptInvoice.Invoice.XmlBuilder.build(),
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password)
    }, [], recv_timeout: 30_000)
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{ImportInvResponse: %{ImportInvResult: "OK:" <> v}} ->
        [pattern, serial_keys] =
          v
          |> String.split(";")

        [serial, keys] =
          serial_keys
          |> String.split("-")

        keys =
          keys
          |> String.split(",")

        {:ok,
         %{
           pattern: pattern,
           serial: serial,
           keys: keys
         }}

      v ->
        {:error, v}
    end)
  end

  def import_publish_invoice(invoices) do
    init_soap()
    ~>> Soap.call("ImportAndPublishInv", %{
      xmlInvData: invoices |> VnptInvoice.Invoice.XmlBuilder.build(),
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password),
      Account: VnptInvoice.WebServices.Account.Configuration.get(:admin_username),
      ACpass: VnptInvoice.WebServices.Account.Configuration.get(:admin_password)
    }, [], recv_timeout: 30_000)
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{ImportAndPublishInvResponse: %{ImportAndPublishInvResult: "OK:" <> v}} ->
        [pattern, serial_keys] =
          v
          |> String.split(";")

        [serial, keys] =
          serial_keys
          |> String.split("-")

        keys =
          keys
          |> String.split(",")

        %{keys: keys, invoice_numbers: invoice_numbers} =
          keys
          |> Enum.map(fn key_inv_number ->
            key_inv_number
            |> String.split("_")
          end)
          |> Enum.reduce(%{keys: [], invoice_numbers: []}, fn [key, invoice_number], acc ->
            keys = [key | acc.keys]
            invoice_numbers = [invoice_number | acc.invoice_numbers]
            %{keys: keys |> Enum.reverse(), invoice_numbers: invoice_numbers |> Enum.reverse()}
          end)

        # |> inspect()
        # |> Logger.error()

        {:ok,
         %{
           pattern: pattern,
           serial: serial,
           keys: keys,
           invoice_numbers: invoice_numbers
         }
        }

      v ->
        {:error, v}
    end)
  end

  def tax_authority_code(fkey) do
    init_soap()
    ~>> Soap.call("GetMCCQThueByFkeys", %{
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password),
      Account: VnptInvoice.WebServices.Account.Configuration.get(:admin_username),
      ACpass: VnptInvoice.WebServices.Account.Configuration.get(:admin_password),
      fkeys: fkey,
      pattern: "1/001"
    }, [], recv_timeout: 30_000)
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{GetMCCQThueByFkeysResponse: %{GetMCCQThueByFkeysResult: "ERR:" <> error_code}} ->
        {:error, error_code}

      %{GetMCCQThueByFkeysResponse: %{GetMCCQThueByFkeysResult: v}} ->
        v
        |> Base.decode64!()
        |> XmlToMap.naive_map()
        |> Map.get("DSHDon")
        |> Map.get("HDon")
        |> Map.get("MCCQThue")
        |> OK.success()
    end)
  end

  defmemop init_soap(), expires_in: 60_000 do
    VnptInvoice.WebServices.PublishService.Configuration.get(:url)
    |> Soap.init_model(:url, recv_timeout: 30_000)
  end
end
