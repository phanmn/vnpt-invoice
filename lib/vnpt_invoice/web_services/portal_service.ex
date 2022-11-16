defmodule VnptInvoice.WebServices.PortalService do
  use OK.Pipe
  use Memoize
  require Logger

  def download_invoice(fkey) do
    init_soap()
    ~>> Soap.call("downloadInvPDFFkeyNoPayError", %{
      userName: VnptInvoice.WebServices.Account.Configuration.get(:username),
      userPass: VnptInvoice.WebServices.Account.Configuration.get(:password),
      fkey: fkey
    })
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{downloadInvPDFFkeyNoPayErrorResponse: %{downloadInvPDFFkeyNoPayErrorResult: "ERR:" <> error_code}} ->
        {:error, error_code}

      %{downloadInvPDFFkeyNoPayErrorResponse: %{downloadInvPDFFkeyNoPayErrorResult: v}} ->
        {:ok, v}
    end)
  end

  defmemop init_soap(), expires_in: 60_000 do
    VnptInvoice.WebServices.PortalService.Configuration.get(:url)
    |> Soap.init_model(:url, recv_timeout: 30_000)
  end
end
