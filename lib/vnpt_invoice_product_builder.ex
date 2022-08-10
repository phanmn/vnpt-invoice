defmodule VnptInvoiceProductBuilder do
  def build(params) when is_map(params) do
    "<Products><Product>"
    |> build(params)
  end

  defp build(invoice, %{product_name: product_name} = params) do
    invoice <> "<ProdName>#{product_name}</ProdName>"
    |> build(params |> Map.drop([:product_name]))
  end

  defp build(invoice, %{product_unit: product_unit} = params) do
    invoice <> "<ProdUnit>#{product_unit}</ProdUnit>"
    |> build(params |> Map.drop([:product_unit]))
  end

  defp build(invoice, %{product_quantity: product_quantity} = params) do
    invoice <> "<ProdQuantity>#{product_quantity}</ProdQuantity>"
    |> build(params |> Map.drop([:product_quantity]))
  end

  defp build(invoice, %{product_price: product_price} = params) do
    invoice <> "<ProdPrice>#{product_price}</ProdPrice>"
    |> build(params |> Map.drop([:product_price]))
  end

  defp build(invoice, %{product_amount: product_amount} = params) do
    invoice <> "<Amount>#{product_amount}</Amount>"
    |> build(params |> Map.drop([:product_amount]))
  end

  defp build(invoice, %{product_remark: product_remark} = params) do
    invoice <> "<Remark>#{product_remark}</Remark>"
    |> build(params |> Map.drop([:product_remark]))
  end

  defp build(invoice, %{product_total: product_total} = params) do
    invoice <> "<Total>#{product_total}</Total>"
    |> build(params |> Map.drop([:product_total]))
  end

  defp build(invoice, %{product_vat_rate: product_vat_rate} = params) do
    invoice <> "<VATRate>#{product_vat_rate}</VATRate>"
    |> build(params |> Map.drop([:product_vat_rate]))
  end

  defp build(invoice, %{product_vat_amount: product_vat_amount} = params) do
    invoice <> "<VATAmount>#{product_vat_amount}</VATAmount>"
    |> build(params |> Map.drop([:product_vat_amount]))
  end

  defp build(invoice, %{product_extra_1: product_extra_1} = params) do
    invoice <> "<Extra1>#{product_extra_1}</Extra1>"
    |> build(params |> Map.drop([:product_extra_1]))
  end

  defp build(invoice, %{product_extra_2: product_extra_2} = params) do
    invoice <> "<Extra2>#{product_extra_2}</Extra2>"
    |> build(params |> Map.drop([:product_extra_2]))
  end

  defp build(invoice, %{product_discount: product_discount} = params) do
    invoice <> "<Discount>#{product_discount}</Discount>"
    |> build(params |> Map.drop([:product_discount]))
  end

  defp build(invoice, %{product_discount_amount: product_discount_amount} = params) do
    invoice <> "<DiscountAmount>#{product_discount_amount}</DiscountAmount>"
    |> build(params |> Map.drop([:product_discount_amount]))
  end

  defp build(invoice, %{product_is_sum: product_is_sum} = params) do
    invoice <> "<IsSum>#{product_is_sum}</IsSum>"
    |> build(params |> Map.drop([:product_is_sum]))
  end

  defp build(invoice, %{}) do
    invoice <> "</Product></Products>"
  end
end
