defmodule WorkingWithMultipleProcesses3 do
  def notify_parent(parent) do
    send parent, "Hello, world!"
    exit :boom
  end

  def receive_messages do
    receive do
      message ->
        IO.puts "Got #{inspect message}"
    after 500 ->
      IO.puts "It seems there's nothing more to do."
      exit :ok
    end
    receive_messages
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(WorkingWithMultipleProcesses3, :notify_parent, [self])
    :timer.sleep(500)
    receive_messages
  end
end

WorkingWithMultipleProcesses3.run