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
    private var model: VNCoreMLModel?

    init() throws {
        guard let url = Bundle.main.url(forResource: "CardDetector", withExtension: "mlmodelc") else {
            throw BotError.modelNotFound
        }
        model = try VNCoreMLModel(for: MLModel(contentsOf: url))
    }

    func recognizeCards(in pixelBuffer: CVPixelBuffer) -> GameObservation {
        GameObservation(handCards: [], availableElixir: 0, bestDefensePosition: CGPoint(x: 0.5, y: 0.65))
    }
}

enum BotError: LocalizedError {
    case modelNotFound
    var errorDescription: String? { "CardDetector.mlmodelc wurde nicht gefunden." }
}
