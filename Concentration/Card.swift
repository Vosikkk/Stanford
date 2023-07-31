//
//  Card.swift
//  Concentration
//
//  Created by Саша Восколович on 28.07.2023.
//

import Foundation

struct Card: Hashable {
    
    // Boolean flag indicating if the card is face-up (visible to the player)
    var isFaceUp = false
    
    // Boolean flag indicating if the card is already matched with another card
    var isMatched = false
    
    // Unique identifier for the card
    private var identifier: Int
    
    // Static variable to keep track of the identifier generation
    private static var identifierFactory = 0
    
    // Initializer to create a new card instance with a unique identifier
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    // Static method to generate a unique identifier for a card
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
