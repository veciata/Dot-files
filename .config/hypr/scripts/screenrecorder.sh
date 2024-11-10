#!/bin/bash

# wf-recorder'ın çalışıp çalışmadığını kontrol et
if pgrep -x "wf-recorder" >/dev/null; then
  pkill -x "wf-recorder"
  echo "wf-recorder durduruldu."
else
  wf-recorder
  echo "wf-recorder başlatıldı."
fi
