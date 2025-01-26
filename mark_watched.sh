#!/bin/bash

# 1) Count total unique URLs and warn user:
total_urls=$(jq -r '[.[] | .titleUrl] | unique | length' ~/Downloads/watch-history.json)
echo "Found $total_urls unique URLs to process. This may take a while..."

# 2) Create reversed list of unique URLs:
jq -r '[.[] | .titleUrl] | unique | reverse | .[]' ~/Downloads/watch-history.json > reversed_urls.txt

# 3) Mark videos as watched in batch:
# This extracts cookies from Chromium once and processes all URLs
yt-dlp --cookies-from-browser chromium --simulate --mark-watched -a reversed_urls.txt

# 4) Remove temporary file:
echo "Done! Cleaning up..."
rm reversed_urls.txt
