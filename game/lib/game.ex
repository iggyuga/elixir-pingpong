defmodule Game do
  
  @moduledoc """
  Documentation for Game.
  """


  @doc """
  Hello world.

  ## Examples

      iex> Game.hello
      :world

  """
    def run() do
      coordinator_pid =
        spawn(Game.Coordinator, :loop, [])

      worker_pid_ping = spawn(Game.Ping, :loop, ["pong"])
      send(worker_pid_ping, {coordinator_pid, :ping})

      worker_pid_pong = spawn(Game.Pong, :loop, ["ping"])
      send(worker_pid_pong, {coordinator_pid, :pong})
    end

end
