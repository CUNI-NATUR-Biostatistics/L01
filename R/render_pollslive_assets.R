#----------------------------------------------------------#
#
#
#                  L01 PollsLive onboarding
#
#                 Verify text-only assets
#
#                      Ondřej Mottl
#                          2026
#
#----------------------------------------------------------#

library(here)

here::i_am("R/render_pollslive_assets.R")


#----------------------------------------------------------#
# Verify the text-only onboarding contract -----
#----------------------------------------------------------#

# The approved L01 onboarding questions are self-contained and deliberately
# avoid evidence from the mammal dataset, which students have not seen yet.
stopifnot(dir.exists(here::here("pollslive")))
