import Foundation

public class Game {
    
    var firstTurn = true
    var turn: Player
    var turnIndex: Int
    var players: [Player]
    var blocked = false
    var turnPass = 0
    let board: Board
    
    public func run() {
        while notGameOver() {
            while notRoundOver() {
                nextTurn()
                addPlay()
                printBoard()
                sleep(1)
            }
        }
    }
    
    public func notRoundOver() -> Bool {
        return turn.dominoesIsNotEmpty() || isNotBlock()
    }
    
    public func notGameOver() -> Bool {
        return true
    }
    
    public func nextTurn() {
        turnIndex = (turnIndex + 1) % players.count
        turn = players[turnIndex]
    }
    
    
    public func addPlay() {
        turn.addPlay(board: board)
    }
    
    public func printBoard()
    {
        Swift.print("turn: \(turnIndex)")
        board.print()
    }
    
    public func getTurn () -> Player {
        return self.turn
    }
    
    public func isNotBlock() -> Bool {
        return !isBlock()
    }
    
    public func isBlock() -> Bool {
        return blocked
    }
    
    public init(players: [Player]) {
        self.players = players
        board = Board()
        if let index = PlayerManager.getFirstPlayerIndex(players: players) {
            self.turnIndex = index
            self.turn = self.players[turnIndex];
            if let doubleSix = turn.getDoubleSix() {
                board.appendHistory(domino: doubleSix)
            }
        } else {
            turnIndex = 0
            turn = Player(name: "")
        }
    }
    
}