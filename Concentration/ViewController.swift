//
//  ViewController.swift
//  Concentration
//
//  Created by Саша Восколович on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Lazy initialization of the game instance
    private lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count/2)
   
    // Dictionary to store emojis for each card identifier
    private var emoji = [Int: String]()
   
    // Index to keep track of the current theme
    private var currentThemeIndex = 0
   
    // Array to hold the emoji choices for the current theme
    private var emojiChoices: [String] = []
   
    // Array of themes, each with a name and emoji choices
    private let themes = [
        Theme(name: "fruit", emoji: ["🍎", "🍌", "🍇", "🍊", "🍓", "🍍", "🍑", "🍒", "🍉", "🥝"]),
        Theme(name: "animals", emoji: ["🐶", "🐱", "🐼", "🐸", "🐢", "🐯", "🦁", "🦊", "🦄", "🐧"]),
        Theme(name: "nature", emoji: ["🌳","🪴","🌹","☘️","🌿","🎄","🍀","🌾","🌺","🥀"]),
        Theme(name: "planets", emoji: ["🌞","🌝","🌛","🌜","🌚","🌎","🌘","🪐","🌙","🌖"]),
        Theme(name: "food", emoji: ["🍕","🥖","🥐","🍤","🍖","🍔","🧀","🥩","🍨","🍭"]),
        Theme(name: "drinks", emoji:  ["🥛","🍼","🥂","🍷","🍻","🍹","🍸","🍺","☕️","🧋","🥤"])
    ]

    // Outlets for UI elements
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        // Set a random theme and update the view with the initial game state
        setRandomTheme()
        updateViewFromModel()
    }
    
    // Action to start a new game
    @IBAction func beginNewGame(_ sender: UIButton) {
        game.resetGame()
        emoji.removeAll()
        setRandomTheme()
        updateViewFromModel()
    }
    
    // Action when a card button is tapped
    @IBAction func touchCard(_ sender: UIButton) {
        // Find the index of the tapped card button and choose the corresponding card in the game
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            // Update the view with the current game state
            updateViewFromModel()
        }  
    }
    
    // Update the UI elements based on the current game state
   private func updateViewFromModel() {
        
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        
       // Update each card button based on its corresponding card in the game
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    // Set a random theme for the game
   private func setRandomTheme() {
       var randomThemeIndex: Int
       
       // Repeat until a different theme index is chosen
       repeat {
           randomThemeIndex = getRandomIndex(for: themes.count)
       } while randomThemeIndex == currentThemeIndex
        
       // Update the current theme index and emoji choices array
       currentThemeIndex = randomThemeIndex
       emojiChoices = themes[currentThemeIndex].emoji
    }
    
    
    // Get the corresponding emoji for a card identifier, and store it in the dictionary for reuse
   private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = getRandomIndex(for: emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    // Generate a random index for an array of the given collectionCount
    private func getRandomIndex(for collectionCount: Int ) -> Int {
        return Int(arc4random_uniform(UInt32(collectionCount)))
    }
}

