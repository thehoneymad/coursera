object session {
  def abs(x: Double) = if (x < 0) -x else x

  def sqrt(x: Double) = {
    def sqrIter(guess: Double, x: Double): Double =
      if (isGoodEnough(guess, x)) guess
      else sqrIter(improve(guess, x), x)


    def isGoodEnough(guess: Double, x: Double): Boolean = {
      abs(guess * guess - x) / x < 0.001
    }

    def improve(guess: Double, x: Double): Double = {
      (guess + x / guess )/ 2
    }

    sqrIter(1.0, x)
  }

  sqrt(4)
}
