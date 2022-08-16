defmodule VnptInvoice.WebServices.BusinessService.Configuration do
  def get(:url) do
    :origin
    |> VnptInvoice.Configuration.get()
    |> Kernel.<>("/BusinessService.asmx?WSDL")
  end
end
