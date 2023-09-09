
signature geometry =
sig
  type point
  type rect

  val addP : point * point -> point
  val subP : point * point -> point
  val mulP : point * int -> point
  val divP : point * int -> point
  val eqP : point * point -> bool

  val xP : point -> int
  val yP : point -> int

  val width : rect -> int
  val height : rect -> int
  val size : rect -> point

  val emptyR : rect -> bool
  val unionR : rect * rect -> rect
end;

structure Geometry : geometry =
struct
type point = int * int
type rect = point * point

val zeroPoint = (0,0)
val zeroRect =  (zeroPoint, zeroPoint)

fun addP ((x1,y1), (x2,y2)) = (x1+x2,y1+y2)
fun negP (x1,y1) = (~x1,~y1)
fun subP (p1,p2) = addP(p1, negP p2)
fun mulP ((x,y),c) = (c*x,c*y)
fun divP ((x,y),c) = (x div c, y div c)
fun eqP (p1,p2) = p1 = p2

fun xP (x,y) = x
fun yP (x,y) = y

fun xMaxP (p1,p2) = Int.max(xP p1, xP p2)
fun xMinP (p1,p2) = Int.min(xP p1, xP p2)
fun yMaxP (p1,p2) = Int.max(yP p1, yP p2)
fun yMinP (p1,p2) = Int.min(yP p1, yP p2)

fun width  ((x1,_),(x2,_)) = x2 - x1
fun height ((_,y1),(_,y2)) = y2 - y1
fun size (p1,p2) = subP (p2, p1)
fun originR ((x1,y1),(x2,y2)) = (x1,y1)
fun endR ((x1,y1), (x2,y2)) = (x2,y2)
fun emptyR r =
    let
      val (x1,y1) = originR r
      val (x2,y2) = endR r
    in
      x1 >= x2 orelse y1 >= y2
    end

fun unionR (r1, r2) =
    if r1 = zeroRect
    then r2
    else if r2 = zeroRect
    then r1
    else
      (((xMaxP (originR r1, originR r2)),
        (yMaxP (originR r1, originR r2))),
       ((xMinP (endR r1, endR r2)),
        (yMinP (endR r1, endR r2))))
end
