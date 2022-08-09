defmodule VnptInvoice.WebServices.PublishService.Configuration do
  def get(:url) do
    :origin
    |> VnptInvoice.Configuration.get()
    |> Kernel.<>("/PublishService.asmx?WSDL")
  end
end
