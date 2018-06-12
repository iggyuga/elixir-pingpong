defmodule Game.Ping do

	def loop(message) do
		receive do
		  {sender_pid, :ping} ->
				send(sender_pid, {:ok, message})
		  _ ->
			IO.puts("error")
		  end
		  loop(message)
	  end
end
