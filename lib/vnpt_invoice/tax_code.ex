defmodule VnptInvoice.TaxCode do
  @doc """
    iex> VnptInvoice.TaxCode.validate?("0110092483-012")
    true

    iex> VnptInvoice.TaxCode.validate?("0110092483-012")
    true

    iex> VnptInvoice.TaxCode.validate?("0110092483")
    true

    iex> VnptInvoice.TaxCode.validate?("011009248")
    false

    iex> VnptInvoice.TaxCode.validate?("0110092483-11")
    false

    iex> VnptInvoice.TaxCode.validate?("0110092483-0144")
    false
  """
  def validate?(v) do
    v
    |> String.match?(~r/(^\d{10}$)|(^\d{10}(\-\d{3})*$)/)
  end
end
