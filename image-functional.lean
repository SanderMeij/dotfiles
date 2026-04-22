-- RGB Noise Bitmap Generator (Strictly Functional Version)
-- Creates a 24-bit BMP file with random RGB noise

/-- Converts a Nat to a list of bytes in Little-Endian order -/
def toLEBytes (n : Nat) (len : Nat) : List UInt8 :=
  match len with
  | 0 => []
  | l + 1 => UInt8.ofNat (n &&& 0xFF) :: toLEBytes (n >>> 8) l

/-- Generates the 14-byte BMP file header -/
def fileHeader (size : Nat) : List UInt8 :=
  [0x42, 0x4D] ++           -- 'BM' signature
  toLEBytes size 4 ++       -- File size
  toLEBytes 0 4 ++          -- Reserved
  toLEBytes 54 4            -- Pixel data offset

/-- Generates the 40-byte BITMAPINFOHEADER -/
def dibHeader (width height : Nat) : List UInt8 :=
  toLEBytes 40 4 ++         -- Header size
  toLEBytes width 4 ++      -- Width
  toLEBytes height 4 ++     -- Height
  toLEBytes 1 2 ++          -- Color planes
  toLEBytes 24 2 ++         -- Bits per pixel
  toLEBytes 0 24            -- Compression, size, resolution, colors

/-- Recursively generates random pixel data in BGR order -/
def generatePixels (count : Nat) : IO ByteArray :=
  let rec loop : Nat → ByteArray → IO ByteArray
    | 0, acc => pure acc
    | n + 1, acc => do
      let r ← IO.rand 0 255
      let g ← IO.rand 0 255
      let b ← IO.rand 0 255
      loop n (acc.push b.toUInt8 |>.push g.toUInt8 |>.push r.toUInt8)
  loop count .empty

def main : IO Unit := do
  let width := 512
  let height := 512
  let size := 54 + width * height * 3
  
  let header := fileHeader size ++ dibHeader width height
  let pixels ← generatePixels (width * height)
  
  let allData := (ByteArray.mk header.toArray).append pixels
  
  IO.FS.writeBinFile "noise-functional.bmp" allData
  IO.println s!"Bitmap written to noise-functional.bmp"

#eval main
