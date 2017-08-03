abstract class IntSet {
  def incl(x: Int): IntSet
  def contains(x:Int): Boolean
  def union(other: IntSet): IntSet
}


class NonEmpty(elem: Int, left: IntSet, right: IntSet) extends IntSet {
  override def contains(x: Int): Boolean =
    if (x < elem) left contains x
    else if (x > elem) right contains x
    else true

  override def incl(x: Int): IntSet = {
    println("Include " + x)

    if (x < elem) new NonEmpty(elem, left incl x, right)
    else if (x > elem) new NonEmpty(elem, left, right incl x)
    else this
  }

  override def union(other: IntSet): IntSet ={
    println("Union left= " + left + " right= " + right + " other = " + other + " elem= " + elem )

    ((left union right) union other) incl elem
  }


  override def toString: String = "{" + left + elem + right + "}"
}

object Empty extends  IntSet {
  override def contains(x: Int): Boolean = false
  override def incl(x: Int): IntSet = new NonEmpty(x, Empty, Empty)
  override def union(other: IntSet): IntSet = other

  override def toString: String = "."
}


val t1 = new NonEmpty(3, Empty, Empty) incl 4 incl 2

val t2 = new NonEmpty(5, Empty, Empty) incl 7 incl 3

t1 union t2
