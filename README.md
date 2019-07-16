# Memoized

This package adds a `defmemoized` macro to Elixir.  This is used to define a function that should be _memoized_ - this means that after the first time it is called with a particular set of arguments, the result is stored and never recomputed.

The cache is local to the current process.  Note that there are no expiration strategies or ways to remove entries from the cache; the cache will exist for the lifetime of the process.  That makes this useful for shortlived processes like Phoenix Liveviews.

## Warning!

- Don't use memoization prematurely; there are often better solutions for optimization. 
- Used in the wrong place, memoization can __decrease__ performance!
- Careful not to memoize too much stuff or you could run out of memory.
- This uses the `process dictionary` which might make you feel icky.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `memoized` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:memoized, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/memoized](https://hexdocs.pm/memoized).

