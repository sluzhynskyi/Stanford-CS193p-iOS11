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
    var flipCount = 0 {
        didSet{
            flipCounterLable.text = "Flips: \(flipCount)"
        }
    }
    let emojiChoices = ["🔥", "💩", "🔥", "💩"]

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        guard let cardNumber = cardButtons.firstIndex(of: sender) else {
            return
        }

        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }


    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle! == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

