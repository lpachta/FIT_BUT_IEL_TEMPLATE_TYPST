# IEL project template — Typst

Typst version of the FIT BUT `IEL` project template. It is based on the
LaTeX `fitiel` class from `../FIT_BUT_IEL_TEMPLATE` and produces the same
structure: a title page, table of contents, one page per example, and a
summary table.

Tested with **Typst 0.15.1**.

## Credits

This Typst port is based on the original LaTeX template by **StoneboyCZ**:

<https://github.com/StoneboyCZ/FIT_BUT_IEL_TEMPLATE.git>

All credit for the assignment texts, circuit diagrams, logos, layout and
the original `fitiel` class belongs to that project. If you use this
template, please consider crediting the original as well.

---

## 1. Quick start

Compile the whole document:

```bash
typst compile 00-projekt.typ
```

This creates `00-projekt.pdf`.

For live preview while editing:

```bash
typst watch 00-projekt.typ
```

A single example can also be compiled on its own:

```bash
typst compile 01-pr1.typ
```

> The individual `01-pr1.typ` … `06-tab.typ` files are normally included
> from `00-projekt.typ`. Compiling them directly is useful only for a quick
> preview of one example, without the title page and page settings.

---

## 2. File structure

| File | Purpose |
| --- | --- |
| `00-projekt.typ` | Main document. Sets language, author, title and includes all examples. |
| `01-pr1.typ` … `05-pr5.typ` | Individual examples. Each one has a heading and one call of the corresponding function. |
| `06-tab.typ` | Summary table with all groups and results. |
| `fitiel.typ` | Template itself: page layout, title page, example data and example generators. |
| `fig/` | Logos and circuit diagrams (`Pr1.pdf` … `Pr5.pdf`). |

Files you normally edit:

- `00-projekt.typ` — author, title, language, list of included examples.
- `fitiel.typ` — group selection and, if needed, example data or text.
- `06-tab.typ` — your final results.
- `01-pr1.typ` … `05-pr5.typ` — add your solution below the assignment.

---

## 3. Title page, author and language

Edit the top of `00-projekt.typ`:

```typst
#show: project.with(
  lang: "czech",
  authors: (
    [Jméno, příjmení \ login],
  ),
  title: [IEL -- protokol k projektu],
  date: auto,
)
```

### Language

`lang` can be:

- `"czech"` — Czech text, Czech logo, Czech date
- `"slovak"` — Slovak text, Czech logo, Slovak date
- `"english"` — English text, English logo, English date

For English use:

```typst
#show: project.with(
  lang: "english",
  authors: (
    [John Doe \ xdoe00],
  ),
  title: [IEL -- project protocol],
  date: auto,
)
```

### Author

`authors` is an array. Each author is written as a content block `[...]`.
Use `\` to put the login on the next line:

```typst
authors: (
  [Jméno, příjmení \ login],
  [Druhý autor \ xlogin02],
)
```

### Date

- `date: auto` — today's date, localized automatically
  (`29. října 2026`, `29. októbra 2026`, or `October 29, 2026`).
- `date: [1. 1. 2026]` — any fixed date, written exactly as it should appear.

### Title

The title is the content passed to `title`. Use `title: none` to fall back
to the default localized title.

---

## 4. Selecting the group

Groups are defined in one place in `fitiel.typ`:

```typst
#let skupiny = (
  prvni: "A",
  druhy: "A",
  treti: "A",
  ctvrty: "A",
  paty: "A",
)
```

Change any value to `"A"` … `"H"`. The corresponding assignment, the table
row and the summary table are updated automatically.

The examples use the groups like this:

```typst
#prvni-zadani(skupiny.prvni)
```

Do not write `#prvni-zadani("A")` in one place and a different group in the
summary — use `skupiny` so both stay consistent.

---

## 5. Writing values with units

Typst is **not LaTeX**. Units are ordinary upright text, so write them in
quotes inside math. Put a space between the number and the unit.

### Basic examples

```typst
$U = 5 "V"$
$R = 330 "Ω"$
$I = 0.5 "A"$
$C = 100 "µF"$
$L = 5 "mH"$
$f = 50 "Hz"$
$t = 2 "s"$
```

Results:

```text
U = 5 V
R = 330 Ω
I = 0.5 A
C = 100 µF
L = 5 mH
f = 50 Hz
t = 2 s
```

### Decimal comma

Typst adds a small space after a comma in math. To get a Czech decimal
comma, quote the comma:

```typst
$U = 12","5 "V"$
$I = 0","5 "A"$
$U_(R 7) = 12","5 "V"$
```

Do **not** write `$U = 12,5 "V"$` unless you want the space after the comma.

In normal text you can simply write:

```typst
Napětí je 12,5 V a proud je 0,5 A.
```

### Unit shortcuts

`fitiel.typ` defines these shortcuts:

| Shortcut | Unit |
| --- | --- |
| `#Vo` | V |
| `#Am` | A |
| `#uF` | µF |
| `#mH` | mH |
| `#Hz` | Hz |
| `#F` | F |
| `#s-unit` | s |
| `#He` | H |

They can be used in text:

```typst
The measured voltage is 12,5 #Vo.
```

In math they also work, for example:

```typst
$U = 12","5 #Vo$
$C = 100 #uF$
```

For equations, quoted units such as `"V"` and `"µF"` are usually clearer
and less error-prone.

### Units in table headers

```typst
table(
  columns: 4,
  [$U$ [V]], [$I$ [A]], [$R$ [Ω]], [$C$ [µF]],
)
```

---

## 6. Writing equations

Use Typst math syntax. A few examples from this template:

```typst
$U_(R 7)$                  // U with subscript R7
$I_(R 6)$                  // I with subscript R6
$u_(C_2)$                  // u with subscript C2
$|U_(C_2)|$                // absolute value
$phi_(C_2)$                // phase φ_C2
$i_L = f(t)$               // current as a function of time
$u_1 = U_1 dot.c sin(2 pi f t)$
$t = frac(pi, 2 omega)$
```

### Common LaTeX → Typst replacements

| LaTeX | Typst |
| --- | --- |
| `$U_{R7}$` | `$U_(R 7)$` |
| `$u_{C_{2}}$` | `$u_(C_2)$` |
| `\sin` | `sin` |
| `\pi` | `pi` |
| `\omega` | `omega` |
| `\varphi` | `phi` |
| `\cdot` | `dot.c` |
| `\frac{a}{b}` | `frac(a, b)` or `a/b` |
| `\Omega` | `Omega` or `"Ω"` |
| `12,5` | `12","5` |

Do not paste LaTeX commands such as `\frac`, `\varphi` or `\sin` into
Typst math. They either fail or render the wrong symbol.

### Display equations

Inline math uses `$...$`. For a centered display equation, use spaces
inside the dollar signs:

```typst
$ U_(R 7) = R_7 I_(R 7) $
```

---

## 7. Adding your solution

Each example file already contains the assignment. Add your solution
below it:

```typst
#import "fitiel.typ": *

= Příklad 1
#prvni-zadani(skupiny.prvni)

*Řešení:*

Zjednodušením obvodu dostaneme:

$ R_("celk") = ... $

$ I_(R 7) = ... $
```

Use `=` for a section heading. Headings are added to the table of contents
automatically.

Useful Typst commands:

```typst
#pagebreak()      // force a new page
#linebreak()      // force a line break
#v(1cm)           // vertical space
#h(1cm)           // horizontal space
// comment
```

---

## 8. Adding or removing an example

### Remove an example

Comment out its include in `00-projekt.typ` together with the surrounding
page break:

```typst
// #pagebreak()
// #include "05-pr5.typ"
```

Then remove its row from `06-tab.typ` and its key from `skupiny` in
`fitiel.typ` if you no longer need it.

### Add a new example

1. Add the group to `skupiny` in `fitiel.typ`:

   ```typst
   #let skupiny = (
     prvni: "A",
     druhy: "A",
     treti: "A",
     ctvrty: "A",
     paty: "A",
     sesty: "A",
   )
   ```

2. Add a function for the new assignment in `fitiel.typ`. The easiest way
   is to copy an existing function, for example `paty-zadani`, and rename
   it to `sesty-zadani`.

3. Create `07-pr6.typ`:

   ```typst
   #import "fitiel.typ": *

   = Příklad 6
   #sesty-zadani(skupiny.sesty)
   ```

4. Include it in `00-projekt.typ`:

   ```typst
   #pagebreak()
   #include "07-pr6.typ"
   ```

5. Add a row to the summary table in `06-tab.typ`.

---

## 9. Adding figures

Put the image into `fig/` and reference it relative to the project root:

```typst
image("fig/Pr1.pdf", width: 288pt)
image("fig/my-figure.png", width: 50%)
```

- `width: 50%` means 50 % of the available text width.
- `width: 288pt` is an absolute width in points (the values used in this
  template match the original LaTeX `scale=0.5`).
- You can also use `cm`, for example `width: 8cm`.
- Prefer vector PDF or SVG for circuit diagrams, and PNG for screenshots.

---

## 10. Editing example data

The numbers for each group are stored in the example functions in
`fitiel.typ`, for example:

```typst
#let prvni-zadani(skupina) = {
  let (U1, U2, R1, R2, R3, R4, R5, R6, R7, R8) = if skupina == "A" {
    (80, 120, 350, 650, 410, 130, 360, 750, 310, 190)
  } else if skupina == "B" {
    ...
  }
```

Each tuple contains the values in the same order as the table header.
If you change a value, keep the tuple length the same.

The assignment text is the content block immediately below the data, for
example:

```typst
[Stanovte napětí $U_(R 7)$ a proud $I_(R 7)$. Použijte metodu postupného zjednodušování obvodu.]
```

---

## 11. Changing the template layout

Most global settings are in `project` in `fitiel.typ`:

```typst
set text(lang: tr.locale, font: "New Computer Modern", size: 11pt)
set par(justify: true)
set page(
  paper: "a4",
  margin: (left: 2cm, right: 2cm, top: 3cm, bottom: 2.7cm),
  numbering: "1",
)
```

- `font` — change the text font.
- `size` — change the base font size.
- `justify` — `true` for justified text, `false` for ragged-right text.
- `margin` — page margins.
- `numbering` — page numbering format. Use `numbering: none` to disable
  page numbers.

The title page logo size is set here:

```typst
image(tr.logo, width: 9.5cm)
```

---

## 12. Troubleshooting

### `unknown variable: ...`

This usually means LaTeX syntax was used in math. For example:

```typst
$U_{R7}$     // wrong
$U_(R 7)$    // correct
```

### The summary table contains the whole assignment

Make sure `06-tab.typ` uses `skupiny` rather than calling
`prvni-zadani(...)` again:

```typst
[1], [#skupiny.prvni], [$U_(R 7) = $ #h(4em) $I_(R 7) = $],
```

### The table of contents is empty

Compile the whole `00-projekt.typ`, not an individual example file. The
table of contents is generated from the `=` headings included from
`00-projekt.typ`.

### Wrong date language

Set `lang` in `00-projekt.typ`. The date format follows the selected
language:

```typst
lang: "czech"    // 29. října 2026
lang: "slovak"   // 29. októbra 2026
lang: "english"  // October 29, 2026
```

### A figure is missing

Check that the path is relative to the project root and that the file is
inside `fig/`:

```typst
image("fig/Pr1.pdf", width: 288pt)
```

---

## 13. Summary of the Typst syntax used here

```typst
// comment

#import "fitiel.typ": *
#include "01-pr1.typ"

= Section heading
== Subsection heading

Plain text with #Vo as a unit shortcut.

$U = 12","5 "V"$          // inline math
$ U = 12","5 "V" $        // display math

#pagebreak()
#linebreak()
```

For a complete Typst reference, see <https://typst.app/docs/>.
