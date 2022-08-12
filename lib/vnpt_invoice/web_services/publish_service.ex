defmodule VnptInvoice.WebServices.PublishService do
  use OK.Pipe

  @spec import_invoice(List.t()) :: {:ok, :any} | {:error, :any}
  def import_invoice(invoices) do
    init_soap()
    ~>> Soap.call("ImportInv", %{
      xmlInvData: invoices |> VnptInvoice.Invoice.XmlBuilder.build(),
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password)
    })
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

  defp init_soap() do
    VnptInvoice.WebServices.PublishService.Configuration.get(:url)
    |> Soap.init_model(:url)
  end
end
