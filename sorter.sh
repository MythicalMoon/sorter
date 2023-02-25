#!/bin/bash

# Set the directories for each file type

ZIPS_DIR=~/Downloads/Zips
DOCUMENTS_DIR=~/Downloads/Documents
PICTURES_DIR=~/Downloads/Pictures
MUSIC_DIR=~/Downloads/Music
VIDEOS_DIR=~/Downloads/Videos
OVPN_DIR=~/Downloads/OVPN
OTHER_DIR=~/Downloads/Other

# Create directories for each file type

mkdir -p "$ZIPS_DIR" "$DOCUMENTS_DIR" "$PICTURES_DIR" "$MUSIC_DIR" "$VIDEOS_DIR" "$OVPN_DIR" "$OTHER_DIR"

# Sort files by extension and move them to the appropriate directory
for file in ~/Downloads/*; do
  if [[ -f "$file" ]]; then
    ext="${file##*.}"
    case "$ext" in
      zip|rar|tar|gz|7z|iso|gzip|xz|bz2|bz) mv "$file" "$ZIPS_DIR" ;;
      md|txt|doc|docx|pdf|odt) mv "$file" "$DOCUMENTS_DIR" ;;
      jpg|jpeg|png|gif|bmp) mv "$file" "$PICTURES_DIR" ;;
      mp3|wav|ogg|flac) mv "$file" "$MUSIC_DIR" ;;
      mp4|avi|mov|wmv|mkv) mv "$file" "$VIDEOS_DIR" ;;
      ovpn) mv "$file" "$OVPN_DIR" ;;
      *) mv "$file" "$OTHER_DIR" ;;
    esac
  fi
done
