import Foundation

public class Game {
    
    var firstTurn = true
    var turn: Player
    var turnIndex: Int
    var players: [Player]
    var blocked = false
    var turnPass = 0
    let board: Board
    var score = [0,0]
    let pairOne = 0
    let PairTwo = 1
    let maximumScore = 200
    
    public func run() {
        while !gameOver() {
            while !roundOver() {
                nextTurn()
                addPlay()
                printBoard()
                sleep(1)
            }
            updateScore(winnerIndex: getRounWinner())
            printRound()
        }
        printWinner()
    }
    
    public func updateScore(winnerIndex: Int) {
        if isEven(winnerIndex: winnerIndex) {
            score[pairOne] = score[pairOne] + players[0].rank + players[2].rank
        } else {
            score[PairTwo] = score[PairTwo] + players[1].rank + players[3].rank
        }
    }
    
    public func getRounWinner() -> Int {
        if !isBlock() {
            return turnIndex
        }
        
        if players[turnIndex].rank < players[generateNextIndex()].rank  {
            return turnIndex
        }
        nextTurn()
        return turnIndex
    }
    
    public func isEven(winnerIndex: Int) -> Bool {
        return winnerIndex % 2 == 0
    }
    
    public func printRound() {
        
    }
    
    public func printWinner() {
        
    }
    
    public func roundOver() -> Bool {
        return turn.dominoesIsEmpty() || isBlock()
    }
    
    public func gameOver() -> Bool {
        return score[pairOne] >= maximumScore || score[PairTwo] >= maximumScore
    }
    
    public func nextTurn() {
        turnIndex = generateNextIndex()
        turn = players[turnIndex]
    }
    
    public func generateNextIndex() -> Int {
        return (turnIndex + 1) % players.count
    }
    
    
    public func addPlay() {
        if !turn.addPlay(board: board) {
            turnPass = turnPass + 1
        } else {
            if turnPass > 0 {
                turnPass = 0
            }
        }
    }
    
    public func printBoard()
    {
        Swift.print("turn: \(turnIndex)")
        board.print()
    }
    
    public func getTurn () -> Player {
        return self.turn
    }
    
    public func isBlock() -> Bool {
        return turnPass == players.count
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
