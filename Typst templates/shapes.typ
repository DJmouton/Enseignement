#import "@preview/cetz:0.2.2"

#let square-matrix(
  h-range: 3,
  v-range: 3,
  h-size: 1em,
  v-size: 1em,
  h-offset: 0.5em,
  v-offset: 0.5em,
  ..options
) = {cetz.canvas({
  import cetz.draw: *
  for j in range(v-range) {
    for i in range(h-range) {rect(..options,
      (i * (h-offset + h-size), j * (v-offset + v-size)), 
      (i * (h-offset + h-size) + h-size, j * (v-offset + v-size) + v-size))}
  }
})}