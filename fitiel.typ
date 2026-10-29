// FIT BUT IEL Template in Typst
// Converted from LaTeX fitiel.cls
// Original LaTeX template: https://github.com/StoneboyCZ/FIT_BUT_IEL_TEMPLATE.git

// Localized strings used by the title page and the table of contents.
#let jazyk = (
  czech: (
    locale: "cs",
    logo: "fig/logo_cz.png",
    title: [IEL -- protokol k projektu],
    outline: "Obsah",
    months: (
      "ledna", "února", "března", "dubna", "května", "června",
      "července", "srpna", "září", "října", "listopadu", "prosince",
    ),
  ),
  slovak: (
    locale: "sk",
    logo: "fig/logo_cz.png",
    title: [IEL -- protokol k projektu],
    outline: "Obsah",
    months: (
      "januára", "februára", "marca", "apríla", "mája", "júna",
      "júla", "augusta", "septembra", "októbra", "novembra", "decembra",
    ),
  ),
  english: (
    locale: "en",
    logo: "fig/logo_en.png",
    title: [IEL -- project protocol],
    outline: "Contents",
    months: (
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December",
    ),
  ),
)

#let format-date(d, lang) = {
  let months = jazyk.at(lang, default: jazyk.czech).months
  if lang == "english" {
    [#months.at(d.month() - 1) #(d.day()), #(d.year())]
  } else {
    [#(d.day()). #months.at(d.month() - 1) #(d.year())]
  }
}

#let project(
  lang: "czech", // "czech", "slovak", or "english"
  authors: (),
  title: none,
  date: auto,
  body,
) = {
  let tr = jazyk.at(lang, default: jazyk.czech)

  // Document defaults
  set text(lang: tr.locale, font: "New Computer Modern", size: 11pt)
  set par(justify: true)
  set page(
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 3cm, bottom: 2.7cm),
    numbering: "1",
  )

  // Title page and table of contents
  set align(center)
  image(tr.logo, width: 9.5cm)
  v(1.55cm, weak: true)
  text(
    size: 14pt,
    weight: "bold",
    if title == none { tr.title } else { title },
  )
  v(0.8cm, weak: true)
  for (i, author) in authors.enumerate() {
    if i > 0 { linebreak() }
    author
  }
  v(0.6cm, weak: true)
  if date == auto {
    format-date(datetime.today(), lang)
  } else {
    date
  }
  v(1.35cm, weak: true)

  set align(left)
  outline(title: tr.outline, indent: auto)
  pagebreak()

  body
}

// Units shortcuts
#let Vo = [V]
#let Am = [A]
#let uF = [µF]
#let mH = [mH]
#let Hz = [Hz]
#let F = [F]
#let s-unit = [s]
#let He = [H]

// Groups used in the individual examples (A-H).
// Change them here and the summary table will follow automatically.
#let skupiny = (
  prvni: "A",
  druhy: "A",
  treti: "A",
  ctvrty: "A",
  paty: "A",
)

// Problem 1
#let prvni-zadani(skupina) = {
  let (U1, U2, R1, R2, R3, R4, R5, R6, R7, R8) = if skupina == "A" {
    (80, 120, 350, 650, 410, 130, 360, 750, 310, 190)
  } else if skupina == "B" {
    (95, 115, 650, 730, 340, 330, 410, 830, 340, 220)
  } else if skupina == "C" {
    (100, 80, 450, 810, 190, 220, 220, 720, 260, 180)
  } else if skupina == "D" {
    (105, 85, 420, 980, 330, 280, 310, 710, 240, 200)
  } else if skupina == "E" {
    (115, 55, 485, 660, 100, 340, 575, 815, 255, 225)
  } else if skupina == "F" {
    (125, 65, 510, 500, 550, 250, 300, 800, 330, 250)
  } else if skupina == "G" {
    (130, 60, 380, 420, 330, 440, 450, 650, 410, 275)
  } else if skupina == "H" {
    (135, 80, 680, 600, 260, 310, 575, 870, 355, 265)
  } else {
    (0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  }

  [Stanovte napětí $U_(R 7)$ a proud $I_(R 7)$. Použijte metodu postupného zjednodušování obvodu. #linebreak()]

  table(
    columns: 11,
    align: center,
    stroke: 0.5pt,
    [sk.], [$U_1$ [V]], [$U_2$ [V]], [$R_1$ [$Omega$]], [$R_2$ [$Omega$]], [$R_3$ [$Omega$]], [$R_4$ [$Omega$]], [$R_5$ [$Omega$]], [$R_6$ [$Omega$]], [$R_7$ [$Omega$]], [$R_8$ [$Omega$]],
    [#skupina], [#U1], [#U2], [#R1], [#R2], [#R3], [#R4], [#R5], [#R6], [#R7], [#R8],
  )
  linebreak()

  image("fig/Pr1.pdf", width: 288pt)
}

// Problem 2
#let druhy-zadani(skupina) = {
  let (U1, R1, R2, R3, R4, R5, R6) = if skupina == "A" {
    (50, 525, 620, 210, 530, 50, 100)
  } else if skupina == "B" {
    (100, 310, 610, 220, 570, 100, 50)
  } else if skupina == "C" {
    (200, 220, 630, 240, 450, 200, 70)
  } else if skupina == "D" {
    (150, 200, 660, 200, 550, 150, 200)
  } else if skupina == "E" {
    (250, 335, 625, 245, 600, 300, 150)
  } else if skupina == "F" {
    (130, 350, 600, 195, 650, 80, 180)
  } else if skupina == "G" {
    (180, 315, 615, 180, 460, 120, 250)
  } else if skupina == "H" {
    (220, 360, 580, 205, 560, 250, 190)
  } else {
    (0, 0, 0, 0, 0, 0, 0)
  }

  [Stanovte napětí $U_(R 6)$ a proud $I_(R 6)$. Použijte metodu Théveninovy věty. #linebreak()]

  table(
    columns: 8,
    align: center,
    stroke: 0.5pt,
    [sk.], [$U_1$ [V]], [$R_1$ [$Omega$]], [$R_2$ [$Omega$]], [$R_3$ [$Omega$]], [$R_4$ [$Omega$]], [$R_5$ [$Omega$]], [$R_6$ [$Omega$]],
    [#skupina], [#U1], [#R1], [#R2], [#R3], [#R4], [#R5], [#R6],
  )
  linebreak()

  image("fig/Pr2.pdf", width: 194pt)
}

// Problem 3
#let treti-zadani(skupina) = {
  let (U, I1, I2, R1, R2, R3, R4, R5, R6) = if skupina == "A" {
    (120, 0.5, 0.7, 530, 490, 650, 390, 320, 480)
  } else if skupina == "B" {
    (150, 0.7, 0.8, 490, 450, 610, 340, 340, 550)
  } else if skupina == "C" {
    (110, 0.9, 0.75, 440, 310, 560, 200, 300, 600)
  } else if skupina == "D" {
    (115, 0.6, 0.9, 500, 380, 480, 370, 280, 450)
  } else if skupina == "E" {
    (135, 0.2, 0.65, 520, 420, 520, 420, 210, 400)
  } else if skupina == "F" {
    (145, 0.4, 0.85, 480, 440, 530, 360, 250, 700)
  } else if skupina == "G" {
    (160, 0.35, 0.45, 460, 410, 540, 330, 290, 650)
  } else if skupina == "H" {
    (130, 0.95, 0.5, 470, 390, 580, 280, 250, 350)
  } else {
    (0, 0, 0, 0, 0, 0, 0, 0, 0)
  }

  [Stanovte napětí $U_(R 5)$ a proud $I_(R 5)$. Použijte metodu uzlových napětí ($U_A$, $U_B$, $U_C$). #linebreak()]

  table(
    columns: 10,
    align: center,
    stroke: 0.5pt,
    [sk.], [$U$ [V]], [$I_1$ [A]], [$I_2$ [A]], [$R_1$ [$Omega$]], [$R_2$ [$Omega$]], [$R_3$ [$Omega$]], [$R_4$ [$Omega$]], [$R_5$ [$Omega$]], [$R_6$ [$Omega$]],
    [#skupina], [#U], [#I1], [#I2], [#R1], [#R2], [#R3], [#R4], [#R5], [#R6],
  )
  linebreak()

  image("fig/Pr3.pdf", width: 277pt)
}

// Problem 4
#let ctvrty-zadani(skupina) = {
  let (U1, U2, R1, R2, L1, L2, C1, C2, f) = if skupina == "A" {
    (3, 5, 120, 140, 120, 100, 200, 105, 70)
  } else if skupina == "B" {
    (2, 4, 110, 150, 100, 85, 220, 95, 80)
  } else if skupina == "C" {
    (3, 4, 100, 130, 220, 70, 230, 85, 75)
  } else if skupina == "D" {
    (4, 5, 130, 150, 180, 90, 210, 75, 85)
  } else if skupina == "E" {
    (5, 3, 140, 130, 130, 60, 100, 65, 90)
  } else if skupina == "F" {
    (2, 3, 120, 100, 170, 80, 150, 90, 65)
  } else if skupina == "G" {
    (5, 5, 130, 120, 140, 60, 160, 80, 60)
  } else if skupina == "H" {
    (5, 6, 100, 100, 160, 75, 155, 70, 95)
  } else {
    (0, 0, 0, 0, 0, 0, 0, 0, 0)
  }

  [Pro napájecí napětí platí: $u_1 = U_1 dot.c sin(2 pi f t)$, $u_2 = U_2 dot.c sin(2 pi f t)$. #linebreak()
   Ve vztahu pro napětí $u_(C_2) = U_(C_2) dot.c sin(2 pi f t + phi_(C_2))$
   určete $|U_(C_2)|$ a $phi_(C_2)$. Použijte metodu smyčkových proudů.#linebreak()
   #linebreak()
   Pozn: Pomocné směry šipek napájecích zdrojů platí pro speciální časový okamžik ($t = frac(pi, 2 omega)$).#linebreak()]

  table(
    columns: 10,
    align: center,
    stroke: 0.5pt,
    [sk.], [$U_1$ [V]], [$U_2$ [V]], [$R_1$ [$Omega$]], [$R_2$ [$Omega$]], [$L_1$ [mH]], [$L_2$ [mH]], [$C_1$ [µF]], [$C_2$ [µF]], [$f$ [Hz]],
    [#skupina], [#U1], [#U2], [#R1], [#R2], [#L1], [#L2], [#C1], [#C2], [#f],
  )
  linebreak()

  image("fig/Pr4.pdf", width: 160pt)
}

// Problem 5
#let paty-zadani(skupina) = {
  let (U, L, R, iL0) = if skupina == "A" {
    (30, 5, 150, 1)
  } else if skupina == "B" {
    (20, 2, 100, 2)
  } else if skupina == "C" {
    (10, 4, 200, 5)
  } else if skupina == "D" {
    (60, 3, 120, 3)
  } else if skupina == "E" {
    (50, 5, 500, 4)
  } else if skupina == "F" {
    (70, 10, 350, 7)
  } else if skupina == "G" {
    (40, 8, 160, 6)
  } else if skupina == "H" {
    (90, 5, 450, 8)
  } else {
    (0, 0, 0, 0)
  }

  [V obvodu na obrázku níže v čase $t = 0$ [s] sepne spínač $S$. Sestavte diferenciální rovnici popisující chování obvodu na obrázku, dále ji upravte dosazením hodnot parametrů. Vypočítejte analytické řešení $i_L = f(t)$. Proveďte kontrolu výpočtu dosazením do sestavené diferenciální rovnice.#linebreak()]

  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [sk.], [$U$ [V]], [$L$ [H]], [$R$ [$Omega$]], [$i_L(0)$ [A]],
    [#skupina], [#U], [#L], [#R], [#iL0],
  )
  linebreak()

  image("fig/Pr5.pdf", width: 120pt)
}
