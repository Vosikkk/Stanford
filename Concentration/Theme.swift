//
//  Theme.swift
//  Concentration
//
//  Created by Саша Восколович on 28.07.2023.
//

import Foundation

struct Theme {
    // The name of the theme
    let name: String
    
    // An array of emojis corresponding to the theme
    let emoji: [String]
    
    // Our available tmemes
    static private let themes = [ Theme(name: "fruit", emoji: ["🍎", "🍌", "🍇", "🍊", "🍓", "🍍", "🍑", "🍒", "🍉", "🥝"]),
                                  Theme(name: "animals", emoji: ["🐶", "🐱", "🐼", "🐸", "🐢", "🐯", "🦁", "🦊", "🦄", "🐧"]),
                                  Theme(name: "nature", emoji: ["🌳","🪴","🌹","☘️","🌿","🎄","🍀","🌾","🌺","🥀"]),
                                  Theme(name: "planets", emoji: ["🌞","🌝","🌛","🌜","🌚","🌎","🌘","🪐","🌙","🌖"]),
                                  Theme(name: "food", emoji: ["🍕","🥖","🥐","🍤","🍖","🍔","🧀","🥩","🍨","🍭"]),
                                  Theme(name: "drinks", emoji:  ["🥛","🍼","🥂","🍷","🍻","🍹","🍸","🍺","☕️","🧋","🥤"])
    ]
    
    
    //Here we received how many themes do we have
    static func getAmountOfThemes() -> Int {
        return themes.count
    }
    
    // Oy give me some emoji
    static func get(by themeIndex: Int) -> [String] {
        return themes[themeIndex].emoji
    }
    
}
