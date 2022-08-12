defmodule VnptInvoice.WebServices.PublishService do
  use OK.Pipe

  @spec import_invoice(%VnptInvoice.Invoice{}) :: {:ok, :any} | {:error, :any}
  def import_invoice(invoice = %VnptInvoice.Invoice{}) do
    init_soap()
    ~>> Soap.call("ImportInv", %{
      xmlInvData: invoice |> VnptInvoice.Invoice.to_xml(),
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password)
    })
    ~>> Soap.Response.parse()
    ~>> then(fn
      %{ImportInvResponse: %{ImportInvResult: result}} = v ->
        result
        |> String.contains?("OK:")
        |> case do
          false -> {:ok, v}
          _ -> {:error, v}
        end

      v ->
        {:error, v}
    end)
    |> OK.wrap()
  end

  defp init_soap() do
    VnptInvoice.WebServices.PublishService.Configuration.get(:url)
    |> Soap.init_model(:url)
  end
end
