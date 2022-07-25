//
//  Card.swift
//  ConcentrationGame
//
//  Created by Mohit Katkar on 17/02/22.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched  = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
