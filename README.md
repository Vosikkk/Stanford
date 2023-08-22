# Stanford__Concentration
## Concentration Game

### Description

This iOS application is a Concentration game, a classic card matching game. The app extends the functionality demonstrated in lectures 1 and 2. Here are the key features and design considerations:

### Features

1. **Concentration Game**: This application implements the Concentration card game, where the player matches pairs of cards.

2. **Additional Cards**: The game has been expanded to include more cards, increasing the challenge and fun.

3. **New Game Button**: A "New Game" button has been added to the user interface. This button allows the player to end the current game in progress and start a fresh game.

4. **Card Shuffling**: Cards are now shuffled in the Concentration's `init()` method, ensuring a randomized order. This prevents matching cards from always appearing in the same positions.

5. **Themes**: The game introduces the concept of themes. A theme defines the set of emojis used on the cards, and all emojis within a theme are related. There are at least 6 different themes available, and a random theme is chosen each time a new game starts.

6. **Theme Customization**: The architecture of the game allows for easy addition of new themes with just a single line of code. Themes can be expanded or modified without extensive code changes.

7. **Game Score**: A game score label is displayed in the UI. The game is scored by awarding 2 points for every match and penalizing 1 point for every previously seen card involved in a mismatch.

8. **MVC Architecture**: The architecture adheres to Model-View-Controller (MVC) principles. The flip count tracking, which previously resided in the Controller, has been moved to an appropriate location within the MVC architecture.

9. **UI Layout**: All additional UI elements have been thoughtfully laid out and are designed to look good in portrait mode on an iPhone X.

Enjoy playing Concentration and challenge your memory skills!

### Technologies Used

- Swift
- UIKit
- MVC Architecture
- Git

### Acknowledgments

This project builds upon the concepts and code discussed in lectures of Stanford CS193P and fulfills the specified requirements.
