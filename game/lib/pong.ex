defmodule Game.Pong do

	def loop(message) do
		receive do
		  {sender_pid, :pong} ->
				send(sender_pid, {:ok, message})
		  _ ->
			IO.puts("error")
		  end
		  loop(message)
	 end
end
