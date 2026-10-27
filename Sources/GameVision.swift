import Foundation
import CoreML
import Vision

struct HandCard {
    let index: Int
    let name: String
    let isPlayable: Bool
}

struct GameObservation {
    let handCards: [HandCard]
    let availableElixir: Float
    let bestDefensePosition: CGPoint
}

enum BotAction {
    case wait
    case playCard(Int, at: CGPoint)
}

final class GameVision {
    private var detector1: VNCoreMLModel?
    private var detector2: VNCoreMLModel?

    init() throws {
        detector1 = try loadDetector("detector1_v0_7_13")
        detector2 = try loadDetector("detector2_v0_7_13")
    }

    private func loadDetector(_ name: String) throws -> VNCoreMLModel {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mlmodelc") else {
            throw BotError.modelNotFound(name)
        }
        return try VNCoreMLModel(for: MLModel(contentsOf: url))
    }

    func recognizeCards(in pixelBuffer: CVPixelBuffer) -> GameObservation {
        // TODO: detector1 und detector2 mit Vision auswerten.
        // Die Ergebnisse muessen zu Karten, Elixir und Tuermen zusammengefuehrt werden.
        return GameObservation(
            handCards: [],
            availableElixir: 0,
            bestDefensePosition: CGPoint(x: 0.5, y: 0.65)
        )
    }
}

enum BotError: LocalizedError {
    case modelNotFound(String)

    var errorDescription: String? {
        switch self {
        case .modelNotFound(let name):
            return "Core-ML-Modell \(name).mlmodelc wurde nicht gefunden."
        }
    }
}
