install.packages(c("seewave", "tuneR","phonTools"))
library(seewave)
library(tuneR)
library(phonTools)
song <- readMP3("song.mp3")

s <- song[100:2000]
spectro(s,wl=512)
spectro(s)

data(tico)
data(pellucens)
data (sound)
# simple plots
spectro(tico,f=22050)
d <- sound[10:100]
savewav(tico, filename = "tico.wav")


# spectro
wav <- readWave("tico.wav")
spectro(wav) # success

## spectro
swav <- readWave("cello.wav")
spectro(swav)
sa <- swav[10000:20000]
spectro(sa) # success
s2 <- swav[54448:54451]
spectro(s2) # fail

install.packages("phonTools")
library(phonTools)

## spectrogram
data("sound")
spectrogram(sound) ## success
ss <- cutw(sound, 1000,2000)
spectro(ss) ## fail


# soundgen -> fail from file 
install.packages("soundgen")
library(soundgen)
spectrogram(ss)

# EMd 
install.packages("EMD")
library(EMD)


# algorithm 
# https://www.rdocumentation.org/packages/signal/versions/0.7-6/topics/specgram

# https://stackoverflow.com/questions/45084254/r-plot-spectrogram-base-on-the-amplitude-data-of-a-wave
v <- runif(5000, -2^15, 2^15-1)
v.wav <- Wave(v, samp.rate=8000, bit=16)
spectro(v.wav)

# do mp3 
setwd("C:\\Users\\jzheng4\\Desktop\\git\\rLearning")
library(tuneR)
library(seewave)
song <- readMP3("song.mp3")
ss <- song[50000:60000]
viewSpec(ss) # only black and white
viewSpec(ss, spec.col = rainbow.1())

install.packages("monitoR")
library(monitoR)
data(survey)
viewSpec(survey)

