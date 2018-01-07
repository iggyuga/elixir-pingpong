defmodule Game.Coordinator do
	
	def loop(results \\ []) do
		receive do
			{:ok, result} ->
				new_results = [result|results]
				if Enum.count(new_results) == 2 do
					send(self(), :exit)
				end
				loop(new_results)

			:exit ->
				IO.puts(results |> Enum.sort |> Enum.join(", "))
			_ ->
				loop(results)
		end
	end
end