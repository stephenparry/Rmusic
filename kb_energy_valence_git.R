##Stephen Parry
##Kate Bush Track Data from Spotify
##Energy and Valence 
##August 31, 2019

library(spotifyr)
library(tidyverse)
library(knitr)
library(lubridate)
library(ggplot2)
library(ggthemes)
#https://developer.spotify.com/dashboard/ get access to spotify API to get codes for the CLIENT_ID and CLIENT_SECRET
Sys.setenv(SPOTIFY_CLIENT_ID = ' ')
Sys.setenv(SPOTIFY_CLIENT_SECRET = ' ')

kb <- get_artist_audio_features('Kate Bush')

#Remove albums that appear in duplicate in the dataset and also remove side projects
kb %>% filter(album_name!="Selection from 'The Other Sides' (Remastered)") %>%
  filter(album_name!="Director's Cut") %>%
  filter(album_release_date!=1993)%>%
  filter(album_release_date!=1989)%>%
  filter(album_release_date!="2005-10-03")->kb

ggplot(data=kb, aes(x=energy, y=valence, color=album_name))+
  geom_point()+theme_tufte()+
  xlab("Energy")+
  ylab("Valence")+
  xlim(0,1)+
  labs(color = "Album")+
  ggtitle("Kate Bush: Energy and Valence")+
  annotate("text",x=.63,y=.197, label="Running up that Hill", cex=3)+
  annotate("text",x=.06,y=.90, label="Aerial Tal", cex=3)+
  annotate("text",x=.45,y=.89, label="Them Heavy People", cex=3)+
  annotate("text",x=.27,y=.055, label="Wow", cex=3)+
  annotate("text",x=.54,y=.048, label="Nocturn", cex=3)+
  annotate("text",x=.93,y=.46, label="The Big Sky", cex=3)+
  annotate("text",x=.79,y=.62, label="Jig of Life", cex=3)+
  annotate("text",x=.80,y=.83, label="Violin", cex=3)+
  annotate("text",x=.71,y=.80, label="Sat in Your Lap", cex=3)+
  annotate("text",x=.71,y=.51, label="Get out of My House", cex=3)+
  annotate("text",x=.86,y=.9, label="Rubberband Girl", cex=3)+
  annotate("text",x=.93,y=.79, label="The Red Shoes", cex=3)+
  annotate("text",x=.60,y=.16, label="Waking the Witch", cex=3)+
  annotate("text",x=.62,y=.75, label="Joanni", cex=3)+
  annotate("text",x=.83,y=.67, label="Heads We're Dancing", cex=3)+
  annotate("text",x=.325,y=.495, label="Wild Man", cex=3)+
  annotate("text",x=.15,y=.32, label="Army Dreamers", cex=3)+
  annotate("text",x=.155,y=.04, label="Hello Earth", cex=3)+
  annotate("text",x=.49,y=.29, label="Babooshka", cex=3)+
  annotate("text",x=.49,y=.4, label="The Dreaming", cex=3)+
  annotate("text",x=.265,y=.65, label="All We Ever Look For", cex=3)+
  annotate("text",x=.5,y=.63, label="Full House", cex=3)+
  scale_colour_manual(values=c("#eee3d3", "#eeb245","#9b5383","#be7638","#494438","#bf9a71","#f8d864","#ba1e22", "#ccc3b0"))






