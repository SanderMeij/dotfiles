-- RGB Noise Bitmap Generator
-- Creates a 24-bit BMP file with random RGB noise

def main : IO Unit := do
  let width : Nat := 512
  let height : Nat := 512
  
  let size := 54 + width * height * 3
  
  -- BMP file header (14 bytes)
  let fileHeader : List UInt8 := [
    0x42, 0x4D,                     -- 'BM' signature
    (size &&& 0xFF),
    ((size >>> 8) &&& 0xFF),
    ((size >>> 16) &&& 0xFF),
    ((size >>> 24) &&& 0xFF),       -- File size
    0, 0, 0, 0,                     -- Reserved
    54, 0, 0, 0                     -- Pixel data offset
  ].map UInt8.ofNat
  
  -- DIB header - BITMAPINFOHEADER (40 bytes)
  let dibHeader : List UInt8 := [
    40, 0, 0, 0,                    -- Header size
    (width &&& 0xFF), ((width >>> 8) &&& 0xFF), 0, 0,   -- Width
    (height &&& 0xFF), ((height >>> 8) &&& 0xFF), 0, 0, -- Height
    1, 0,                           -- Color planes
    24, 0,                          -- Bits per pixel
    0, 0, 0, 0,                     -- Compression
    0, 0, 0, 0,                     -- Image size
    0, 0, 0, 0,                     -- Xppm
    0, 0, 0, 0,                     -- Yppm
    0, 0, 0, 0,                     -- Colors
    0, 0, 0, 0                      -- Important colors
  ].map UInt8.ofNat
  
  -- Generate random pixel data
  let mut pixels : ByteArray := ByteArray.empty
  for _ in [:height] do
    for _ in [:width] do
      let r ← IO.rand 0 255
      let g ← IO.rand 0 255
      let b ← IO.rand 0 255
      pixels := pixels.push (UInt8.ofNat b)  -- BMP uses BGR order
      pixels := pixels.push (UInt8.ofNat g)
      pixels := pixels.push (UInt8.ofNat r)
  
  -- Combine all data
  let mut allData := ByteArray.mk fileHeader.toArray
  allData := allData.append (ByteArray.mk dibHeader.toArray)
  allData := allData.append pixels
  
  -- Write to file
  IO.FS.writeBinFile "noise.bmp" allData
  IO.println "Bitmap written to noise.bmp"

#eval main
