defmodule VnptInvoice.WebServices.Account.Configuration do
  def get(:username) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:username)
  end

  def get(:password) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:password)
  end
end
