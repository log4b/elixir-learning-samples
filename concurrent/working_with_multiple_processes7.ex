defmodule WorkingWithMultipleProcesses6 do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, {self, fun.(elem)}) end
       end)
    |> Enum.map(fn (pid) ->
       receive do {^pid, result} ->
       :timer.sleep 50
       result
       end
     end)
  end
end