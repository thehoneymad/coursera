package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
    def pascal(c: Int, r: Int): Int = {
      if (c == 0 || c == r ) 1
      else pascal(c-1, r-1) + pascal(c, r-1)
    }
  
  /**
   * Exercise 2
   */
    def balance(chars: List[Char]): Boolean = {
      def proceed(stack: Int, rest: List[Char]) : Boolean = {
        if (stack < 0) false
        else if (rest.isEmpty)  stack == 0
        else rest.head match {
          case '(' => proceed(stack + 1, rest.tail)
          case ')' => proceed(stack - 1, rest.tail)
          case _ => proceed(stack, rest.tail)
        }
      }
      proceed(0, chars)
    }
  
  /**
   * Exercise 3
   */
    def countChange(money: Int, coins: List[Int]): Int = {
      def count (money: Int, coins: List[Int]): Int = {
        if (coins.isEmpty) 0
        else if (money - coins.head < 0) 0
        else if (money - coins.head == 0) 1
        else count(money - coins.head, coins) + count(money, coins.tail)
      }

      count(money, coins.sorted)
    }
  }
