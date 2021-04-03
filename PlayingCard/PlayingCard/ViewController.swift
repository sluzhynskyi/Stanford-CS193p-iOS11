//
//  ViewController.swift
//  PlayingCard
//
//  Created by Danylo Sluzhynskyi on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        var cardDeck = PlayingCardDeck()
        var cards = cardDeck.cards.shuffled()
        
        for _ in 1...10 {
            print("\(cards.removeLast())")
        }
    }
}

