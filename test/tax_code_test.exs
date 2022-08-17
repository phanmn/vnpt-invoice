defmodule TaxCodeTest do
  use ExUnit.Case

  test "validate tax code" do
    assert VnptInvoice.Invoice.validate_tax_code("0110092483-012") == true
    assert VnptInvoice.Invoice.validate_tax_code("0110092483") == true
    assert VnptInvoice.Invoice.validate_tax_code("011009248") == false
    assert VnptInvoice.Invoice.validate_tax_code("0110092483-11") == false
    assert VnptInvoice.Invoice.validate_tax_code("0110092483-0144") == false
  end
end
