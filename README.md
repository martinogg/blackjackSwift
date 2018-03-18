# blackjackSwift
coding test to implement Blackjack on iOS using Swift

This project uses MVVM, TDD (mostly!), State Pattern, SOLID design priciples

Graphics are done using UIKit only

Travis CI status: [![Build Status](https://travis-ci.org/martinogg/blackjackSwift.svg?branch=master)](https://travis-ci.org/martinogg/blackjackSwift)

![alt text](https://github.com/martinogg/blackjackSwift/blob/master/20180318-1.gif "Logo Title Text 1")

# General class descriptions

The structure of the app takes the general form MVVM with the core classes.

ViewController: BlackjackViewController (Designed to take care of the UI aspects)

ViewModel: BlackjackViewModel (The business logic)

Router: BlackjackRouter (The "wireframe" that creates and attaches the classes to each other)


The BlackjackViewController has a storyboard (main) that contains 2 instances of a custom UI element called UIPlayerView, which represents the View of the Dealer and the User.

Each of these elements are used as Views in sub-MVVM patterns, to which ViewModels DealerViewModel and UserViewModel are attached respectively. These models are owned by their Views created as part of the UIPlayerView elements in the storyboard. The router is responsible for creating and attaching auxillary classes to the ViewController and Views

UserViewModel and DealerViewModel are subclassed from PlayerViewModel.

PlayerViewModel contains the score get variable that calculates the score of the hand.


# BlackjackViewModel and GameState

The business logic is held in a state Pattern inside BlackjackViewModel.
There are 4 game states in this game, all based on GamestateProtocol protocol, that have access to the main BlackjackViewModel for centralised resources such as the Deck of Cards

NewPlayGamestate
UserPlayGamestate
DealerPlayGamestate
EndPlayGamestate

Each game state has a nextGameState, which points to the next gameState in sequence.
On exiting one gameState, willLeaveState() of the current state is called before switching to the next state and calling its onEnterState()
The EndPlayGamestate's next gameState is NewPlayGamestate, therefore after the game has finished, a new game will start again and loop



