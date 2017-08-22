object ListFun {
  val nums = List(2, -4, 5, 7, 1)
  val fruits = List("apple", "pineapple", "orange", "banana")

  nums filter (x => x > 0)
  nums filterNot(x => x > 0)
  nums partition(x=>x > 0)

  nums takeWhile(x=>x > 0)
  nums dropWhile(x=>x > 0)

  nums span (x => x> 0)
}