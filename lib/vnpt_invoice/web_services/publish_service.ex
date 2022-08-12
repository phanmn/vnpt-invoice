defmodule VnptInvoice.WebServices.PublishService do
  use OK.Pipe

  def import_invoice(invoice = %VnptInvoice.Invoice{}) do
    init_soap()
    ~>> Soap.call("ImportInv", %{
      xmlInvData: invoice |> VnptInvoice.Invoice.to_xml(),
      username: VnptInvoice.WebServices.Account.Configuration.get(:username),
      password: VnptInvoice.WebServices.Account.Configuration.get(:password)
    })
    ~>> Soap.Response.parse()
    |> OK.wrap()
  end

  defp init_soap() do
    VnptInvoice.WebServices.PublishService.Configuration.get(:url)
    |> Soap.init_model(:url)
  end
end
