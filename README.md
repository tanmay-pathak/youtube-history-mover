# Mark Watched Script

A simplified method to transfer YouTube “watched” history from one account to another.  
Based on [this Reddit post](https://www.reddit.com/r/youtube/comments/18kd0ce/transfer_youtube_and_youtube_music_history/).

## Requirements

- [Google Takeout](https://takeout.google.com/) export of YouTube data (ensure “History” is included as JSON).  
- [Homebrew](https://brew.sh/) on macOS.  
- `jq` for processing JSON (`brew install jq`).  
- `yt-dlp` for marking videos as watched (`brew install yt-dlp`).  
- [Chromium](https://www.chromium.org/) if you want a clean browser environment (`brew install chromium`).
- Your Chromium browser should have only one profile and it should have the account logged in, that you would like to transfer history to.

## Steps

1. **Export History:**  
   - Go to [Google Takeout](https://takeout.google.com/).  
   - Deselect everything except “YouTube and YouTube Music.”  
   - Under “All YouTube data included,” choose only “History” in JSON format.  
   - Download and unzip the archive.

2. **Place the JSON file**  
   - Copy `watch-history.json` to `~/Downloads`.

3. **Run the Script:**  
   - Make `mark_watched.sh` executable:  

     ```bash
     chmod +x mark_watched.sh
     ```

   - Execute:  

     ```bash
     ./mark_watched.sh
     ```

   - The script will parse your history, warn about total entries, mark them as watched via `yt-dlp`, and clean up.

4. **Wait and Verify**  
   - The process may take a while. Once finished, check your YouTube account for updated watch history.

## Notes

- If you need to test a smaller set of URLs first, modify the script to process fewer lines.  
- Make sure Chromium is closed or not in use by other processes to avoid cookie-access issues.
- Adjust the script or path if you’ve placed `watch-history.json` elsewhere.  
