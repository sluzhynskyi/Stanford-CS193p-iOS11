//
//  ViewController.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 27.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCounterLable: UILabel!

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCard)

    var numberOfPairsOfCard: Int {
        return (cardButtons.count + 1) / 2
    }

    private(set) var flipCount = 0 {
        didSet {
            flipCounterLable.text = "Flips: \(flipCount)"
        }
    }

    private var emojiChoices = ["🔥", "☘️", "⭐️", "⚡️", "🧡", "👻", "✨", "🐶", "🦊", "🐼", "🦄", "🐵"].shuffled()

    private var emoji: [Card: String] = [:]

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.firstIndex(of: sender) else {
            print("touch not existed card")
            return
        }
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }

    private func updateViewFromModel() {
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .systemOrange
            }
        }
    }


    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.removeLast()
        }
        return emoji[card] ?? "?"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

