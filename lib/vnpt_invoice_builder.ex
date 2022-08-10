defmodule VnptInvoiceBuilder do
  def build(params) when is_map(params) do
    "<Invoices><Inv>"
    |> build(params)
  end

  defp build(invoice, %{key: key} = params) do
    invoice <> "<key>#{key}</key>" <> "<Invoice>"
    |> build(params |> Map.drop([:key]))
  end

  defp build(invoice, %{customer_code: customer_code} = params) do
    invoice <> "<CusCode>#{customer_code}</CusCode>"
    |> build(params |> Map.drop([:customer_code]))
  end

  defp build(invoice, %{customer_name: customer_name} = params) do
    invoice <> "<CusName>#{customer_name}</CusName>"
    |> build(params |> Map.drop([:customer_name]))
  end

  defp build(invoice, %{customer_address: customer_address} = params) do
    invoice <> "<CusAddress>#{customer_address}</CusAddress>"
    |> build(params |> Map.drop([:customer_address]))
  end

  defp build(invoice, %{customer_phone: customer_phone} = params) do
    invoice <> "<CusPhone>#{customer_phone}</CusPhone>"
    |> build(params |> Map.drop([:customer_phone]))
  end

  defp build(invoice, %{customer_tax_code: customer_tax_code} = params) do
    invoice <> "<CusTaxCode>#{customer_tax_code}</CusTaxCode>"
    |> build(params |> Map.drop([:customer_tax_code]))
  end

  defp build(invoice, %{payment_method: payment_method} = params) do
    invoice <> "<PaymentMethod>#{payment_method}</PaymentMethod>"
    |> build(params |> Map.drop([:payment_method]))
  end

  defp build(invoice, %{kind_of_service: kind_of_service} = params) do
    invoice <> "<KindOfService>#{kind_of_service}</KindOfService>"
    |> build(params |> Map.drop([:kind_of_service]))
  end

  defp build(invoice, %{total: total} = params) do
    invoice <> "<Total>#{total}</Total>"
    |> build(params |> Map.drop([:total]))
  end

  defp build(invoice, %{discount_amount: discount_amount} = params) do
    invoice <> "<DiscountAmount>#{discount_amount}</DiscountAmount>"
    |> build(params |> Map.drop([:discount_amount]))
  end

  defp build(invoice, %{vat_rate: vat_rate} = params) do
    invoice <> "<VATRate>#{vat_rate}</VATRate>"
    |> build(params |> Map.drop([:vat_rate]))
  end

  defp build(invoice, %{vat_amount: vat_amount} = params) do
    invoice <> "<VATAmount>#{vat_amount}</VATAmount>"
    |> build(params |> Map.drop([:vat_amount]))
  end

  defp build(invoice, %{amount: amount} = params) do
    invoice <> "<Amount>#{amount}</Amount>"
    |> build(params |> Map.drop([:amount]))
  end

  defp build(invoice, %{amount_in_words: amount_in_words} = params) do
    invoice <> "<AmountInWords>#{amount_in_words}</AmountInWords>"
    |> build(params |> Map.drop([:amount_in_words]))
  end

  defp build(invoice, %{extra: extra} = params) do
    invoice <> "<Extra>#{extra}</Extra>"
    |> build(params |> Map.drop([:extra]))
  end

  defp build(invoice, %{arising_date: arising_date} = params) do
    invoice <> "<Extra>#{arising_date}</Extra>"
    |> build(params |> Map.drop([:arising_date]))
  end

  defp build(invoice, %{payment_status: payment_status} = params) do
    invoice <> "<PaymentStatus>#{payment_status}</PaymentStatus>"
    |> build(params |> Map.drop([:payment_status]))
  end

  defp build(invoice, %{email_deliver: email_deliver} = params) do
    invoice <> "<EmailDeliver>#{email_deliver}</EmailDeliver>"
    |> build(params |> Map.drop([:email_deliver]))
  end

  defp build(invoice, %{company_name: company_name} = params) do
    invoice <> "<ComName>#{company_name}</ComName>"
    |> build(params |> Map.drop([:company_name]))
  end

  defp build(invoice, %{company_address: company_address} = params) do
    invoice <> "<ComAddress>#{company_address}</ComAddress>"
    |> build(params |> Map.drop([:company_address]))
  end

  defp build(invoice, %{company_tax_code: company_tax_code} = params) do
    invoice <> "<ComTaxCode>#{company_tax_code}</ComTaxCode>"
    |> build(params |> Map.drop([:company_tax_code]))
  end

  defp build(invoice, %{company_fax: company_fax} = params) do
    invoice <> "<ComFax>#{company_fax}</ComFax>"
    |> build(params |> Map.drop([:company_fax]))
  end

  defp build(invoice, %{resource_code: resource_code} = params) do
    invoice <> "<ResourceCode>#{resource_code}</ResourceCode>"
    |> build(params |> Map.drop([:resource_code]))
  end

  defp build(invoice, %{gross_value_0: gross_value_0} = params) do
    invoice <> "<GrossValue0>#{gross_value_0}</GrossValue0>"
    |> build(params |> Map.drop([:gross_value_0]))
  end

  defp build(invoice, %{vat_amount_0: vat_amount_0} = params) do
    invoice <> "<VatAmount0>#{vat_amount_0}</VatAmount0>"
    |> build(params |> Map.drop([:vat_amount_0]))
  end

  defp build(invoice, %{gross_value_5: gross_value_5} = params) do
    invoice <> "<GrossValue5>#{gross_value_5}</GrossValue5>"
    |> build(params |> Map.drop([:gross_value_5]))
  end

  defp build(invoice, %{vat_amount_5: vat_amount_5} = params) do
    invoice <> "<VatAmount5>#{vat_amount_5}</VatAmount5>"
    |> build(params |> Map.drop([:vat_amount_5]))
  end

  defp build(invoice, %{gross_value_10: gross_value_10} = params) do
    invoice <> "<GrossValue10>#{gross_value_10}</GrossValue10>"
    |> build(params |> Map.drop([:gross_value_10]))
  end

  defp build(invoice, %{vat_amount_10: vat_amount_10} = params) do
    invoice <> "<VatAmount10>#{vat_amount_10}</VatAmount10>"
    |> build(params |> Map.drop([:vat_amount_10]))
  end

  defp build(invoice, %{buyer: buyer} = params) do
    invoice <> "<Buyer>#{buyer}</Buyer>"
    |> build(params |> Map.drop([:buyer]))
  end

  defp build(invoice, %{name: name} = params) do
    invoice <> "<Name>#{name}</Name>"
    |> build(params |> Map.drop([:name]))
  end

  defp build(invoice, %{company_phone: company_phone} = params) do
    invoice <> "<ComPhone>#{company_phone}</ComPhone>"
    |> build(params |> Map.drop([:company_phone]))
  end

  defp build(invoice, %{company_bank_name: company_bank_name} = params) do
    invoice <> "<ComBankName>#{company_bank_name}</ComBankName>"
    |> build(params |> Map.drop([:company_bank_name]))
  end

  defp build(invoice, %{company_bank_no: company_bank_no} = params) do
    invoice <> "<ComBankNo>#{company_bank_no}</ComBankNo>"
    |> build(params |> Map.drop([:company_bank_no]))
  end

  defp build(invoice, %{gross_value: gross_value} = params) do
    invoice <> "<GrossValue>#{gross_value}</GrossValue>"
    |> build(params |> Map.drop([:gross_value]))
  end

  defp build(invoice, %{create_date: create_date} = params) do
    invoice <> "<CreateDate>#{create_date}</CreateDate>"
    |> build(params |> Map.drop([:create_date]))
  end

  defp build(invoice, %{discount_rate: discount_rate} = params) do
    invoice <> "<DiscountRate>#{discount_rate}</DiscountRate>"
    |> build(params |> Map.drop([:discount_rate]))
  end

  defp build(invoice, %{customer_status: customer_status} = params) do
    invoice <> "<CusSignStatus>#{customer_status}</CusSignStatus>"
    |> build(params |> Map.drop([:customer_status]))
  end

  defp build(invoice, %{create_by: create_by} = params) do
    invoice <> "<CreateBy>#{create_by}</CreateBy>"
    |> build(params |> Map.drop([:create_by]))
  end

  defp build(invoice, %{publish_by: publish_by} = params) do
    invoice <> "<PublishBy>#{publish_by}</PublishBy>"
    |> build(params |> Map.drop([:publish_by]))
  end

  defp build(invoice, %{note: note} = params) do
    invoice <> "<Note>#{note}</Note>"
    |> build(params |> Map.drop([:note]))
  end

  defp build(invoice, %{process_invoice_note: process_invoice_note} = params) do
    invoice <> "<ProcessInvNote>#{process_invoice_note}</ProcessInvNote>"
    |> build(params |> Map.drop([:process_invoice_note]))
  end

  defp build(invoice, %{fkey: fkey} = params) do
    invoice <> "<Fkey>#{fkey}</Fkey>"
    |> build(params |> Map.drop([:fkey]))
  end

  defp build(invoice, %{gross_value_non_tax: gross_value_non_tax} = params) do
    invoice <> "<GrossValue_NonTax>#{gross_value_non_tax}</GrossValue_NonTax>"
    |> build(params |> Map.drop([:gross_value_non_tax]))
  end

  defp build(invoice, %{currency_unit: currency_unit} = params) do
    invoice <> "<CurrencyUnit>#{currency_unit}</CurrencyUnit>"
    |> build(params |> Map.drop([:currency_unit]))
  end

  defp build(invoice, %{exchange_rate: exchange_rate} = params) do
    invoice <> "<ExchangeRate>#{exchange_rate}</ExchangeRate>"
    |> build(params |> Map.drop([:exchange_rate]))
  end

  defp build(invoice, %{converted_amount: converted_amount} = params) do
    invoice <> "<ConvertedAmount>#{converted_amount}</ConvertedAmount>"
    |> build(params |> Map.drop([:converted_amount]))
  end

  defp build(invoice, %{extra_1: extra_1} = params) do
    invoice <> "<Extra1>#{extra_1}</Extra1>"
    |> build(params |> Map.drop([:extra_1]))
  end

  defp build(invoice, %{extra_2: extra_2} = params) do
    invoice <> "<Extra2>#{extra_2}</Extra2>"
    |> build(params |> Map.drop([:extra_2]))
  end

  defp build(invoice, %{sms_deliver: sms_deliver} = params) do
    invoice <> "<SMSDeliver>#{sms_deliver}</SMSDeliver>"
    |> build(params |> Map.drop([:sms_deliver]))
  end

  defp build(invoice, %{}) do
    invoice <> "</Invoice></Inv></Invoices>"
  end
end
