#!/usr/bin/env bash

# Directory to save the wallpaper
WALLPAPER_DIR="$HOME/Pictures/BingWallpapers"
mkdir -p "$WALLPAPER_DIR"

# Get today's date
DATE=$(date '+%Y-%m-%d')

# Bing URL for the daily wallpaper
BING_URL="https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"

# Fetch the wallpaper URL
JSON=$(curl -s "$BING_URL")
IMAGE_URL="https://www.bing.com$(echo "$JSON" | jq -r '.images[0].url')"
IMAGE_NAME="$DATE-$(basename "$IMAGE_URL")"
IMAGE_PATH="$WALLPAPER_DIR/$IMAGE_NAME"

# Download the wallpaper if it doesn't already exist
if [ ! -f "$IMAGE_PATH" ]; then
    wget -O "$IMAGE_PATH" "$IMAGE_URL"
fi

# Set the wallpaper
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$IMAGE_PATH\" as POSIX file"

