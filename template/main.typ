// main.typ
// ============================================================================
// NTUST Thesis — Main Document (Typst)
// ============================================================================
// To compile:  typst compile main.typ
// ============================================================================

#import "@local/ntust-thesis:0.1.0": get-labels, ntust-thesis
#import "frontpages/names.typ": thesis-info

// Choose the language
// Change to "zh" for Chinese mode
#let language = "en"
#let l = get-labels(language)

// Apply the thesis template
#show: ntust-thesis.with(
  lang: language,
  info: thesis-info,
  abstracts: (
    zh: include "frontpages/abstract.zh.typ",
    en: include "frontpages/abstract.en.typ",
  ),
  acknowledgement: include "frontpages/ackn.typ",
)

// Main body
#include "sections/ch1-intro.typ"
#include "sections/ch2-related-work.typ"
#include "sections/ch3-method.typ"
#include "sections/ch4-experiment.typ"
#include "sections/conclusion.typ"

// References
#pagebreak()
#bibliography("cite.bib", style: "ieee", title: l.references)

// Copyright form placeholder
#pagebreak()
#heading(level: 1, numbering: none)[#l.copyright-form]
#v(1fr)
#align(center, text(fill: luma(180), size: 14pt)[
  （此頁請放入已簽名之授權書 / Insert signed letter of authority here）
])
#v(1fr)
