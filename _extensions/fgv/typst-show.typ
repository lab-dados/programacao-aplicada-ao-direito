#show: doc => fgv-relatorio(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(eyebrow)$
  eyebrow: [$eyebrow$],
$endif$
$if(marca-logo)$
  logo: "$marca-logo$",
$endif$
$if(unidade)$
  unidade: [$unidade$],
$endif$
$if(versao)$
  versao: [$versao$],
$endif$
$if(creditos)$
  creditos: [$creditos$],
$endif$
$if(cabecalho)$
  cabecalho: [$cabecalho$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
  abstract-title: "$labels.abstract$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$", "Liberation Sans", "Helvetica"),
$endif$
$if(monofont)$
  mono-font: ("$monofont$", "Consolas", "DejaVu Sans Mono"),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
  toc_depth: $toc-depth$,
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)
