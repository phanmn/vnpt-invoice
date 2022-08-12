defmodule VnptInvoiceTest do
  use ExUnit.Case
  require Logger
  doctest VnptInvoice

  test "create invoice" do
    products = [
      %VnptInvoice.Invoice.Product{
        product_name: "Khach san Crystabaya",
        product_unit: "Room",
        product_quantity: 1,
        product_price: 10_000_000,
        product_total: 10_000_000,
        product_vat_rate: 10,
        product_vat_amount: 1_000_000,
        product_is_sum: 0
      },
      %VnptInvoice.Invoice.Product{
        product_name: "Khach san Muong Thanh",
        product_unit: "Room",
        product_quantity: 2,
        product_price: 20_000_000,
        product_total: 40_000_000,
        product_vat_rate: 10,
        product_vat_amount: 4_000_000,
        product_is_sum: 1
      }
    ]

    invoice = %VnptInvoice.Invoice{
      key: for(_ <- 1..10, into: "", do: <<Enum.concat([?0..?9, ?A..?Z]) |> Enum.random()>>),
      #customer_code: for(_ <- 1..12, into: "", do: <<?0..?9 |> Enum.random()>>),
      customer_name: "Nguyen Truong Giang",
      customer_address: "36 Nguyen Hue",
      customer_phone: 0_315_212_985,
      customer_tax_code: "0317408140-201",
      customer_bank_no: for(_ <- 1..10, into: "", do: <<?0..?9 |> Enum.random()>>),
      customer_bank_name: "MBBank",
      payment_method: "banking",
      products: products,
      total: 10_000_000,
      vat_rate: 10,
      vat_amount: 1_000_000,
      amount: 11_000_000,
      amount_in_words: "Muoi mot trieu dong",
      payment_status: 1,
      email_deliver: "giang.nt41@gmail.com",
      buyer: "Nguyen Truong Giang",
      name: "Nguyen Truong Giang",
      company_phone: "0937828401",
      company_bank_name: "Vietcombank",
      company_bank_no: for(_ <- 1..10, into: "", do: <<?0..?9 |> Enum.random()>>),
      create_date: "11/08/2022",
      #customer_status: 0,
      create_by: "Nhan Vien A",
      publish_by: "Nhan Vien A",
      fkey: 141_951_258_598_124,
      currency_unit: "VND",
      exchange_rate: 1.0,
      sms_deliver: "0937828401"
    }

    invoice_2 = %VnptInvoice.Invoice{
      key: for(_ <- 1..10, into: "", do: <<Enum.concat([?0..?9, ?A..?Z]) |> Enum.random()>>),
      customer_code: for(_ <- 1..12, into: "", do: <<?0..?9 |> Enum.random()>>),
      customer_name: "Nguyen Hoang Nam",
      customer_address: "35 Nguyen Hue",
      customer_phone: 0_315_212_985,
      customer_tax_code: "0317408140",
      customer_bank_no: for(_ <- 1..10, into: "", do: <<?0..?9 |> Enum.random()>>),
      customer_bank_name: "MBBank",
      payment_method: "banking",
      products: products,
      total: 50_000_000,
      vat_rate: 10,
      vat_amount: 5_000_000,
      amount: 55_000_000,
      amount_in_words: "Nam muoi lam trieu dong",
      payment_status: 1,
      email_deliver: "nguyehoangnamdev@gmail.com",
      company_name: "Beowulf",
      company_address: "37 Nguyen Hue",
      company_tax_code: "1231231231",
      buyer: "Nguyen Hoang Nam",
      name: "Nhan Vien B",
      company_phone: "0937828401",
      company_bank_name: "Vietcombank",
      company_bank_no: for(_ <- 1..10, into: "", do: <<?0..?9 |> Enum.random()>>),
      create_date: "11/08/2022",
      customer_status: 1,
      create_by: "Nhan Vien A",
      publish_by: "Nhan Vien A",
      fkey: 141_951_258_598_124,
      currency_unit: "VND",
      exchange_rate: 1.0,
      sms_deliver: "0937828401"
    }

    assert {:ok, v} =
             [invoice, invoice_2]
             |> VnptInvoice.WebServices.PublishService.import_invoice()
    v |> inspect() |> Logger.error()
  end
end
