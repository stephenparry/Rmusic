library(chorrrds)
library(tidyverse)
library(chorddiag)

##Chord Analysis of the cure's disintegration
songs <- "the-cure" %>% 
  chorrrds::get_songs() 


disintegration=songs[c(106, 105, 40, 95, 89, 96, 51, 109, 137, 46, 65, 148),]
disintegration %>% 
  dplyr::pull(url) %>%                     
  purrr::map(chorrrds::get_chords) %>%  
  purrr::map_dfr(dplyr::mutate_if, is.factor, as.character)   %>% 
  chorrrds::clean(message = FALSE)  %>%
  tidyr::separate(music, c("artist", "music"), 
                  sep = "(?<=cure) ", extra = "merge") -> chords_d


chords_d %>% 
  group_by(music) %>% 
  count(chord) %>%
  top_n(n, n = 3) %>%
  mutate(prop = scales::percent(n/sum(n)))->chord_summary


comp <- chords_d %>% 
  dplyr::mutate(seq = lead(chord)) %>% 
  dplyr::filter(chord != seq) %>% 
  dplyr::group_by(chord, seq) %>%  
  dplyr::summarise(n = n())


mat <- tidyr::spread(comp, key = chord, value = n, fill = 0)  
mm <- as.matrix(mat[ -1]) 

chorddiag(mm, showTicks = T, palette = "Greens")
