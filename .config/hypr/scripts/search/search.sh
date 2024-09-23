#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS

URLS=(
  ["farside"]="https://farside.link/whoogle/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["bing"]="https://www.bing.com/search?q="
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["imdb"]="http://www.imdb.com/find?ref_=nv_sr_fn&q="
  ["google"]="https://www.google.com/search?q="
  ["github"]="https://github.com/search?q="
  ["seslisözlük"]="https://www.seslisozluk.net/"
  ["wikipedia (en)"]="https://en.wikipedia.org/w/index.php?search="
  ["wikipedia (tr)"]="https://tr.wikipedia.org/w/index.php?search="
  ["youtube music"]="https://music.youtube.com/search?q="
  ["chordify"]="https://chordify.net/search/"
  ["ultimate guitar tab"]="https://www.ultimate-guitar.com/search.php?search_type=title&value="
)

# List for rofi
gen_list() {
  for i in "${!URLS[@]}"; do
    echo "$i"
  done
}

HISTORY_FILE="$HOME/.search_history"

if [ ! -f "$HISTORY_FILE" ]; then
  touch "$HISTORY_FILE"
fi

# Python scriptini kullanarak Google otomatik tamamlama önerileri alma
autocomplete() {
  local query="$1"
  python3 google_suggest.py "$query"
}

main() {
  # Kullanıcıya platform seçimi sunulur
  platform=$( (for key in "${!URLS[@]}"; do echo "$key"; done) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "Search > ")

  if [[ -n "$platform" ]]; then
    # Eğer Google seçildiyse otomatik tamamlama özelliği eklenir
    if [[ "$platform" == "google" ]]; then
      initial_query=$( (echo) | rofi -dmenu -matching fuzzy -location 0 -p "Query > ")

      if [[ -n "$initial_query" ]]; then
        # Google Suggest API ile öneriler alınıyor
        suggestions=$(autocomplete "$initial_query")
        query=$(echo "$suggestions" | rofi -dmenu -matching fuzzy -location 0 -p "Suggestions > ")
      fi
    else
      # Diğer platformlar için normal sorgu girişi
      query=$( (echo) | rofi -dmenu -matching fuzzy -location 0 -p "Query > ")
    fi

    # Eğer bir sorgu girilmişse devam eder
    if [[ -n "$query" ]]; then
      echo "$query" >>"$HISTORY_FILE" # Geçmişe kaydet
      url=${URLS[$platform]}$query
      $browser --private-window "$url" # Aramayı aç
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
