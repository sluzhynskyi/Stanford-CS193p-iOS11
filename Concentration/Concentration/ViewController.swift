//
//  ViewController.swift
//  Concentration
//
//  Created by Danylo Sluzhynskyi on 27.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCounterLable: UILabel!

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    var flipCount = 0 {
        didSet {
            flipCounterLable.text = "Flips: \(flipCount)"
        }
    }

    var emojiChoices = ["🔥", "☘️", "⭐️", "⚡️", "🧡", "👻", "✨", "🐶", "🦊", "🐼", "🦄", "🐵"].shuffled()
    var emoji: [Int: String] = [:]
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.firstIndex(of: sender) else {
            return
        }
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }

    func updateViewFromModel() {
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card.identifier), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .systemOrange
            }
        }
    }


    func emoji(for cardId: Int) -> String {
        if emoji[cardId] == nil, emojiChoices.count > 0 {
            emoji[cardId] = emojiChoices.removeLast()
        }
        return emoji[cardId] ?? "?"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

