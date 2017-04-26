defmodule Gdc do
  def of(a, 0), do: 0
  def of(x, y), do: of(y, rem(x,y))
end