# ClashBot DL — iOS Deep Learning Bot

iOS-Starter für einen Deep-Learning-Bot mit den vortrainierten **KataCR-YOLOv8-Modellen**.

GitHub Actions lädt die Modelle herunter, konvertiert sie zu Core ML und baut eine unsignierte `.ipa`.

## IPA bauen

1. **Actions** öffnen.
2. **Build iOS IPA with KataCR models** starten.
3. Unter **Artifacts** `ClashBot-ipa` herunterladen.

## Verwendete Modelle

- `detector1_v0.7.13.pt`
- `detector2_v0.7.13.pt`

Beide werden automatisch von GitHub heruntergeladen und zu Core ML exportiert.

## Wichtig

Die Modelle wurden für echtes Clash Royale trainiert. Für dein eigenes Spiel musst du sie später mit eigenen Screenshots fine-tunen, damit deine Karten zuverlässig erkannt werden.
