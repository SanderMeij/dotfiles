structure RectangularPrism where
  height: Float
  width: Float
  length: Float
deriving Repr

def volume (prism: RectangularPrism): Float :=
  prism.height * prism.width * prism.length

#eval volume { height := 2, width := 3, length := 4 }

structure Segment where
  segmentStart: Float
  segmentEnd: Float
deriving Repr

def abs (a: Float) := if a < 0 then -a else a

def length (segment: Segment): Float :=
  abs (segment.segmentEnd - segment.segmentStart)

#eval length ({segmentEnd:= 2.0, segmentStart := 4.0} : Segment)

#eval (Nat.succ 1) == 2
