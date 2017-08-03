package week3

class Rational(x: Int, y: Int) {
  require(y != 0, "denominator must be nonzero")

  def this(x: Int) = this(x, 1)

  private def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
  private val g = gcd(x, y)

  val numer: Int  = x / g
  val denom: Int = y / g

  def < (that: Rational) : Boolean = this.numer * that.denom < that.numer * this.denom
  def max(that: Rational) : Rational = if(this < that) that else this

  def + (that: Rational) =
    new Rational(
      numer * that.denom + that.numer * denom,
      denom * numer)

  def unary_- : Rational = new Rational(-numer, denom)

  def sub(that: Rational) = this + -that
}