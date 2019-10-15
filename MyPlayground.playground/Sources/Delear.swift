import Foundation

public class Delear {
    
    var players: [Player]
    var dominoSet: DominoSet
    
    public func deal() {
        while dominoSet.count > 0 {
            for player in players {
                player.appendDomino(domino: dominoSet.deal())
            }
        }
    }
    
    public init(dominoSet: DominoSet, players: [Player]) {
        self.players = players
        self.dominoSet = dominoSet
    }
    
}
