//
//  ViewController.swift
//  Concentration
//
//  Created by Саша Восколович on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Lazy initialization of the game instance
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
     
   
    // Make our pairs of cards 
    private var numberOfPairsOfCards: Int {
       
        return cardButtons.count/2 
    }
    
    // Dictionary to store emojis for each card identifier
    private var emoji = [Card: String]()
   
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
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        // Set a random theme and update the view with the initial game state
        setRandomTheme()
        updateViewFromModel()
    }
    
    // Action to start a new game
    @IBAction private func beginNewGame(_ sender: UIButton) {
        game.resetGame()
        emoji.removeAll()
        setRandomTheme()
        updateViewFromModel()
    }
    
    // Action when a card button is tapped
    @IBAction private func touchCard(_ sender: UIButton) {
        // Find the index of the tapped card button and choose the corresponding card in the game
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            // Update the view with the current game state
            updateViewFromModel()
        }  
    }
    
    // Update the UI elements based on the current game state
   private func updateViewFromModel() {
        
        scoreLabel.text = "Score: \(game.score)"
        updateFlipCountLabel()
        
        
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
       assert(themes.count > 0, "ViewController.theme our storage of emojies is empty, please add some emojies")
       // Repeat until a different theme index is chosen
       repeat {
           randomThemeIndex = Int.random(in: 0..<themes.count)
       } while randomThemeIndex == currentThemeIndex
      
       // Update the current theme index and emoji choices array
       currentThemeIndex = randomThemeIndex
       emojiChoices = themes[currentThemeIndex].emoji
    }
    
    
    // Get the corresponding emoji for a card identifier, and store it in the dictionary for reuse
   private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            emoji[card] = emojiChoices.remove(at: Int.random(in: 0..<emojiChoices.count))
        }
        
        return emoji[card] ?? "?"
    }
    
    
    // Here we just change view of our flip label
    private func updateFlipCountLabel() {
        
        let attributedText = NSAttributedString(string: "Flips: \(game.flipCount)",
                                                 attributes: [
             .strokeWidth: 5.0,
             .strokeColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
         ])
        flipCountLabel.attributedText =  attributedText
    }
}


