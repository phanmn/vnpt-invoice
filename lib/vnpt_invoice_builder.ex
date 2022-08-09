defmodule VnptInvoiceBuilder do
  def build() do
    """
    <Invoices>
      <Inv>
    """
    |> key("123")
    |> Kernel.<>("\n<Invoice>")
    |> customer_code("abc123")
    |> customer_address("35 Nguyen Hue")
    |> Kernel.<>("\n</Invoice>")
    |> Kernel.<>("\n</Inv>")
    |> Kernel.<>("\n</Invoices>")
  end

  defp key(invoice, key) do
    invoice <> "\n" <> "<key>#{key}</key>"
  end

  defp customer_code(invoice, code) do
    invoice <> "\n" <> "<CusCode>#{code}</CusCode>"
  end

  defp customer_address(invoice, address) do
    invoice <> "\n" <> "<CusAddress>#{address}</CusAddress>"
  end

  defp customer_phone(invoice, phone) do
    invoice <> "\n" <> "<CusPhone>#{phone}</CusPhone>"
  end

  defp customer_tax_code(invoice, code) do
    invoice <> "\n" <> "<CusTaxCode>#{code}</CusTaxCode>"
  end

  defp payment_method(invoice, method) do
    invoice <> "\n" <> "<PaymentMethod>#{method}</PaymentMethod>"
  end

  defp kind_of_service(invoice, kind) do
    invoice <> "\n" <> "<KindOfService>#{kind}</KindOfService>"
  end

  defp product_name(invoice, name) do
    invoice <> "\n" <> "<ProdName>#{name}</ProdName>"
  end

  defp product_unit(invoice, unit) do
    invoice <> "\n" <> "<ProdUnit>#{unit}</ProdUnit>"
  end

  defp product_quantity(invoice, quantity) do
    invoice <> "\n" <> "<ProdQuantity>#{quantity}</ProdQuantity>"
  end

  defp product_price(invoice, price) do
    invoice <> "\n" <> "<ProdPrice>#{price}</ProdPrice>"
  end

  defp product_amount(invoice, amount) do
    invoice <> "\n" <> "<Amount>#{amount}</Amount>"
  end

  defp product_remark(invoice, remark) do
    invoice <> "\n" <> "<Remark>#{remark}</Remark>"
  end

  defp product_total(invoice, total) do
    invoice <> "\n" <> "<Total>#{total}</Total>"
  end

  defp product_vat_rate(invoice, rate) do
    invoice <> "\n" <> "<VATRate>#{rate}</VATRate>"
  end

  defp product_vat_amount(invoice, amount) do
    invoice <> "\n" <> "<VATAmount>#{amount}</VATAmount>"
  end

  defp product_extra_1(invoice, extra) do
    invoice <> "\n" <> "<Extra1>#{extra}</Extra1>"
  end

  defp product_extra_2(invoice, extra) do
    invoice <> "\n" <> "<Extra2>#{extra}</Extra2>"
  end

  defp product_discount(invoice, discount) do
    invoice <> "\n" <> "<Discount>#{discount}</Discount>"
  end

  defp product_discount_amount(invoice, amount) do
    invoice <> "\n" <> "<DiscountAmount>#{amount}</DiscountAmount>"
  end

  defp product_is_sum(invoice, sum) do
    invoice <> "\n" <> "<IsSum>#{sum}</IsSum>"
  end

  defp total(invoice, total) do
    invoice <> "\n" <> "<Total>#{total}</Total>"
  end

  defp discount_amount(invoice, amount) do
    invoice <> "\n" <> "<DiscountAmount>#{amount}</DiscountAmount>"
  end

  defp vat_rate(invoice, rate) do
    invoice <> "\n" <> "<VATRate>#{rate}</VATRate>"
  end

  defp vat_amount(invoice, amount) do
    invoice <> "\n" <> "<VATAmount>#{amount}</VATAmount>"
  end

  defp amount(invoice, amount) do
    invoice <> "\n" <> "<Amount>#{amount}</Amount>"
  end

  defp amount_in_words(invoice, words) do
    invoice <> "\n" <> "<AmountInWords>#{words}</AmountInWords>"
  end

  defp extra(invoice, extra) do
    invoice <> "\n" <> "<Extra>#{extra}</Extra>"
  end

  defp arising_date(invoice, date) do
    invoice <> "\n" <> "<ArisingDate>#{date}</ArisingDate>"
  end

  defp payment_status(invoice, status) do
    invoice <> "\n" <> "<PaymentStatus>#{status}</PaymentStatus>"
  end

  defp email_deliver(invoice, email) do
    invoice <> "\n" <> "<EmailDeliver>#{email}</EmailDeliver>"
  end

  defp company_name(invoice, name) do
    invoice <> "\n" <> "<ComName>#{name}</ComName>"
  end

  defp company_address(invoice, address) do
    invoice <> "\n" <> "<ComAddress>#{address}</ComAddress>"
  end

  defp company_tax_code(invoice, code) do
    invoice <> "\n" <> "<ComTaxCode>#{code}</ComTaxCode>"
  end

  defp company_fax(invoice, fax) do
    invoice <> "\n" <> "<ComFax>#{fax}</ComFax>"
  end

  defp resource_code(invoice, code) do
    invoice <> "\n" <> "<ResourceCode>#{code}</ResourceCode>"
  end

  defp gross_value_0(invoice, value) do
    invoice <> "\n" <> "<GrossValue0>#{value}</GrossValue0>"
  end

  defp vat_amount_5(invoice, amount) do
    invoice <> "\n" <> "<VatAmount5>#{amount}</VatAmount5>"
  end

  defp gross_value_5(invoice, value) do
    invoice <> "\n" <> "<GrossValue5>#{value}</GrossValue5>"
  end

  defp vat_amount_5(invoice, amount) do
    invoice <> "\n" <> "<VatAmount5>#{amount}</VatAmount5>"
  end

  defp gross_value_10(invoice, value) do
    invoice <> "\n" <> "<GrossValue10>#{value}</GrossValue10>"
  end

  defp vat_amount_0(invoice, amount) do
    invoice <> "\n" <> "<VatAmount10>#{amount}</VatAmount10>"
  end

  defp buyer(invoice, buyer) do
    invoice <> "\n" <> "<Buyer>#{buyer}</Buyer>"
  end

  defp name(invoice, invoice_name) do
    invoice <> "\n" <> "<Name>#{invoice_name}</Name>"
  end

  defp company_phone(invoice, phone) do
    invoice <> "\n" <> "<ComPhone>#{phone}</ComPhone>"
  end

  defp company_bank_name(invoice, name) do
    invoice <> "\n" <> "<ComBankName>#{name}</ComBankName>"
  end

  defp company_bank_no(invoice, bank_account) do
    invoice <> "\n" <> "<ComBankNo>#{bank_account}</ComBankNo>"
  end

  defp gross_value(invoice, value) do
    invoice <> "\n" <> "<GrossValue>#{value}</GrossValue>"
  end

  defp create_date(invoice, date) do
    invoice <> "\n" <> "<CreateDate>#{date}</CreateDate>"
  end

  defp discount_rate(invoice, rate) do
    invoice <> "\n" <> "<DiscountRate>#{rate}</DiscountRate>"
  end

  defp customer_status(invoice, status) do
    invoice <> "\n" <> "<CusSignStatus>#{status}</CusSignStatus>"
  end

  defp create_by(invoice, by) do
    invoice <> "\n" <> "<CreateBy>#{by}</CreateBy>"
  end

  defp publish_by(invoice, by) do
    invoice <> "\n" <> "<PublishBy>#{by}</PublishBy>"
  end

  defp note(invoice, note) do
    invoice <> "\n" <> "<Note>#{note}</Note>"
  end

  defp process_invoice_note(invoice, note) do
    invoice <> "\n" <> "<ProcessInvNote>#{note}</ProcessInvNote>"
  end

  defp fkey(invoice, fkey) do
    invoice <> "\n" <> "<Fkey>#{fkey}</Fkey>"
  end

  defp gross_value_non_tax(invoice, value) do
    invoice <> "\n" <> "<GrossValue_NonTax>#{value}</GrossValue_NonTax>"
  end

  defp currency_unit(invoice, unit) do
    invoice <> "\n" <> "<CurrencyUnit>#{unit}</CurrencyUnit>"
  end

  defp exchange_rate(invoice, rate) do
    invoice <> "\n" <> "<ExchangeRate>#{rate}</ExchangeRate>"
  end

  defp converted_amount(invoice, amount) do
    invoice <> "\n" <> "<ConvertedAmount>#{amount}</ConvertedAmount>"
  end

  defp extra_1(invoice, extra) do
    invoice <> "\n" <> "<Extra1>#{extra}</Extra1>"
  end

  defp extra_2(invoice, extra) do
    invoice <> "\n" <> "<Extra2>#{extra}</Extra2>"
  end

  defp sms_deliver(invoice, sms) do
    invoice <> "\n" <> "<SMSDeliver>#{sms}</SMSDeliver>"
  end
end
