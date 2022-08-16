defmodule VnptInvoice.WebServices.Account.Configuration do
  def get(:username) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:username)
  end

  def get(:password) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:password)
  end

  def get(:admin_username) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:admin_username)
  end

  def get(:admin_password) do
    Application.get_env(:vnpt_invoice, :web_services)
    |> Keyword.get(:admin_password)
  end
end
