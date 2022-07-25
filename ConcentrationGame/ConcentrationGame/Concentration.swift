//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Mohit Katkar on 17/02/22.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexofOneAndOnlyFacUpCard: Int? {
        get {
            var foundIndex: Int?
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    func chooseCard(at index: Int) {
        
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexofOneAndOnlyFacUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                // either no cards or 2 cards are face up
                indexofOneAndOnlyFacUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            cards += [card, card]
        }
        
        //todo: shuffle the card
    }

}
