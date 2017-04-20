  fizz_buzz = fn
    (0, 0, _) -> "FizzBuzz"
  	(0, _, _) -> "Fizz"
  	(_, 0, _) -> "Buzz"
  	(_, _, x) -> x
  end

IO.puts fizz_buzz.(0,0,1)