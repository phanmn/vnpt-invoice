defmodule VnptInvoice.Invoice.Product.XmlBuilder do
  def build(products) when is_list(products) do
    "<Products>"
    |> Kernel.<>(
      products
      |> Enum.map(&build/1)
      |> Enum.join("")
    )
    |> Kernel.<>("</Products>")
  end

  def build(product = %VnptInvoice.Invoice.Product{}) do
    "<Product>"
      |> build(product)
      |> Kernel.<>("</Product>")
  end

  defp build(xml, %{product_name: product_name} = product) do
    (xml <> "<ProdName>#{product_name}</ProdName>")
    |> build(product |> Map.drop([:product_name]))
  end

  defp build(xml, %{product_unit: product_unit} = product) do
    (xml <> "<ProdUnit>#{product_unit}</ProdUnit>")
    |> build(product |> Map.drop([:product_unit]))
  end

  defp build(xml, %{product_quantity: product_quantity} = product) do
    (xml <> "<ProdQuantity>#{product_quantity}</ProdQuantity>")
    |> build(product |> Map.drop([:product_quantity]))
  end

  defp build(xml, %{product_price: product_price} = product) do
    (xml <> "<ProdPrice>#{product_price |> VnptInvoice.Number.to_string()}</ProdPrice>")
    |> build(product |> Map.drop([:product_price]))
  end

  defp build(xml, %{product_amount: product_amount} = product) do
    (xml <> "<Amount>#{product_amount}</Amount>")
    |> build(product |> Map.drop([:product_amount]))
  end

  defp build(xml, %{product_remark: product_remark} = product) do
    (xml <> "<Remark>#{product_remark}</Remark>")
    |> build(product |> Map.drop([:product_remark]))
  end

  defp build(xml, %{product_total: product_total} = product) do
    (xml <> "<Total>#{product_total}</Total>")
    |> build(product |> Map.drop([:product_total]))
  end

  defp build(xml, %{product_vat_rate: product_vat_rate} = product) do
    (xml <> "<VATRate>#{product_vat_rate}</VATRate>")
    |> build(product |> Map.drop([:product_vat_rate]))
  end

  defp build(xml, %{product_vat_amount: product_vat_amount} = product) do
    (xml <> "<VATAmount>#{product_vat_amount |> VnptInvoice.Number.to_string()}</VATAmount>")
    |> build(product |> Map.drop([:product_vat_amount]))
  end

  defp build(xml, %{product_extra_1: product_extra_1} = product) do
    (xml <> "<Extra1>#{product_extra_1}</Extra1>")
    |> build(product |> Map.drop([:product_extra_1]))
  end

  defp build(xml, %{product_extra_2: product_extra_2} = product) do
    (xml <> "<Extra2>#{product_extra_2}</Extra2>")
    |> build(product |> Map.drop([:product_extra_2]))
  end

  defp build(xml, %{product_discount: product_discount} = product) do
    (xml <> "<Discount>#{product_discount |> VnptInvoice.Number.to_string()}</Discount>")
    |> build(product |> Map.drop([:product_discount]))
  end

  defp build(xml, %{product_discount_amount: product_discount_amount} = product) do
    (xml <> "<DiscountAmount>#{product_discount_amount}</DiscountAmount>")
    |> build(product |> Map.drop([:product_discount_amount]))
  end

  defp build(xml, %{product_is_sum: product_is_sum} = product) do
    xml <> "<IsSum>#{product_is_sum}</IsSum>"
    |> build(product |> Map.drop([:product_is_sum]))
  end

  defp build(xml, _) do
    xml
  end
end
