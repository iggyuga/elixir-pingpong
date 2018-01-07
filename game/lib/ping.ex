defmodule Game.Ping do

	def loop(message) do
		receive do
		  {sender_pid, :ping} ->
				send(sender_pid, {:ok, message})
		  _ ->
			IO.puts("no fucking clue")
		  end
		  loop(message)
	  end
	
	  # defp send_message(message) do
		# 	IO.puts(message)
	  # end
end