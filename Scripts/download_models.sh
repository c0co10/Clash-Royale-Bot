#!/bin/bash
set -e

mkdir -p models

curl -L -o models/detector1_v0.7.13.pt \
  https://raw.githubusercontent.com/shawnxu0407/Clash_Royale_agent/main/detector1_v0.7.13.pt

curl -L -o models/detector2_v0.7.13.pt \
  https://raw.githubusercontent.com/shawnxu0407/Clash_Royale_agent/main/detector2_v0.7.13.pt

ls -lh models/
