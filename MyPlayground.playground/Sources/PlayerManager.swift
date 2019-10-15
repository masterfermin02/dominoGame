import Foundation

public class PlayerManager {
    
    public static func getFirstPlayer(players: [Player]) -> Player? {
        return players.first(where: { player in
            player.hasDoubleSix()
        })
    }
    
    public static func getFirstPlayerIndex(players: [Player]) -> Int? {
       return players.firstIndex(where: { player in
            player.hasDoubleSix()
        })
    }
}
