#!/bin/sh
for i in speech_data/Dutch/clips/*.mp3;
  do ffmpeg -i "$i" "speech_data/Dutch/wav_clips/$(basename ${i%.*}.wav)"
done
