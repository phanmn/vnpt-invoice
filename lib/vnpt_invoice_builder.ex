defmodule VnptInvoiceBuilder do
  def build(invoice_struct, products_struct) when is_map(invoice_struct) and is_list(products_struct) do
    "<Invoices><Inv>"
    |> build(invoice_struct)
  end

  defp build(invoice, %{key: key} = invoice_struct, products_struct) do
    invoice <> "<key>#{key}</key>" <> "<Invoice>"
    |> build(invoice_struct |> Map.drop([:key]), products_struct)
  end

  defp build(invoice, %{customer_code: customer_code} = invoice_struct, products_struct) do
    invoice <> "<CusCode>#{customer_code}</CusCode>"
    |> build(invoice_struct |> Map.drop([:customer_code]), products_struct)
  end

  defp build(invoice, %{customer_name: customer_name} = invoice_struct, products_struct) do
    invoice <> "<CusName>#{customer_name}</CusName>"
    |> build(invoice_struct |> Map.drop([:customer_name]), products_struct)
  end

  defp build(invoice, %{customer_address: customer_address} = invoice_struct, products_struct) do
    invoice <> "<CusAddress>#{customer_address}</CusAddress>"
    |> build(invoice_struct |> Map.drop([:customer_address]), products_struct)
  end

  defp build(invoice, %{customer_phone: customer_phone} = invoice_struct, products_struct) do
    invoice <> "<CusPhone>#{customer_phone}</CusPhone>"
    |> build(invoice_struct |> Map.drop([:customer_phone]), products_struct)
  end

  defp build(invoice, %{customer_tax_code: customer_tax_code} = invoice_struct, products_struct) do
    invoice <> "<CusTaxCode>#{customer_tax_code}</CusTaxCode>"
    |> build(invoice_struct |> Map.drop([:customer_tax_code]), products_struct)
  end

  defp build(invoice, %{payment_method: payment_method} = invoice_struct, products_struct) do
    invoice <> "<PaymentMethod>#{payment_method}</PaymentMethod>"
    |> build(invoice_struct |> Map.drop([:payment_method]), products_struct)
  end

  defp build(invoice, %{kind_of_service: kind_of_service} = invoice_struct, products_struct) do
    invoice <> "<KindOfService>#{kind_of_service}</KindOfService>"
    |> build(invoice_struct |> Map.drop([:kind_of_service]), products_struct)
  end

  defp build(invoice, %{total: total} = invoice_struct, products_struct) do
    invoice <> "<Total>#{total}</Total>"
    |> build(invoice_struct |> Map.drop([:total]), products_struct)
  end

  defp build(invoice, %{discount_amount: discount_amount} = invoice_struct, products_struct) do
    invoice <> "<DiscountAmount>#{discount_amount}</DiscountAmount>"
    |> build(invoice_struct |> Map.drop([:discount_amount]), products_struct)
  end

  defp build(invoice, %{vat_rate: vat_rate} = invoice_struct, products_struct) do
    invoice <> "<VATRate>#{vat_rate}</VATRate>"
    |> build(invoice_struct |> Map.drop([:vat_rate]), products_struct)
  end

  defp build(invoice, %{vat_amount: vat_amount} = invoice_struct, products_struct) do
    invoice <> "<VATAmount>#{vat_amount}</VATAmount>"
    |> build(invoice_struct |> Map.drop([:vat_amount]), products_struct)
  end

  defp build(invoice, %{amount: amount} = invoice_struct, products_struct) do
    invoice <> "<Amount>#{amount}</Amount>"
    |> build(invoice_struct |> Map.drop([:amount]), products_struct)
  end

  defp build(invoice, %{amount_in_words: amount_in_words} = invoice_struct, products_struct) do
    invoice <> "<AmountInWords>#{amount_in_words}</AmountInWords>"
    |> build(invoice_struct |> Map.drop([:amount_in_words]), products_struct)
  end

  defp build(invoice, %{extra: extra} = invoice_struct, products_struct) do
    invoice <> "<Extra>#{extra}</Extra>"
    |> build(invoice_struct |> Map.drop([:extra]), products_struct)
  end

  defp build(invoice, %{arising_date: arising_date} = invoice_struct, products_struct) do
    invoice <> "<Extra>#{arising_date}</Extra>"
    |> build(invoice_struct |> Map.drop([:arising_date]), products_struct)
  end

  defp build(invoice, %{payment_status: payment_status} = invoice_struct, products_struct) do
    invoice <> "<PaymentStatus>#{payment_status}</PaymentStatus>"
    |> build(invoice_struct |> Map.drop([:payment_status]), products_struct)
  end

  defp build(invoice, %{email_deliver: email_deliver} = invoice_struct, products_struct) do
    invoice <> "<EmailDeliver>#{email_deliver}</EmailDeliver>"
    |> build(invoice_struct |> Map.drop([:email_deliver]), products_struct)
  end

  defp build(invoice, %{company_name: company_name} = invoice_struct, products_struct) do
    invoice <> "<ComName>#{company_name}</ComName>"
    |> build(invoice_struct |> Map.drop([:company_name]), products_struct)
  end

  defp build(invoice, %{company_address: company_address} = invoice_struct, products_struct) do
    invoice <> "<ComAddress>#{company_address}</ComAddress>"
    |> build(invoice_struct |> Map.drop([:company_address]), products_struct)
  end

  defp build(invoice, %{company_tax_code: company_tax_code} = invoice_struct, products_struct) do
    invoice <> "<ComTaxCode>#{company_tax_code}</ComTaxCode>"
    |> build(invoice_struct |> Map.drop([:company_tax_code]), products_struct)
  end

  defp build(invoice, %{company_fax: company_fax} = invoice_struct, products_struct) do
    invoice <> "<ComFax>#{company_fax}</ComFax>"
    |> build(invoice_struct |> Map.drop([:company_fax]), products_struct)
  end

  defp build(invoice, %{resource_code: resource_code} = invoice_struct, products_struct) do
    invoice <> "<ResourceCode>#{resource_code}</ResourceCode>"
    |> build(invoice_struct |> Map.drop([:resource_code]), products_struct)
  end

  defp build(invoice, %{gross_value_0: gross_value_0} = invoice_struct, products_struct) do
    invoice <> "<GrossValue0>#{gross_value_0}</GrossValue0>"
    |> build(invoice_struct |> Map.drop([:gross_value_0]), products_struct)
  end

  defp build(invoice, %{vat_amount_0: vat_amount_0} = invoice_struct, products_struct) do
    invoice <> "<VatAmount0>#{vat_amount_0}</VatAmount0>"
    |> build(invoice_struct |> Map.drop([:vat_amount_0]), products_struct)
  end

  defp build(invoice, %{gross_value_5: gross_value_5} = invoice_struct, products_struct) do
    invoice <> "<GrossValue5>#{gross_value_5}</GrossValue5>"
    |> build(invoice_struct |> Map.drop([:gross_value_5]), products_struct)
  end

  defp build(invoice, %{vat_amount_5: vat_amount_5} = invoice_struct, products_struct) do
    invoice <> "<VatAmount5>#{vat_amount_5}</VatAmount5>"
    |> build(invoice_struct |> Map.drop([:vat_amount_5]), products_struct)
  end

  defp build(invoice, %{gross_value_10: gross_value_10} = invoice_struct, products_struct) do
    invoice <> "<GrossValue10>#{gross_value_10}</GrossValue10>"
    |> build(invoice_struct |> Map.drop([:gross_value_10]), products_struct)
  end

  defp build(invoice, %{vat_amount_10: vat_amount_10} = invoice_struct, products_struct) do
    invoice <> "<VatAmount10>#{vat_amount_10}</VatAmount10>"
    |> build(invoice_struct |> Map.drop([:vat_amount_10]), products_struct)
  end

  defp build(invoice, %{buyer: buyer} = invoice_struct, products_struct) do
    invoice <> "<Buyer>#{buyer}</Buyer>"
    |> build(invoice_struct |> Map.drop([:buyer]), products_struct)
  end

  defp build(invoice, %{name: name} = invoice_struct, products_struct) do
    invoice <> "<Name>#{name}</Name>"
    |> build(invoice_struct |> Map.drop([:name]), products_struct)
  end

  defp build(invoice, %{company_phone: company_phone} = invoice_struct, products_struct) do
    invoice <> "<ComPhone>#{company_phone}</ComPhone>"
    |> build(invoice_struct |> Map.drop([:company_phone]), products_struct)
  end

  defp build(invoice, %{company_bank_name: company_bank_name} = invoice_struct, products_struct) do
    invoice <> "<ComBankName>#{company_bank_name}</ComBankName>"
    |> build(invoice_struct |> Map.drop([:company_bank_name]), products_struct)
  end

  defp build(invoice, %{company_bank_no: company_bank_no} = invoice_struct, products_struct) do
    invoice <> "<ComBankNo>#{company_bank_no}</ComBankNo>"
    |> build(invoice_struct |> Map.drop([:company_bank_no]), products_struct)
  end

  defp build(invoice, %{gross_value: gross_value} = invoice_struct, products_struct) do
    invoice <> "<GrossValue>#{gross_value}</GrossValue>"
    |> build(invoice_struct |> Map.drop([:gross_value]), products_struct)
  end

  defp build(invoice, %{create_date: create_date} = invoice_struct, products_struct) do
    invoice <> "<CreateDate>#{create_date}</CreateDate>"
    |> build(invoice_struct |> Map.drop([:create_date]), products_struct)
  end

  defp build(invoice, %{discount_rate: discount_rate} = invoice_struct, products_struct) do
    invoice <> "<DiscountRate>#{discount_rate}</DiscountRate>"
    |> build(invoice_struct |> Map.drop([:discount_rate]), products_struct)
  end

  defp build(invoice, %{customer_status: customer_status} = invoice_struct, products_struct) do
    invoice <> "<CusSignStatus>#{customer_status}</CusSignStatus>"
    |> build(invoice_struct |> Map.drop([:customer_status]), products_struct)
  end

  defp build(invoice, %{create_by: create_by} = invoice_struct, products_struct) do
    invoice <> "<CreateBy>#{create_by}</CreateBy>"
    |> build(invoice_struct |> Map.drop([:create_by]), products_struct)
  end

  defp build(invoice, %{publish_by: publish_by} = invoice_struct, products_struct) do
    invoice <> "<PublishBy>#{publish_by}</PublishBy>"
    |> build(invoice_struct |> Map.drop([:publish_by]), products_struct)
  end

  defp build(invoice, %{note: note} = invoice_struct, products_struct) do
    invoice <> "<Note>#{note}</Note>"
    |> build(invoice_struct |> Map.drop([:note]), products_struct)
  end

  defp build(invoice, %{process_invoice_note: process_invoice_note} = invoice_struct, products_struct) do
    invoice <> "<ProcessInvNote>#{process_invoice_note}</ProcessInvNote>"
    |> build(invoice_struct |> Map.drop([:process_invoice_note]), products_struct)
  end

  defp build(invoice, %{fkey: fkey} = invoice_struct, products_struct) do
    invoice <> "<Fkey>#{fkey}</Fkey>"
    |> build(invoice_struct |> Map.drop([:fkey]), products_struct)
  end

  defp build(invoice, %{gross_value_non_tax: gross_value_non_tax} = invoice_struct, products_struct) do
    invoice <> "<GrossValue_NonTax>#{gross_value_non_tax}</GrossValue_NonTax>"
    |> build(invoice_struct |> Map.drop([:gross_value_non_tax]), products_struct)
  end

  defp build(invoice, %{currency_unit: currency_unit} = invoice_struct, products_struct) do
    invoice <> "<CurrencyUnit>#{currency_unit}</CurrencyUnit>"
    |> build(invoice_struct |> Map.drop([:currency_unit]), products_struct)
  end

  defp build(invoice, %{exchange_rate: exchange_rate} = invoice_struct, products_struct) do
    invoice <> "<ExchangeRate>#{exchange_rate}</ExchangeRate>"
    |> build(invoice_struct |> Map.drop([:exchange_rate]), products_struct)
  end

  defp build(invoice, %{converted_amount: converted_amount} = invoice_struct, products_struct) do
    invoice <> "<ConvertedAmount>#{converted_amount}</ConvertedAmount>"
    |> build(invoice_struct |> Map.drop([:converted_amount]), products_struct)
  end

  defp build(invoice, %{extra_1: extra_1} = invoice_struct, products_struct) do
    invoice <> "<Extra1>#{extra_1}</Extra1>"
    |> build(invoice_struct |> Map.drop([:extra_1]), products_struct)
  end

  defp build(invoice, %{extra_2: extra_2} = invoice_struct, products_struct) do
    invoice <> "<Extra2>#{extra_2}</Extra2>"
    |> build(invoice_struct |> Map.drop([:extra_2]), products_struct)
  end

  defp build(invoice, %{sms_deliver: sms_deliver} = invoice_struct, products_struct) do
    invoice <> "<SMSDeliver>#{sms_deliver}</SMSDeliver>"
    |> build(invoice_struct |> Map.drop([:sms_deliver]), products_struct)
  end

  defp build(invoice, %{} = invoice_struct, products_struct) when (invoice_struct |> map_size() == 0) do
    invoice <> VnptInvoiceProductBuilder.build(products_struct) <> "</Invoice></Inv></Invoices>"
  end
end
