defmodule VnptInvoice.WebServices.PortalService do
  use OK.Pipe
  use Memoize
  require Logger

  def download_invoice(fkey, path_to_file \\ "./") do
    init_soap()
    ~>> Soap.call("downloadInvPDFFkey", %{
      userName: VnptInvoice.WebServices.Account.Configuration.get(:username),
      userPass: VnptInvoice.WebServices.Account.Configuration.get(:password),
      fkey: fkey
    })
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{downloadInvPDFFkeyResponse: %{downloadInvPDFFkeyResult: "ERR:" <> error_code}} ->
        {:error, error_code}

      %{downloadInvPDFFkeyResponse: %{downloadInvPDFFkeyResult: v}} ->
        {:ok, v}
    end)
  end

  defmemop init_soap(), expires_in: 60_000 do
    VnptInvoice.WebServices.PortalService.Configuration.get(:url)
    |> Soap.init_model(:url, recv_timeout: 30_000)
  end
end
