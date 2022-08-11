defmodule VnptInvoiceTest do
  use ExUnit.Case
  require Logger
  doctest VnptInvoice

  test "create invoice" do
    products = [%VnptInvoice.Invoice.Product{
      product_name: "Khach san Crystabaya",
      product_unit: "Room",
      product_quantity: 1,
      product_price: 10_000_000,
      product_amount: 2_000_000,
      product_total: 10_000_000,
      product_vat_rate: 10,
      product_vat_amount: 1_000_000,
      product_is_sum: 0
    }]

    inv = %VnptInvoice.Invoice{
      key: (for _ <- 1..10, into: "", do: <<Enum.concat([?0..?9, ?A..?Z]) |> Enum.random()>>),
      customer_code: (for _ <- 1..12, into: "", do: <<(?0..?9) |> Enum.random()>>),
      customer_name: "Nguyen Truong Giang",
      customer_address: "36 Nguyen Hue",
      customer_phone: 0315212985,
      customer_tax_code: "0317408140-201",
      customer_bank_no: (for _ <- 1..10, into: "", do: <<(?0..?9) |> Enum.random()>>),
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
      company_name: "Viettel",
      company_address: "37 Nguyen Hue",
      company_tax_code: "1231231231",
      buyer: "Nguyen Truong Giang",
      name: "Nguyen Truong Giang",
      company_phone: "0937828401",
      company_bank_name: "Vietcombank",
      company_bank_no: (for _ <- 1..10, into: "", do: <<(?0..?9) |> Enum.random()>>),
      create_date: "11/08/2022",
      customer_status: 1,
      create_by: "Nhan Vien A",
      publish_by: "Nhan Vien A",
      fkey: 141951258598124,
      currency_unit: "VND",
      exchange_rate: 1.0,
      sms_deliver: "0937828401"
    }

    xmlInvData = inv
    |> VnptInvoice.Invoice.to_xml()
    username = "crystabayaservice"
    password = "Einv@oi@vn#pt20"
    action = "ImportInv"
    wsdl_path = "https://crystabaya-tt78admindemo.vnpt-invoice.com.vn/PublishService.asmx?WSDL"
    {:ok, wsdl} = Soap.init_model(wsdl_path, :url)

    params = %{
      xmlInvData: xmlInvData,
      username: username,
      password: password
    }

    {:ok, response} = Soap.call(wsdl, action, params)
    %{ImportInvResponse: %{ImportInvResult: result}} = response |> Soap.Response.parse()
    assert result |> String.contains?("OK:")

  end
end
