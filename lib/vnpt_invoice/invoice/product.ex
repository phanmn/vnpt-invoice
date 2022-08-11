defmodule VnptInvoice.Invoice.Product do
  use TypedStruct

  typedstruct do
    field :product_name, String.t(), enforce: true
    field :product_unit, String.t(), enforce: true
    field :product_quantity, integer(), enforce: true
    field :product_price, integer(), default: nil
    field :product_amount, integer(), default: nil
    field :product_remark, String.t(), default: ""
    field :product_total, integer(), default: nil
    field :product_vat_rate, float(), default: nil
    field :product_vat_amount, integer(), default: nil
    field :product_extra_1, String.t(), default: ""
    field :product_extra_2, String.t(), default: ""
    field :product_discount, integer(),  default: 0
    field :product_discount_amount, integer(), default: 0
    field :product_is_sum, integer(), default: nil
  end
end
