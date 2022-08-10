defmodule VnptInvoice.Invoice do
  use TypedStruct

  typedstruct do
    field :key, String.t(), enforce: true
    field :customer_code, integer(), enforce: true
    field :customer_name, String.t(), enforce: true
    field :customer_address, String.t(), enforce: true
    field :customer_phone, String.t(), enforce: true
    field :customer_tax_code, String.t(), enforce: true
    field :payment_method, String.t(), default: ""
    field :kind_of_service, integer(), default: nil
    field :products, List.t(), enforce: true
    field :total, integer(), default: nil
    field :discount_amount, integer(), default: nil
    field :vat_rate, integer(), default: nil
    field :vat_amount, integer(), default: nil
    field :amount, integer(), enforce: true
    field :amount_in_words, String.t(), default: ""
    field :extra, String.t(), default: ""
    field :arising_date, Date.t(), default: ""
    field :payment_status, integer(), enforce: true
    field :email_deliver, String.t(), enforce: true
    field :company_name, String.t(), enforce: true
    field :company_address, String.t(), enforce: true
    field :company_tax_code, String.t(), enforce: true
    field :company_fax, String.t(), enforce: true
    field :resource_code, integer(), default: nil
    field :gross_value_0, integer(), default: nil
    field :vat_amount_0, integer(), default: nil
    field :gross_value_5, integer(), default: nil
    field :vat_amount_5, integer(), default: nil
    field :gross_value_10, integer(), default: nil
    field :vat_amount_10, integer(), default: nil
    field :buyer, String.t(), default: ""
    field :name, String.t(), default: ""
    field :company_phone, String.t(), enforce: true
    field :company_bank_name, String.t(), enforce: true
    field :company_bank_no, String.t(), enforce: true
    field :gross_value, integer(), default: nil
    field :create_date, Date.t(), default: ""
    field :discount_rate, integer(), default: nil
    field :customer_status, String.t(), enforce: true
    field :create_by, String.t(), default: ""
    field :publish_by, String.t(), default: ""
    field :note, String.t(), default: ""
    field :process_invoice_note, String.t(), default: ""
    field :fkey, integer(), default: nil
    field :gross_value_non_tax, integer(), default: nil
    field :currency_unit, String.t(), enforce: true
    field :exchange_rate, integer(), default: nil
    field :converted_amount, integer(), default: nil
    field :extra_1, String.t(), default: ""
    field :extra_2, String.t(), default: ""
    field :sms_deliver, String.t(), default: ""
  end

  def to_xml(invoice, products) when is_list(products) do
    invoice
    |> VnptInvoiceBuilder.build(products)
    |> IO.inspect()
  end
end
