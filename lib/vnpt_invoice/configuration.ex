defmodule VnptInvoice.Configuration do
  def get(:origin) do
    Application.get_env(:vnpt_invoice, :origin)
  end

  def get(:username) do
    Application.get_env(:vnpt_invoice, :username)
  end

  def get(:password) do
    Application.get_env(:vnpt_invoice, :password)
  end
end
