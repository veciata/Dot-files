#!/usr/bin/env python3
import sys
import requests
import json

# Google Suggest API ile otomatik tamamlama
def google_autocomplete(query):
    url = f"https://suggestqueries.google.com/complete/search?client=firefox&q={query}"
    response = requests.get(url)
    suggestions = json.loads(response.text)[1]  # Öneriler 2. indekste yer alır
    return suggestions

if __name__ == "__main__":
    query = sys.argv[1]  # Komut satırından gelen sorgu
    suggestions = google_autocomplete(query)
    for suggestion in suggestions:
        print(suggestion)

