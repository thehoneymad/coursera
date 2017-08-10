trait Expr {
  def eval: Int
}

case class Number(n : Int) extends Expr {
  def eval: Int = n
}

case class Sum(e1: Expr, e2: Expr) extends Expr {
  def eval: Int = e1.eval + e2.eval
}

object Evaluator {
  def eval(e: Expr): Int = e match {
    case Number(n) => n
    case Sum(e1, e2) => eval(e1) + eval(e2)
  }

  def show(expr: Expr): String = expr match {
    case Number(x) => x.toString
    case Sum(l, r) => {

    }
  }
}

Evaluator.show(Sum(Number(1), Number(44)))