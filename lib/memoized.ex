defmodule Memoized do
  @moduledoc """
  Mark functions as memoizable within the current process.

      use Memoized

      defmemoized get_children(%Group{} = group) do
        MyApp.Repo.preload(group, :children).children
      end
  """

  defmacro __using__(_) do
    quote do
      import Memoized, only: [defmemoized: 2]
    end
  end

  @doc """
  Define a function that should be memoized.  To use it, simply replace `def` with `defmemoized`.
  """
  defmacro defmemoized({name, _, args} = head, do: body) do
    quote do
      def unquote(head) do
        arg_values =
          unquote(
            args
            |> Enum.map(fn arg ->
              quote do
                var!(unquote(arg))
              end
            end)
          )

        key = {unquote(name), arg_values}

        memoize_cache = Process.get(:memoized_cache, %{})

        if Map.has_key?(memoize_cache, key) do
          Map.get(memoize_cache, key)
        else
          result = unquote(body)
          Process.put(:memoized_cache, Map.put(memoize_cache, key, result))
          result
        end
      end
    end
  end
end
