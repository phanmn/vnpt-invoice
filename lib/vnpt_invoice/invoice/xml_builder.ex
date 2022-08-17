defmodule VnptInvoice.Invoice.XmlBuilder do
  def build([%VnptInvoice.Invoice{} | _] = invoices) do
    "<Invoices>"
    |> Kernel.<>(
      invoices
      |> Enum.map(&build/1)
      |> Enum.join("")
    )
    |> Kernel.<>("</Invoices>")
  end

  def build(invoice = %VnptInvoice.Invoice{}) do
    "<Inv>"
    |> build(invoice)
    |> Kernel.<>("</Inv>")
  end

  defp build(xml, %{key: key} = invoice) do
    (xml <> "<key>#{key}</key>" <> "<Invoice>")
    |> build(invoice |> Map.drop([:key]))
  end

  defp build(xml, %{customer_code: customer_code} = invoice) do
    (xml <> "<CusCode>#{customer_code}</CusCode>")
    |> build(invoice |> Map.drop([:customer_code]))
  end

  defp build(xml, %{customer_name: customer_name} = invoice) do
    (xml <> "<CusName>#{customer_name}</CusName>")
    |> build(invoice |> Map.drop([:customer_name]))
  end

  defp build(xml, %{customer_address: customer_address} = invoice) do
    (xml <> "<CusAddress>#{customer_address}</CusAddress>")
    |> build(invoice |> Map.drop([:customer_address]))
  end

  defp build(xml, %{customer_phone: customer_phone} = invoice) do
    (xml <> "<CusPhone>#{customer_phone}</CusPhone>")
    |> build(invoice |> Map.drop([:customer_phone]))
  end

  defp build(xml, %{customer_tax_code: customer_tax_code} = invoice) do
    (xml <> "<CusTaxCode>#{customer_tax_code}</CusTaxCode>")
    |> build(invoice |> Map.drop([:customer_tax_code]))
  end

  defp build(xml, %{customer_bank_no: customer_bank_no} = invoice) do
    (xml <> "<CusBankNo>#{customer_bank_no}</CusBankNo>")
    |> build(invoice |> Map.drop([:customer_bank_no]))
  end

  defp build(xml, %{customer_bank_name: customer_bank_name} = invoice) do
    (xml <> "<CusBankName>#{customer_bank_name}</CusBankName>")
    |> build(invoice |> Map.drop([:customer_bank_name]))
  end

  defp build(xml, %{payment_method: payment_method} = invoice) do
    (xml <> "<PaymentMethod>#{payment_method}</PaymentMethod>")
    |> build(invoice |> Map.drop([:payment_method]))
  end

  defp build(xml, %{kind_of_service: kind_of_service} = invoice) do
    (xml <> "<KindOfService>#{kind_of_service}</KindOfService>")
    |> build(invoice |> Map.drop([:kind_of_service]))
  end

  defp build(xml, %{total: total} = invoice) do
    (xml <> "<Total>#{total |> VnptInvoice.Number.to_string()}</Total>")
    |> build(invoice |> Map.drop([:total]))
  end

  defp build(xml, %{discount_amount: discount_amount} = invoice) do
    (xml <> "<DiscountAmount>#{discount_amount |> VnptInvoice.Number.to_string()}</DiscountAmount>")
    |> build(invoice |> Map.drop([:discount_amount]))
  end

  defp build(xml, %{vat_rate: vat_rate} = invoice) do
    (xml <> "<VATRate>#{vat_rate |> VnptInvoice.Number.to_string()}</VATRate>")
    |> build(invoice |> Map.drop([:vat_rate]))
  end

  defp build(xml, %{vat_amount: vat_amount} = invoice) do
    (xml <> "<VATAmount>#{vat_amount |> VnptInvoice.Number.to_string()}</VATAmount>")
    |> build(invoice |> Map.drop([:vat_amount]))
  end

  defp build(xml, %{amount: amount} = invoice) do
    (xml <> "<Amount>#{amount |> VnptInvoice.Number.to_string()}</Amount>")
    |> build(invoice |> Map.drop([:amount]))
  end

  defp build(xml, %{amount_in_words: amount_in_words} = invoice) do
    (xml <> "<AmountInWords>#{amount_in_words}</AmountInWords>")
    |> build(invoice |> Map.drop([:amount_in_words]))
  end

  defp build(xml, %{extra: extra} = invoice) do
    (xml <> "<Extra>#{extra}</Extra>")
    |> build(invoice |> Map.drop([:extra]))
  end

  defp build(xml, %{arising_date: arising_date} = invoice) do
    (xml <> "<Extra>#{arising_date}</Extra>")
    |> build(invoice |> Map.drop([:arising_date]))
  end

  defp build(xml, %{payment_status: payment_status} = invoice) do
    (xml <> "<PaymentStatus>#{payment_status}</PaymentStatus>")
    |> build(invoice |> Map.drop([:payment_status]))
  end

  defp build(xml, %{email_deliver: email_deliver} = invoice) do
    (xml <> "<EmailDeliver>#{email_deliver}</EmailDeliver>")
    |> build(invoice |> Map.drop([:email_deliver]))
  end

  defp build(xml, %{company_name: company_name} = invoice) do
    (xml <> "<ComName>#{company_name}</ComName>")
    |> build(invoice |> Map.drop([:company_name]))
  end

  defp build(xml, %{company_address: company_address} = invoice) do
    (xml <> "<ComAddress>#{company_address}</ComAddress>")
    |> build(invoice |> Map.drop([:company_address]))
  end

  defp build(xml, %{company_tax_code: company_tax_code} = invoice) do
    (xml <> "<ComTaxCode>#{company_tax_code}</ComTaxCode>")
    |> build(invoice |> Map.drop([:company_tax_code]))
  end

  defp build(xml, %{company_fax: company_fax} = invoice) do
    (xml <> "<ComFax>#{company_fax}</ComFax>")
    |> build(invoice |> Map.drop([:company_fax]))
  end

  defp build(xml, %{resource_code: resource_code} = invoice) do
    (xml <> "<ResourceCode>#{resource_code}</ResourceCode>")
    |> build(invoice |> Map.drop([:resource_code]))
  end

  defp build(xml, %{gross_value_0: gross_value_0} = invoice) do
    (xml <> "<GrossValue0>#{gross_value_0 |> VnptInvoice.Number.to_string()}</GrossValue0>")
    |> build(invoice |> Map.drop([:gross_value_0]))
  end

  defp build(xml, %{vat_amount_0: vat_amount_0} = invoice) do
    (xml <> "<VatAmount0>#{vat_amount_0 |> VnptInvoice.Number.to_string()}</VatAmount0>")
    |> build(invoice |> Map.drop([:vat_amount_0]))
  end

  defp build(xml, %{gross_value_5: gross_value_5} = invoice) do
    (xml <> "<GrossValue5>#{gross_value_5 |> VnptInvoice.Number.to_string()}</GrossValue5>")
    |> build(invoice |> Map.drop([:gross_value_5]))
  end

  defp build(xml, %{vat_amount_5: vat_amount_5} = invoice) do
    (xml <> "<VatAmount5>#{vat_amount_5 |> VnptInvoice.Number.to_string()}</VatAmount5>")
    |> build(invoice |> Map.drop([:vat_amount_5]))
  end

  defp build(xml, %{gross_value_10: gross_value_10} = invoice) do
    (xml <> "<GrossValue10>#{gross_value_10 |> VnptInvoice.Number.to_string()}</GrossValue10>")
    |> build(invoice |> Map.drop([:gross_value_10]))
  end

  defp build(xml, %{vat_amount_10: vat_amount_10} = invoice) do
    (xml <> "<VatAmount10>#{vat_amount_10 |> VnptInvoice.Number.to_string()}</VatAmount10>")
    |> build(invoice |> Map.drop([:vat_amount_10]))
  end

  defp build(xml, %{buyer: buyer} = invoice) do
    (xml <> "<Buyer>#{buyer}</Buyer>")
    |> build(invoice |> Map.drop([:buyer]))
  end

  defp build(xml, %{name: name} = invoice) do
    (xml <> "<Name>#{name}</Name>")
    |> build(invoice |> Map.drop([:name]))
  end

  defp build(xml, %{company_phone: company_phone} = invoice) do
    (xml <> "<ComPhone>#{company_phone}</ComPhone>")
    |> build(invoice |> Map.drop([:company_phone]))
  end

  defp build(xml, %{company_bank_name: company_bank_name} = invoice) do
    (xml <> "<ComBankName>#{company_bank_name}</ComBankName>")
    |> build(invoice |> Map.drop([:company_bank_name]))
  end

  defp build(xml, %{company_bank_no: company_bank_no} = invoice) do
    (xml <> "<ComBankNo>#{company_bank_no}</ComBankNo>")
    |> build(invoice |> Map.drop([:company_bank_no]))
  end

  defp build(xml, %{gross_value: gross_value} = invoice) do
    (xml <> "<GrossValue>#{gross_value}</GrossValue>")
    |> build(invoice |> Map.drop([:gross_value]))
  end

  defp build(xml, %{create_date: create_date} = invoice) do
    (xml <> "<CreateDate>#{create_date}</CreateDate>")
    |> build(invoice |> Map.drop([:create_date]))
  end

  defp build(xml, %{discount_rate: discount_rate} = invoice) do
    (xml <> "<DiscountRate>#{discount_rate |> VnptInvoice.Number.to_string()}</DiscountRate>")
    |> build(invoice |> Map.drop([:discount_rate]))
  end

  defp build(xml, %{customer_status: customer_status} = invoice) do
    (xml <> "<CusSignStatus>#{customer_status}</CusSignStatus>")
    |> build(invoice |> Map.drop([:customer_status]))
  end

  defp build(xml, %{create_by: create_by} = invoice) do
    (xml <> "<CreateBy>#{create_by}</CreateBy>")
    |> build(invoice |> Map.drop([:create_by]))
  end

  defp build(xml, %{publish_by: publish_by} = invoice) do
    (xml <> "<PublishBy>#{publish_by}</PublishBy>")
    |> build(invoice |> Map.drop([:publish_by]))
  end

  defp build(xml, %{note: note} = invoice) do
    (xml <> "<Note>#{note}</Note>")
    |> build(invoice |> Map.drop([:note]))
  end

  defp build(xml, %{process_invoice_note: process_invoice_note} = invoice) do
    (xml <> "<ProcessInvNote>#{process_invoice_note}</ProcessInvNote>")
    |> build(invoice |> Map.drop([:process_invoice_note]))
  end

  defp build(xml, %{fkey: fkey} = invoice) do
    (xml <> "<Fkey>#{fkey}</Fkey>")
    |> build(invoice |> Map.drop([:fkey]))
  end

  defp build(xml, %{gross_value_non_tax: gross_value_non_tax} = invoice) do
    (xml <> "<GrossValue_NonTax>#{gross_value_non_tax}</GrossValue_NonTax>")
    |> build(invoice |> Map.drop([:gross_value_non_tax]))
  end

  defp build(xml, %{currency_unit: currency_unit} = invoice) do
    (xml <> "<CurrencyUnit>#{currency_unit}</CurrencyUnit>")
    |> build(invoice |> Map.drop([:currency_unit]))
  end

  defp build(xml, %{exchange_rate: exchange_rate} = invoice) do
    (xml <> "<ExchangeRate>#{exchange_rate |> VnptInvoice.Number.to_string()}</ExchangeRate>")
    |> build(invoice |> Map.drop([:exchange_rate]))
  end

  defp build(xml, %{converted_amount: converted_amount} = invoice) do
    (xml <> "<ConvertedAmount>#{converted_amount |> VnptInvoice.Number.to_string()}</ConvertedAmount>")
    |> build(invoice |> Map.drop([:converted_amount]))
  end

  defp build(xml, %{extra_1: extra_1} = invoice) do
    (xml <> "<Extra1>#{extra_1}</Extra1>")
    |> build(invoice |> Map.drop([:extra_1]))
  end

  defp build(xml, %{extra_2: extra_2} = invoice) do
    (xml <> "<Extra2>#{extra_2}</Extra2>")
    |> build(invoice |> Map.drop([:extra_2]))
  end

  defp build(xml, %{sms_deliver: sms_deliver} = invoice) do
    (xml <> "<SMSDeliver>#{sms_deliver}</SMSDeliver>")
    |> build(invoice |> Map.drop([:sms_deliver]))
  end

  defp build(xml, %{products: products}) do
    xml <> VnptInvoice.Invoice.Product.XmlBuilder.build(products) <> "</Invoice>"
  end
end
