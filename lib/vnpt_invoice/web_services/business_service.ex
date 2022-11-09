defmodule VnptInvoice.WebServices.BusinessService do
  use OK.Pipe
  use Memoize

  @spec cancel_invoice(List.t()) :: {:ok, :any} | {:error, :any}
  def cancel_invoice(fkey) do
    init_soap()
    ~>> Soap.call("cancelInvNoPay", %{
      userName: VnptInvoice.WebServices.Account.Configuration.get(:username),
      userPass: VnptInvoice.WebServices.Account.Configuration.get(:password),
      Account: VnptInvoice.WebServices.Account.Configuration.get(:admin_username),
      ACpass: VnptInvoice.WebServices.Account.Configuration.get(:admin_password),
      fkey: fkey
    })
    ~>> Soap.Response.parse()
    |> OK.wrap()
    ~>> then(fn
      %{cancelInvNoPayResponse: %{cancelInvNoPayResult: "OK:"}} ->
        {:ok, true}

      %{cancelInvNoPayResponse: %{cancelInvNoPayResult: v}} ->
        {:error, v}
    end)
  end

  defmemop init_soap(), expires_in: 60_000 do
    VnptInvoice.WebServices.BusinessService.Configuration.get(:url)
    |> Soap.init_model(:url, recv_timeout: 30_000)
  end
end
