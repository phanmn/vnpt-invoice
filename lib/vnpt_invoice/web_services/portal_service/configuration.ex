defmodule VnptInvoice.WebServices.PortalService.Configuration do
  def get(:url) do
    :origin
    |> VnptInvoice.Configuration.get()
    |> Kernel.<>("/PortalService.asmx?WSDL")
  end
end
