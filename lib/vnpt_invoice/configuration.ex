defmodule VnptInvoice.Configuration do
  def get(:origin) do
    Application.get_env(:vnpt_invoice, :origin)
  end
end
