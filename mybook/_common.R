set.seed(1014)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  fig.width = 6,
  fig.asp = 2 / 3,
  fig.show = "hold"
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

ggplot2::theme_set(ggplot2::theme_gray(12))

# use results: "asis" when setting a status for a chapter
status <- function(type) {
  status <- switch(
    type,
    polishing = "읽을 수 있어야 하지만 현재 최종 다듬기 과정을 거치고 있습니다",
    restructuring = "대대적인 구조 조정을 겪고 있어 혼란스럽거나 불완전할 수 있습니다",
    drafting = "현재 아이디어를 모아두는 곳이며, 아직 읽는 것을 권장하지 않습니다",
    complete = "대부분 완료되었으며 최종 교정만 남겨두고 있습니다",
    stop("유효하지 않은 `type`입니다", call. = FALSE)
  )

  class <- switch(
    type,
    polishing = "note",
    restructuring = "important",
    drafting = "important",
    complete = "note"
  )

  cat(paste0(
    "\n",
    ":::: status\n",
    "::: callout-",
    class,
    " \n",
    "여러분은 현재 R for Data Science 2판의 작업 중인 버전을 읽고 계십니다. ",
    "이 챕터는 ",
    status,
    ". ",
    "완성된 1판은 <https://r4ds.had.co.nz>에서 확인하실 수 있습니다.\n",
    ":::\n",
    "::::\n"
  ))
}