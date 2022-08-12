defmodule VnptInvoiceBuilder do
  def build(invoice_list) when is_list(invoice_list) do
    "<Invoices>"
    |> Kernel.<>(
      invoice_list
      |> Enum.map(fn invoice ->
        "<Inv>"
        |> build(invoice)
        |> Kernel.<>("</Inv>")
      end)
      |> Enum.join("")
    )
    |>  Kernel.<>("</Invoices>")
  end

  defp build(invoice, %{key: key} = invoice_list) do
    invoice <> "<key>#{key}</key>" <> "<Invoice>"
    |> build(invoice_list |> Map.drop([:key]))
  end

  defp build(invoice, %{customer_code: customer_code} = invoice_list) do
    invoice <> "<CusCode>#{customer_code}</CusCode>"
    |> build(invoice_list |> Map.drop([:customer_code]))
  end

  defp build(invoice, %{customer_name: customer_name} = invoice_list) do
    invoice <> "<CusName>#{customer_name}</CusName>"
    |> build(invoice_list |> Map.drop([:customer_name]))
  end

  defp build(invoice, %{customer_address: customer_address} = invoice_list) do
    invoice <> "<CusAddress>#{customer_address}</CusAddress>"
    |> build(invoice_list |> Map.drop([:customer_address]))
  end

  defp build(invoice, %{customer_phone: customer_phone} = invoice_list) do
    invoice <> "<CusPhone>#{customer_phone}</CusPhone>"
    |> build(invoice_list |> Map.drop([:customer_phone]))
  end

  defp build(invoice, %{customer_tax_code: customer_tax_code} = invoice_list) do
    invoice <> "<CusTaxCode>#{customer_tax_code}</CusTaxCode>"
    |> build(invoice_list |> Map.drop([:customer_tax_code]))
  end

  defp build(invoice, %{customer_bank_no: customer_bank_no} = invoice_list) do
    invoice <> "<CusBankNo>#{customer_bank_no}</CusBankNo>"
    |> build(invoice_list |> Map.drop([:customer_bank_no]))
  end

  defp build(invoice, %{customer_bank_name: customer_bank_name} = invoice_list) do
    invoice <> "<CusBankName>#{customer_bank_name}</CusBankName>"
    |> build(invoice_list |> Map.drop([:customer_bank_name]))
  end

  defp build(invoice, %{payment_method: payment_method} = invoice_list) do
    invoice <> "<PaymentMethod>#{payment_method}</PaymentMethod>"
    |> build(invoice_list |> Map.drop([:payment_method]))
  end

  defp build(invoice, %{kind_of_service: kind_of_service} = invoice_list) do
    invoice <> "<KindOfService>#{kind_of_service}</KindOfService>"
    |> build(invoice_list |> Map.drop([:kind_of_service]))
  end

  defp build(invoice, %{total: total} = invoice_list) do
    invoice <> "<Total>#{total}</Total>"
    |> build(invoice_list |> Map.drop([:total]))
  end

  defp build(invoice, %{discount_amount: discount_amount} = invoice_list) do
    invoice <> "<DiscountAmount>#{discount_amount}</DiscountAmount>"
    |> build(invoice_list |> Map.drop([:discount_amount]))
  end

  defp build(invoice, %{vat_rate: vat_rate} = invoice_list) do
    invoice <> "<VATRate>#{vat_rate}</VATRate>"
    |> build(invoice_list |> Map.drop([:vat_rate]))
  end

  defp build(invoice, %{vat_amount: vat_amount} = invoice_list) do
    invoice <> "<VATAmount>#{vat_amount}</VATAmount>"
    |> build(invoice_list |> Map.drop([:vat_amount]))
  end

  defp build(invoice, %{amount: amount} = invoice_list) do
    invoice <> "<Amount>#{amount}</Amount>"
    |> build(invoice_list |> Map.drop([:amount]))
  end

  defp build(invoice, %{amount_in_words: amount_in_words} = invoice_list) do
    invoice <> "<AmountInWords>#{amount_in_words}</AmountInWords>"
    |> build(invoice_list |> Map.drop([:amount_in_words]))
  end

  defp build(invoice, %{extra: extra} = invoice_list) do
    invoice <> "<Extra>#{extra}</Extra>"
    |> build(invoice_list |> Map.drop([:extra]))
  end

  defp build(invoice, %{arising_date: arising_date} = invoice_list) do
    invoice <> "<Extra>#{arising_date}</Extra>"
    |> build(invoice_list |> Map.drop([:arising_date]))
  end

  defp build(invoice, %{payment_status: payment_status} = invoice_list) do
    invoice <> "<PaymentStatus>#{payment_status}</PaymentStatus>"
    |> build(invoice_list |> Map.drop([:payment_status]))
  end

  defp build(invoice, %{email_deliver: email_deliver} = invoice_list) do
    invoice <> "<EmailDeliver>#{email_deliver}</EmailDeliver>"
    |> build(invoice_list |> Map.drop([:email_deliver]))
  end

  defp build(invoice, %{company_name: company_name} = invoice_list) do
    invoice <> "<ComName>#{company_name}</ComName>"
    |> build(invoice_list |> Map.drop([:company_name]))
  end

  defp build(invoice, %{company_address: company_address} = invoice_list) do
    invoice <> "<ComAddress>#{company_address}</ComAddress>"
    |> build(invoice_list |> Map.drop([:company_address]))
  end

  defp build(invoice, %{company_tax_code: company_tax_code} = invoice_list) do
    invoice <> "<ComTaxCode>#{company_tax_code}</ComTaxCode>"
    |> build(invoice_list |> Map.drop([:company_tax_code]))
  end

  defp build(invoice, %{company_fax: company_fax} = invoice_list) do
    invoice <> "<ComFax>#{company_fax}</ComFax>"
    |> build(invoice_list |> Map.drop([:company_fax]))
  end

  defp build(invoice, %{resource_code: resource_code} = invoice_list) do
    invoice <> "<ResourceCode>#{resource_code}</ResourceCode>"
    |> build(invoice_list |> Map.drop([:resource_code]))
  end

  defp build(invoice, %{gross_value_0: gross_value_0} = invoice_list) do
    invoice <> "<GrossValue0>#{gross_value_0}</GrossValue0>"
    |> build(invoice_list |> Map.drop([:gross_value_0]))
  end

  defp build(invoice, %{vat_amount_0: vat_amount_0} = invoice_list) do
    invoice <> "<VatAmount0>#{vat_amount_0}</VatAmount0>"
    |> build(invoice_list |> Map.drop([:vat_amount_0]))
  end

  defp build(invoice, %{gross_value_5: gross_value_5} = invoice_list) do
    invoice <> "<GrossValue5>#{gross_value_5}</GrossValue5>"
    |> build(invoice_list |> Map.drop([:gross_value_5]))
  end

  defp build(invoice, %{vat_amount_5: vat_amount_5} = invoice_list) do
    invoice <> "<VatAmount5>#{vat_amount_5}</VatAmount5>"
    |> build(invoice_list |> Map.drop([:vat_amount_5]))
  end

  defp build(invoice, %{gross_value_10: gross_value_10} = invoice_list) do
    invoice <> "<GrossValue10>#{gross_value_10}</GrossValue10>"
    |> build(invoice_list |> Map.drop([:gross_value_10]))
  end

  defp build(invoice, %{vat_amount_10: vat_amount_10} = invoice_list) do
    invoice <> "<VatAmount10>#{vat_amount_10}</VatAmount10>"
    |> build(invoice_list |> Map.drop([:vat_amount_10]))
  end

  defp build(invoice, %{buyer: buyer} = invoice_list) do
    invoice <> "<Buyer>#{buyer}</Buyer>"
    |> build(invoice_list |> Map.drop([:buyer]))
  end

  defp build(invoice, %{name: name} = invoice_list) do
    invoice <> "<Name>#{name}</Name>"
    |> build(invoice_list |> Map.drop([:name]))
  end

  defp build(invoice, %{company_phone: company_phone} = invoice_list) do
    invoice <> "<ComPhone>#{company_phone}</ComPhone>"
    |> build(invoice_list |> Map.drop([:company_phone]))
  end

  defp build(invoice, %{company_bank_name: company_bank_name} = invoice_list) do
    invoice <> "<ComBankName>#{company_bank_name}</ComBankName>"
    |> build(invoice_list |> Map.drop([:company_bank_name]))
  end

  defp build(invoice, %{company_bank_no: company_bank_no} = invoice_list) do
    invoice <> "<ComBankNo>#{company_bank_no}</ComBankNo>"
    |> build(invoice_list |> Map.drop([:company_bank_no]))
  end

  defp build(invoice, %{gross_value: gross_value} = invoice_list) do
    invoice <> "<GrossValue>#{gross_value}</GrossValue>"
    |> build(invoice_list |> Map.drop([:gross_value]))
  end

  defp build(invoice, %{create_date: create_date} = invoice_list) do
    invoice <> "<CreateDate>#{create_date}</CreateDate>"
    |> build(invoice_list |> Map.drop([:create_date]))
  end

  defp build(invoice, %{discount_rate: discount_rate} = invoice_list) do
    invoice <> "<DiscountRate>#{discount_rate}</DiscountRate>"
    |> build(invoice_list |> Map.drop([:discount_rate]))
  end

  defp build(invoice, %{customer_status: customer_status} = invoice_list) do
    invoice <> "<CusSignStatus>#{customer_status}</CusSignStatus>"
    |> build(invoice_list |> Map.drop([:customer_status]))
  end

  defp build(invoice, %{create_by: create_by} = invoice_list) do
    invoice <> "<CreateBy>#{create_by}</CreateBy>"
    |> build(invoice_list |> Map.drop([:create_by]))
  end

  defp build(invoice, %{publish_by: publish_by} = invoice_list) do
    invoice <> "<PublishBy>#{publish_by}</PublishBy>"
    |> build(invoice_list |> Map.drop([:publish_by]))
  end

  defp build(invoice, %{note: note} = invoice_list) do
    invoice <> "<Note>#{note}</Note>"
    |> build(invoice_list |> Map.drop([:note]))
  end

  defp build(invoice, %{process_invoice_note: process_invoice_note} = invoice_list) do
    invoice <> "<ProcessInvNote>#{process_invoice_note}</ProcessInvNote>"
    |> build(invoice_list |> Map.drop([:process_invoice_note]))
  end

  defp build(invoice, %{fkey: fkey} = invoice_list) do
    invoice <> "<Fkey>#{fkey}</Fkey>"
    |> build(invoice_list |> Map.drop([:fkey]))
  end

  defp build(invoice, %{gross_value_non_tax: gross_value_non_tax} = invoice_list) do
    invoice <> "<GrossValue_NonTax>#{gross_value_non_tax}</GrossValue_NonTax>"
    |> build(invoice_list |> Map.drop([:gross_value_non_tax]))
  end

  defp build(invoice, %{currency_unit: currency_unit} = invoice_list) do
    invoice <> "<CurrencyUnit>#{currency_unit}</CurrencyUnit>"
    |> build(invoice_list |> Map.drop([:currency_unit]))
  end

  defp build(invoice, %{exchange_rate: exchange_rate} = invoice_list) do
    invoice <> "<ExchangeRate>#{exchange_rate}</ExchangeRate>"
    |> build(invoice_list |> Map.drop([:exchange_rate]))
  end

  defp build(invoice, %{converted_amount: converted_amount} = invoice_list) do
    invoice <> "<ConvertedAmount>#{converted_amount}</ConvertedAmount>"
    |> build(invoice_list |> Map.drop([:converted_amount]))
  end

  defp build(invoice, %{extra_1: extra_1} = invoice_list) do
    invoice <> "<Extra1>#{extra_1}</Extra1>"
    |> build(invoice_list |> Map.drop([:extra_1]))
  end

  defp build(invoice, %{extra_2: extra_2} = invoice_list) do
    invoice <> "<Extra2>#{extra_2}</Extra2>"
    |> build(invoice_list |> Map.drop([:extra_2]))
  end

  defp build(invoice, %{sms_deliver: sms_deliver} = invoice_list) do
    invoice <> "<SMSDeliver>#{sms_deliver}</SMSDeliver>"
    |> build(invoice_list |> Map.drop([:sms_deliver]))
  end

  defp build(invoice, %{products: products}) do
    invoice <> VnptInvoiceProductBuilder.build(products) <> "</Invoice>"
  end
end
