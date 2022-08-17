defmodule VnptInvoice.Number do
  def to_string(v) when is_float(v) do
    v
    |> :erlang.float_to_binary([:compact, {:decimals, 10}])
  end

  def to_string(v) do
    v
    |> Kernel.to_string()
  end
end
