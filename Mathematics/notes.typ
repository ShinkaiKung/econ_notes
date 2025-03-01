#import "lib.typ": *

#show: template.with(
  title: [Mathmatics for Economics],
  short_title: "Math for Econ",
  description: [
    Notes based on lectures for Mathmatics for Economics
  ],
  date: datetime(year: 2025, month: 2, day: 25),
  authors: (
    (
      name: "Zian Gong",
      link: "",
    ),
  ),
  
  // lof: true,
  // lot: true,
  // lol: true,
  bibliography_file: "refs.bib",
  paper_size: "a4",
  // landscape: true,
  cols: 1,
  text_font: "STIX Two Text",
  // code_font: "Cascadia Mono",
  accent: "#1A41AC", // blue
  h1-prefix: "Lecture",
  colortab: true,
)

#include "content/1_linear_algebra.typ"
