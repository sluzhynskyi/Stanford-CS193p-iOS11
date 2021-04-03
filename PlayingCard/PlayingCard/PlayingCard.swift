//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Danylo Sluzhynskyi on 03.04.2021.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    // MARK: - Types
    
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "❤️"
        case diamonds = "♦️"
        case clubs  = "♣️"
        
        static var allCases: [PlayingCard.Suit] {
            [.spades, .hearts, .diamonds, .clubs]
        }
        
        var description: String {
            rawValue
        }
    }
    
    enum FaceCard: Int, CustomStringConvertible {
        case jack = 11
        case queen
        case king
        
        var description: String {
            switch self {
                case .jack: return "Jack"
                case .queen: return "Queen"
                case .king: return "King"
            }
        }
    }
    
    enum Rank: CaseIterable, CustomStringConvertible {
        case ace
        case face(FaceCard)
        case numeric(Int)
        
        var order: Int {
            switch self {
                case .ace:
                    return 1
                    
                case .numeric(let pips):
                    return pips
                    
                case .face(let kind):
                    return kind.rawValue
            }
        }
        
        static var allCases: [Rank] {
            var allRanks: [Rank] = [.ace]
            
            for pips in 2..<11 {
                allRanks.append(Rank.numeric(pips))
            }
            
            allRanks += [.face(.jack), .face(.queen), .face(.king)]
            
            return allRanks
        }
        
        var description: String {
            switch self {
                case .ace: return "Ace"
                case .numeric(let pips): return "\(pips)"
                case .face(let kind): return kind.description
            }
        }
    }
    
    
    // MARK: - Properties
    
    var suit: Suit
    var rank: Rank
    
    var description: String {
        "\(rank) of \(suit)"
    }
}
