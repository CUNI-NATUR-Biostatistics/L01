// Course logo on the first page of Typst learning materials.
#set page(background: context {
  if counter(page).get().first() == 1 {
    align(left + top, pad(left: 8mm, top: 8mm, image(
      "course-logo-vertical.svg",
      width: 22mm,
      alt: "Logo kurzu Biostatistika",
    )))
  }
})
