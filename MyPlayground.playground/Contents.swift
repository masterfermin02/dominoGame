//: A UIKit based Playground for presenting user interface
import UIKit
import PlaygroundSupport

let highestSuit = 6
let players = [Player(name: "Juancho"), Player(name: "Cindy"), Player(name: "Ernesto"), Player(name: "Meneo")]
let delear = Delear(dominoSet: DominoSet.standardSet(highestSuit), players: players)
delear.deal()
/*for player in players {
    print("Rank: \(player.rank)")
}*/
//let game = Game(players: players)
//game.run()
