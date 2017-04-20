  fizz_buzz = fn
    (0, 0, _) -> "FizzBuzz"
  	(0, _, _) -> "Fizz"
  	(_, 0, _) -> "Buzz"
  	(_, _, x) -> x
  end

  remainder = fn n -> 
  	fizz_buzz.(rem(n,3), rem(n,5), n)
  end

IO.puts(remainder.(10))
IO.puts(remainder.(11))
IO.puts(remainder.(12))
IO.puts(remainder.(13))
IO.puts(remainder.(14))
IO.puts(remainder.(15))
IO.puts(remainder.(16))