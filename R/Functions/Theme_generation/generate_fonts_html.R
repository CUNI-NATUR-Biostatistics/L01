#----------------------------------------------------------#
#
#
#                        _brand
#
#         Generate theme/fonts-include.html from
#                    theme/fonts.json
#
#        Canonical source — lecture repos download
#        this file from _brand at render time.
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

generate_fonts_html <- function(
  fonts_file = here::here("theme/fonts.json"),
  output_file = here::here("theme/fonts-include.html")
) {
  message("Generating theme/fonts-include.html...\n")

  if (!file.exists(fonts_file)) {
    stop("fonts.json not found at: ", fonts_file)
  }

  fonts <-
    jsonlite::fromJSON(fonts_file)

  make_link <- function(family, weights) {
    encoded_family <-
      gsub(" ", "+", family)
    paste0(
      '<link href="https://fonts.googleapis.com/css2?family=',
      encoded_family,
      ":wght@",
      weights,
      '&display=swap" rel="stylesheet">'
    )
  }

  lines <-
    c(
      "<!-- Auto-generated Google Fonts links from theme/fonts.json.",
      "     Do not edit directly. Run R/generate_theme.R to regenerate. -->",
      '<link rel="preconnect" href="https://fonts.googleapis.com">',
      '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>',
      make_link(fonts$body, fonts$googleFonts$bodyWeights),
      make_link(fonts$heading, fonts$googleFonts$headingWeights),
      make_link(fonts$monospace, fonts$googleFonts$monospaceWeights),
      "",
      "<!-- Slide background fix: propagate .bg-XXX classes to RevealJS background layer. -->",
      "<!-- RevealJS renders full-viewport backgrounds in a separate .backgrounds container,  -->",
      "<!-- so background-color on <section> only tints the content box. This script reads   -->",
      "<!-- the .bg-XXX class and sets the matching data-background-color attribute so that  -->",
      "<!-- Reveal picks it up for the full-bleed background layer.                          -->",
      "<script>",
      "  (function () {",
      "    var BG_COLORS = {",
      "      'bg-indigo':    '#5D2890',",
      "      'bg-amethyst':  '#86579E',",
      "      'bg-olive':     '#8A8A8A',",
      "      'bg-red':       '#C94C4C',",
      "      'bg-graphite':  '#2E2E2E',",
      "      'bg-orange':    '#F3A712',",
      "      'bg-white':     '#FFFFFF',",
      "      'bg-parchment': '#F4F1EC'",
      "    };",
      "",
      "    function applyBgColors() {",
      "      var backgrounds = document.querySelector('.reveal > .backgrounds');",
      "      if (!backgrounds) return;",
      "      var sections = document.querySelectorAll('.reveal .slides section');",
      "      sections.forEach(function (section, idx) {",
      "        var bgClass = Object.keys(BG_COLORS).find(function (cls) {",
      "          return section.classList.contains(cls);",
      "        });",
      "        if (!bgClass) return;",
      "        var color = BG_COLORS[bgClass];",
      "        // Set data-background-color so Reveal uses it for the background layer.",
      "        section.setAttribute('data-background-color', color);",
      "        // Also directly paint the background element that is already in the DOM.",
      "        var bgEls = backgrounds.querySelectorAll('.slide-background');",
      "        if (bgEls[idx]) {",
      "          bgEls[idx].style.backgroundColor = color;",
      "          var contentEl = bgEls[idx].querySelector('.slide-background-content');",
      "          if (contentEl) contentEl.style.backgroundColor = color;",
      "        }",
      "      });",
      "    }",
      "",
      "    // Run once Reveal is ready; also re-run on slide change in case of lazy init.",
      "    if (typeof Reveal !== 'undefined' && Reveal.isReady && Reveal.isReady()) {",
      "      applyBgColors();",
      "    } else {",
      "      document.addEventListener('DOMContentLoaded', function () {",
      "        if (typeof Reveal !== 'undefined') {",
      "          Reveal.on('ready', applyBgColors);",
      "        }",
      "      });",
      "    }",
      "  })();",
      "</script>"
    )

  writeLines(lines, con = output_file)
  message("theme/fonts-include.html generated successfully\n")
}
