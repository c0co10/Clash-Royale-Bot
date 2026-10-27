# ClashBot DL — iOS Deep Learning Bot

iOS-Starter für einen Deep-Learning-Bot für dein eigenes Clash-Royale-ähnliches Spiel.

GitHub Actions baut bei jedem Push auf `main` eine unsignierte `.ipa` und lädt sie als Artifact hoch.

## IPA bauen

1. **Actions** öffnen.
2. **Build iOS IPA** starten.
3. Unter **Artifacts** `ClashBot-ipa` herunterladen.

## Modell einbinden

```bash
yolo export model=best.pt format=coreml
```

Kopiere `CardDetector.mlmodel` nach `Resources/` und passe `GameVision.swift` an.

## Spiel anbinden

Verbinde `TouchController.play(cardIndex:at:)` direkt mit deiner Spiel-Engine.
