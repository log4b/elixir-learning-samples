defmodule WorkingWithMultipleProcesses do
  def run(token1, token2) do
    pid1 = spawn(WorkingWithMultipleProcesses, :reply, [])

    pid2 = spawn(WorkingWithMultipleProcesses, :reply, [])

    send pid1, {self, token1}

    send pid2, {self, token2}

    receive do
      tok2 -> IO.puts "Got reply: #{tok2}"
    end

    receive do
      tok1 -> IO.puts "Got reply: #{tok1}"
    end
  end

  def reply do
    receive do
      {sender, token} ->
        send sender, token
    end
  end
end

WorkingWithMultipleProcesses.run("Fred", "Betty")