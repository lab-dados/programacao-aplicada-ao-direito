// =============================================================================
//  Template Typst | Identidade visual FGV
//  Referencias: Manual de Identidade Visual FGV (SCM / DICOM)
//    . Cor padrao: azul escuro, Pantone 281 C / 281 U
//                  CMYK 100 / 72 / 0 / 32, RGB 28 / 47 / 103
//    . Tipologia institucional: Zurich Cn BT (marca)
//                  Arial e derivados para cartas e documentos
//    . Area de nao interferencia da assinatura: altura do simbolo "V"
// =============================================================================

// ---------- Paleta -----------------------------------------------------------
#let fgv-azul = rgb("#023A78") // azul institucional (assinatura FGV)
#let fgv-azul-claro = rgb("#0791D3") // azul de apoio (simbolo "V")
#let fgv-azul-281 = rgb("#1C2F67") // Pantone 281 C, RGB 28/47/103
#let fgv-tinta = rgb("#22303D")
#let fgv-cinza = rgb("#5B6B7C")
#let fgv-borda = rgb("#D3DEE9")
#let fgv-neve = rgb("#F5F8FB")
#let fgv-gelo = rgb("#EDF2F7")

// ---------- Callouts na linguagem da marca -----------------------------------
#let fgv-callout-cores = (
  "#0758e5": (fgv-azul-claro, rgb("#EAF4FC")), // note
  "#00a047": (rgb("#0E7C5A"), rgb("#E8F5F0")), // tip
  "#eb9113": (rgb("#9C6F0B"), rgb("#FBF3E0")), // warning
  "#cc1914": (rgb("#B03027"), rgb("#FBEDEC")), // important
  "#fc5300": (rgb("#C0561B"), rgb("#FCF0E8")), // caution
  "#eac700": (rgb("#9C6F0B"), rgb("#FBF3E0")), // warning (variante)
)

#let callout(
  body: [],
  title: "Nota",
  background_color: rgb("#dddddd"),
  icon: none,
  icon_color: black,
  body_background_color: white,
) = {
  let chave = lower(icon_color.to-hex()).slice(0, 7)
  let par = fgv-callout-cores.at(chave, default: (fgv-azul, fgv-neve))
  let destaque = par.at(0)
  let fundo = par.at(1)
  block(
    width: 100%,
    breakable: false,
    fill: fundo,
    radius: (right: 3pt),
    stroke: (left: 3pt + destaque),
    inset: (left: 13pt, right: 13pt, top: 10pt, bottom: 11pt),
    above: 1.25em,
    below: 1.25em,
  )[
    #block(below: if body == [] { 0pt } else { 7pt })[
      #text(fill: destaque, weight: "bold", size: 8.5pt, tracking: 0.09em)[
        #upper(title)
      ]
    ]
    #if body != [] {
      set text(size: 9.8pt, fill: fgv-tinta)
      body
    }
  ]
}

// ---------- Elementos auxiliares ---------------------------------------------
#let fgv-etiqueta(txt, cor: fgv-azul-claro) = box(
  fill: cor,
  inset: (x: 7pt, y: 4pt),
  radius: 2pt,
  text(fill: white, weight: "bold", size: 7.5pt, tracking: 0.11em)[#upper(txt)],
)

#let fgv-ficha(itens) = block(
  width: 100%,
  fill: fgv-neve,
  stroke: (left: 3pt + fgv-azul-claro, rest: 0.6pt + fgv-borda),
  radius: (right: 3pt),
  inset: (x: 14pt, y: 12pt),
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    row-gutter: 7pt,
    ..itens
      .map(it => (
        text(size: 8pt, weight: "bold", fill: fgv-cinza, tracking: 0.07em)[
          #upper(it.at(0))
        ],
        text(size: 9.5pt, fill: fgv-tinta)[#it.at(1)],
      ))
      .flatten()
  )
]

// ---------- Cabecalho do documento ------------------------------------------
#let fgv-abertura(
  title: none,
  subtitle: none,
  eyebrow: none,
  logo: none,
  assinatura: none,
  body-font: "Arial",
) = {
  block(width: 100%, below: 1.6em)[
    #set par(justify: false, leading: 0.5em)
    #grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      column-gutter: 16pt,
      block[
        #if eyebrow != none {
          block(below: 7pt)[
            #text(
              fill: fgv-azul-claro,
              weight: "bold",
              size: 8pt,
              tracking: 0.14em,
              font: body-font,
            )[#upper(eyebrow)]
          ]
        }
        #text(fill: fgv-azul, weight: "bold", size: 19pt, font: body-font)[#title]
      ],
      if logo != none { image(logo, height: 0.72cm) },
    )
    #v(9pt)
    #line(length: 100%, stroke: 2pt + fgv-azul)
    #v(7pt)
    #grid(
      columns: (1fr, auto),
      align: (left + top, right + top),
      column-gutter: 16pt,
      text(size: 9.5pt, fill: fgv-cinza)[#subtitle],
      text(size: 8.5pt, fill: fgv-cinza)[#assinatura],
    )
  ]
}

// ---------- Documento --------------------------------------------------------
#let fgv-relatorio(
  title: none,
  subtitle: none,
  eyebrow: none,
  authors: none,
  date: none,
  logo: none,
  unidade: none,
  versao: none,
  creditos: none,
  cabecalho: none,
  abstract: none,
  abstract-title: none,
  paper: "a4",
  margin: (x: 2.4cm, top: 3.0cm, bottom: 2.4cm),
  lang: "pt",
  region: "BR",
  font: ("Arial", "Liberation Sans", "Helvetica"),
  mono-font: ("JetBrains Mono", "Consolas", "DejaVu Sans Mono"),
  fontsize: 10.5pt,
  sectionnumbering: "1.",
  toc: false,
  toc_title: "Sumário",
  toc_depth: 2,
  toc_indent: 1.2em,
  cols: 1,
  doc,
) = {
  let heading-font = font

  // ----- Miolo
  set page(
    paper: paper,
    margin: margin,
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 7.8pt, fill: fgv-cinza)
        grid(
          columns: (1fr, auto),
          align(left)[#if cabecalho != none { cabecalho } else { title }],
          align(right)[#text(fill: fgv-azul, weight: "bold")[FGV]],
        )
        v(-5pt)
        line(length: 100%, stroke: 0.6pt + fgv-borda)
      }
    },
    footer: context {
      line(length: 100%, stroke: 0.6pt + fgv-borda)
      v(-3pt)
      set text(size: 7.8pt, fill: fgv-cinza)
      grid(
        columns: (1fr, auto),
        align(left)[#if unidade != none { unidade } else { "" }],
        align(right)[
          #text(fill: fgv-azul, weight: "bold")[#counter(page).display("1")]
        ],
      )
    },
    numbering: "1",
  )
  counter(page).update(1)

  set text(lang: lang, region: region, font: font, size: fontsize, fill: fgv-tinta)
  set par(justify: true, leading: 0.72em, spacing: 1.15em)
  set heading(numbering: sectionnumbering)
  set list(marker: (
    text(fill: fgv-azul-claro)[#sym.bullet],
    text(fill: fgv-azul-claro)[#sym.dash.en],
  ))
  set enum(numbering: n => text(fill: fgv-azul, weight: "bold")[#n.])

  // Titulos
  show heading.where(level: 1): it => block(above: 1.5em, below: 0.7em, width: 100%)[
    #set par(justify: false, leading: 0.5em, spacing: 0pt)
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.5em,
      if it.numbering != none {
        text(fill: fgv-azul-claro, weight: "bold", size: 16pt, font: heading-font)[
          #counter(heading).display(it.numbering)
        ]
      } else { none },
      text(fill: fgv-azul, weight: "bold", size: 16pt, font: heading-font)[#it.body],
    )
    #v(3pt)
    #line(length: 100%, stroke: 0.9pt + fgv-borda)
  ]

  show heading.where(level: 2): it => block(above: 1.6em, below: 0.75em, width: 100%)[
    #set par(justify: false, leading: 0.5em)
    #text(fill: fgv-azul-281, weight: "bold", size: 12pt, font: heading-font)[
      #if it.numbering != none [
        #counter(heading).display(it.numbering)#h(0.45em)
      ]
      #it.body
    ]
  ]

  show heading.where(level: 3): it => block(above: 1.3em, below: 0.6em, width: 100%)[
    #set par(justify: false)
    #text(
      fill: fgv-cinza,
      weight: "bold",
      size: 9pt,
      tracking: 0.09em,
      font: heading-font,
    )[#upper(it.body)]
  ]

  // Links
  show link: it => underline(
    offset: 2pt,
    stroke: 0.5pt + fgv-azul-claro.transparentize(45%),
    text(fill: fgv-azul-claro, weight: "medium")[#it],
  )

  // Codigo
  show raw.where(block: false): it => box(
    fill: fgv-gelo,
    outset: (x: 2.2pt, y: 3.2pt),
    radius: 2pt,
    text(font: mono-font, size: 0.88em, fill: fgv-azul-281)[#it],
  )

  show raw.where(block: true): set par(justify: false, leading: 0.62em)
  show raw.where(block: true): it => block(
    width: 100%,
    fill: fgv-neve,
    stroke: (left: 2.5pt + fgv-azul-claro, rest: 0.6pt + fgv-borda),
    radius: (right: 3pt),
    inset: (left: 13pt, right: 13pt, top: 11pt, bottom: 11pt),
    above: 1.2em,
    below: 1.2em,
    breakable: false,
    {
      set block(fill: none, inset: 0pt, radius: 0pt, stroke: none, above: 0pt, below: 0pt)
      text(font: mono-font, size: 9pt, fill: fgv-azul-281)[#it]
    },
  )

  // Tabelas
  set table(
    inset: (x: 8pt, y: 7pt),
    stroke: none,
    fill: (x, y) => if y == 0 { fgv-azul } else if calc.odd(y) { fgv-neve } else { white },
  )
  show table.cell.where(y: 0): set text(fill: white, weight: "bold", size: 9pt)
  show table: set text(size: 9.3pt)
  show table: set par(justify: false, leading: 0.6em)

  // Figuras e citacoes
  show figure.caption: it => block(width: 100%, align(left, text(size: 8.5pt, fill: fgv-cinza)[#it]))
  show quote.where(block: true): it => block(
    width: 100%,
    inset: (left: 14pt, y: 4pt),
    stroke: (left: 2pt + fgv-borda),
    text(style: "italic", fill: fgv-cinza)[#it.body],
  )

  fgv-abertura(
    title: title,
    subtitle: subtitle,
    eyebrow: eyebrow,
    logo: logo,
    assinatura: {
      let quem = if authors != none { authors.map(a => a.name).join(", ") } else { none }
      let partes = ()
      if quem != none { partes.push(quem) }
      if date != none { partes.push(date) }
      partes.join(" | ")
    },
    body-font: font,
  )

  if abstract != none {
    block(
      width: 100%,
      fill: fgv-neve,
      stroke: (left: 3pt + fgv-azul),
      inset: (x: 14pt, y: 12pt),
      radius: (right: 3pt),
      below: 2em,
    )[
      #text(size: 8pt, weight: "bold", fill: fgv-azul, tracking: 0.1em)[
        #upper(if abstract-title != none { abstract-title } else { "Resumo" })
      ]
      #v(5pt)
      #set text(size: 9.8pt)
      #abstract
    ]
  }

  if toc {
    block(above: 0em, below: 2.2em, width: 100%)[
      #text(fill: fgv-azul, weight: "bold", size: 13pt, font: heading-font)[#toc_title]
      #v(4pt)
      #line(length: 100%, stroke: 0.9pt + fgv-borda)
      #v(9pt)
      #show outline.entry: it => {
        set text(fill: if it.level == 1 { fgv-azul } else { fgv-tinta })
        if it.level == 1 { text(weight: "bold")[#it] } else { it }
      }
      #outline(title: none, depth: toc_depth, indent: toc_indent)
    ]
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}
