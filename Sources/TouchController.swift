import UIKit

final class TouchController {
    func perform(_ action: BotAction) {
        if case .playCard(let cardIndex, at: let position) = action {
            play(cardIndex: cardIndex, at: position)
        }
    }

    private func play(cardIndex: Int, at position: CGPoint) {
        // TODO: Direkt an deine Spiel-Engine anbinden.
        print("Spiele Karte \(cardIndex) bei \(position)")
    }
}
