//
//  Concentration.swift
//  Concentration
//
//  Created by Саша Восколович on 28.07.2023.
//

import Foundation

class Concentration {
    // Array to store the cards in the game
    private(set) var cards = [Card]()
    
    // Player's score
    private(set) var score = 0
    
    // Number of flips made by the player
    private(set) var flipCount = 0
    
    // Computed property to find the index of the one and only face-up card (if any)
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let indexOfOpenCards = cards.indices.filter{ cards[$0].isFaceUp }
            return indexOfOpenCards.count == 1 ? indexOfOpenCards.first : nil
        }
        set {
            // Set all cards' faceUp status based on whether their index matches the new value
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // Initializer to create a new instance of the Concentration game
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at list one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // Shuffle the cards to randomize their order
        cards.shuffle()
    }
    
    
    
    
    // Method to handle card selection during the game
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        
        flipCount += 1
        
        // Check if the chosen card is not already matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                // Two cards are face-up, check if they match
                if cards[matchIndex].identifier == cards[index].identifier {
                    
                    // Cards match, mark them as matched and update the score
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    
                    // Cards don't match, deduct one point from the score if possible
                    if score > 0 {
                        score -= 1
                    }
                }
                
                // Flip the chosen card face-up
                cards[index].isFaceUp = true
                
            } else {
                // Either no cards or two cards are face-up, update the index of the face-up card
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // Method to reset the game state
    func resetGame() {
        // Reset the score and flip count
        score = 0
        flipCount = 0
        
        for index in cards.indices {
            if cards[index].isFaceUp {
                cards[index].isFaceUp = false
            }
            if cards[index].isMatched {
                cards[index].isMatched = false
            }
        }
    }
}
