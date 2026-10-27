import Foundation
import CoreML

final class BotEngine {
    private var isRunning = false
    private var vision: GameVision?
    private let touchController = TouchController()

    func start() -> String {
        guard !isRunning else { return "Bot läuft bereits." }
        do {
            vision = try GameVision()
            isRunning = true
            return "Bot gestartet."
        } catch {
            return "Fehler: \(error.localizedDescription)"
        }
    }

    func stop() -> String {
        isRunning = false
        return "Bot gestoppt."
    }

    func processFrame(_ pixelBuffer: CVPixelBuffer) {
        guard isRunning, let vision else { return }
        let observation = vision.recognizeCards(in: pixelBuffer)
        touchController.perform(chooseAction(for: observation))
    }

    private func chooseAction(for observation: GameObservation) -> BotAction {
        if observation.availableElixir >= 0.5,
           let card = observation.handCards.first(where: { $0.isPlayable }) {
            return .playCard(card.index, at: observation.bestDefensePosition)
        }
        return .wait
    }
}
