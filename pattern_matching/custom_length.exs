defmodule CustomLength do
  def of([]), do: 0
  def of([n]), do: 1 + of(n.tail)
end