//
//  Concentration.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 31.12.2020.
//

import Foundation

class Concentration {
    var cards: [Card] = []
    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        let card = cards[index]
        if !card.isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Only one card is FaceUP
                if card.identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil

            }
            else {
                // Either no cards or 2 cards are FaceUp
                for faceDownCardIndex in 0..<cards.count {
                    cards[faceDownCardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }

        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }

}
