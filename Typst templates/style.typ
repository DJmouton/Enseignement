// Comment

#set text(
  lang: "FR"
)

// Mise en page
#let template(body) = {
  set page(
    paper: "a4",
    numbering: "1 / 1",
    /*header: [
      #context {
        let headings = query(selector(heading).before(here()))
        if headings.len() < 3 {
          return
        }
        let first = none
        let second = none
        while headings.len() > 0 and (first == none or second == none) {
          let current = headings.pop()
          if second == none {
            if current.level == 2 {second = current.body}
          }
          else {
            if current.level == 1 {first = current.body}
          }
        }
        if first == none or second == none {return}
        text(size: 8pt, [#first > #second])
      }
    ],*/
  ) 

  //show par: set block(below: 1.5em)
  set par(
    justify: true,
    //leading: 1.5em,
  )
  
  set heading(numbering: "1.1.1.")
  //show heading: set block(above: 2em, below: 1.2em)
  set text(
    font: "",
    size: 11pt,
    lang: "FR"
  )
  
  set figure.caption(separator: [ -- ])
  set figure(supplement: "Figure")
  show figure: it => [#it #v(0.5em)]
  
  [#body]
}


#import "@preview/showybox:2.0.1": showybox

#let frame(title: [Titre], color: black, body: []) = showybox(
  breakable: true,
  title-style: (
    weight: 900,
    color: color.darken(40%),
    sep-thickness: 0pt,
    align: center
  ),
  frame: (
    title-color: color.lighten(80%),
    border-color: color.darken(40%),
    thickness: (left: 1pt, right: 1pt),
    radius: 0pt,
  ),
  title: title
)[#body]

// TODO: Add a way to break frame across pages
#let frame(title: [Titre], color: black, body: []) = [ 
  #v(1em)
  #block(
    [
      #move(dx: 0pt, dy: -20pt,
        rect(
        fill: white, 
        radius: 7pt,
        [*#title*])
      ) 
      #v(-2.8em)
      #body
    ],
    radius: 1em,
    stroke: color,
    inset: 1em,//(top: -1.2em, rest: 1.5em),
    width: 100%,
    breakable: true
  )
  #v(0.5em)
]

#let defcounter = counter("defcounter")
#let définition(numbering: true, body) = frame(
  title: 
    [#emoji.book Définition #if numbering {defcounter.step(); [#defcounter.display()]}], 
  color: red, 
  body: body
)

#let remarque(body)  = frame(
  title: [#emoji.lightbulb Remarque], 
  color: yellow, 
  body: body
)

#let exocounter = counter("exocounter")
#let exercice(numbering: true, body) = frame(
  title: 
    [#emoji.gear Exercice #if numbering {exocounter.step(); [#exocounter.display()]}],
  color: green,
  body: body
)

#let execounter = counter("execounter")
#let exemple(numbering: true, body) = text([
  *Exemple #if numbering {execounter.step(); [#execounter.display()]}:*
  #body
])

#let studentline(linecount: 1, hide: true, body) = text(
  if hide {rect(
    width: 100%, 
    height: (2em + 2pt) * linecount,
    stroke: white,
    for i in range(linecount) [#v(1em) #line(
      length: 100%, 
      stroke: (thickness: 1pt, dash: "dotted")
    )]
  )}
  else [#rect(
    width: 100%, 
    height: (2em + 2pt) * linecount,
    stroke: luma(220),
    [#body]
  )]
)

#import "@preview/lovelace:0.3.0": *

#let algorithme(body) = frame(
  title: [#emoji.notepad Algorithme],
  color: blue,
  body: if body != none {text(
    pseudocode-list(
      stroke: .5pt,
      indentation: 2em,
      body
    ))} else []
)

#let TODO = [#emoji.warning *--- TODO ---* #emoji.warning]

#let titre(body) = align(center, text(size: 24pt, smallcaps(body)))









/**
 * Create a family of counters with one parent and many children under one id.
 * 
 * This allows us to create arbitrarily many unique counters without
 * requiring unique strings for each one.
 * 
 * Args:
 * - id: str. The unique id for this counter family.
 * 
 * Returns two functions:
 * - The parent's step function (to be placed as content exactly once).
 *   - Does not need context to call.
 * - A function for getting the current child of the parent.
 *   - May only be called with context
 * 
 * Example:
 * ```typ
 * #let (parent-step, get-child) = counter-family("some string")
 * Place the parent step once per call:
 * #parent-step()
 * Then get the child in context and step it when you want:
 * #context { let child = get-child(); child.step() }
 * ```
 * 
 * Note: I do not believe that this works correctly when parents are nested within
 * children. Not sure what a solution to that would look like.
 */
#let counter-family(id) = {
  let parent = counter(id)
  let parent-step() = parent.step()
  let get-child() = counter(id + str(parent.get().at(0)))
  return (parent-step, get-child)
}

// A fun zig-zag line!
#let zig-zag(fill: black, rough-width: 6pt, height: 4pt, thick: 1pt, angle: 0deg) = {
  layout((size) => {
    // Use layout to get the size and measure our horizontal distance
    // Then get the per-zigzag width with some maths.
    let count = int(calc.round(size.width / rough-width))
    // Need to add extra thickness since we join with `h(-thick)`
    let width = thick + (size.width - thick) / count
    // One zig and one zag:
    let zig-and-zag = {
      let line-stroke = stroke(thickness: thick, cap: "round", paint: fill)
      let top-left = (thick/2, thick/2)
      let bottom-mid = (width/2, height - thick/2)
      let top-right = (width - thick/2, thick/2)
      let zig = line(stroke: line-stroke, start: top-left, end: bottom-mid)
      let zag = line(stroke: line-stroke, start: bottom-mid, end: top-right)
      box(place(zig) + place(zag), width: width, height: height, clip: true)
    }
    let zig-zags = ((zig-and-zag,) * count).join(h(-thick))
    rotate(zig-zags, angle)
  })
}

// ---- Define split-box ---- //

// Customizable options for a split-box border:
#let default-border = (
  // The starting and ending lines
  above: line(length: 100%),
  below: line(length: 100%),
  // Lines to put between the box over multiple pages
  btwn-above: line(length: 100%, stroke: (dash:"dotted")),
  btwn-below: line(length: 100%, stroke: (dash:"dotted")),
  // Left/right lines
  // These *must* use `grid.vline()`, otherwise you will get an error.
  // To remove the lines, set them to: `grid.vline(stroke: none)`.
  // You could probably configure this better with a rowspan, but I'm lazy.
  left: grid.vline(),
  right: grid.vline(),
)

// Create a box for content which spans multiple pages/columns and
// has custom borders above and below the column-break.
#let split-box(
  // Set the border dictionary, see `default-border` above for options
  border: default-border,
  // The cell to place content in, this should resolve to a `grid.cell`
  cell: grid.cell.with(inset: 5pt),
  // The last positional arg or args are your actual content
  // Any extra named args will be sent to the underlying grid when called
  // This is useful for fill, align, etc.
  ..args
) = {
  // See `utils.typ` for more info.
  let (parent-step, get-child) = counter-family("split-box-unique-counter-string")
  parent-step() // Place the parent counter once.
  // Keep track of each time the header is placed on a page.
  // Then check if we're at the first placement (for header) or the last (footer)
  // If not, we'll use the 'between' forms of the  border lines.
  let border-above = context {
    let header-count = get-child()
    header-count.step()
    context if header-count.get() == (1,) { border.above } else { border.btwn-above }
  }
  let border-below = context {
    let header-count = get-child()
    if header-count.get() == header-count.final() { border.below } else { border.btwn-below }
  }
  // Place the grid!
  grid(
    ..args.named(),
    columns: 3,
    border.left,
    grid.header(border-above , repeat: true),
    ..args.pos().map(cell),
    grid.footer(border-below, repeat: true),
    border.right,
  )
}

// ---- Examples ---- //

#set page(width: 7.2in, height: 3in, columns: 6)

// Tada!
#split-box[
  #lorem(20)
]

// And here's a fun example:

#let fun-border = (
  // gradients!
  above: line(length: 100%, stroke: 2pt + gradient.linear(..color.map.rainbow)),
  below: line(length: 100%, stroke: 2pt + gradient.linear(..color.map.rainbow, angle: 180deg)),
  // zig-zags!
  btwn-above: move(dy: +2pt, zig-zag(fill: blue, angle: 3deg)),
  btwn-below: move(dy: -2pt, zig-zag(fill: orange, angle: 177deg)),
  left: grid.vline(stroke: (cap: "round", paint: purple)),
  right: grid.vline(stroke: (cap: "round", paint: purple)),
)

#split-box(border: fun-border)[
  #lorem(25)
]

// And some more tame friends:

#split-box(border: (
  above: move(dy: -0.5pt, line(length: 100%)),
  below: move(dy: +0.5pt, line(length: 100%)),
  // zig-zags!
  btwn-above: move(dy: -1.1pt, zig-zag()),
  btwn-below: move(dy: +1.1pt, zig-zag(angle: 180deg)),
  left: grid.vline(stroke: (cap: "round")),
  right: grid.vline(stroke: (cap: "round")),
))[
  #lorem(10)
]

#split-box(
  border: (
    above: line(length: 100%, stroke: luma(50%)),
    below: line(length: 100%, stroke: luma(50%)),
    btwn-above: line(length: 100%, stroke: (dash: "dashed", paint: luma(50%))),
    btwn-below: line(length: 100%, stroke: (dash: "dashed", paint: luma(50%))),
    left: grid.vline(stroke: none),
    right: grid.vline(stroke: none),
  ),
  cell: grid.cell.with(inset: 5pt, fill: color.yellow.saturate(-85%))
)[
  #lorem(20)
]
