import Foundation

public class Player {
    
    var dominoes: [Domino]
    var played: [Domino]
    var name: String
    var six = 6
    
    /// The sum of the two suited ends, also called weight.
    public var rank: Int {
        return dominoes.reduce(0, { score, domino in
            score + domino.rank
        })
    }
    
    public func appendDomino(domino: Domino) {
        dominoes.append(domino);
    }
    
    public func hasMatchingDomino( domino: Domino) -> Bool {
        return dominoes.contains { element in
            return element.hasMatchingSuit(domino.firstSuite) && element.hasMatchingSuit(domino.secondSuite)
        }
    }
    
    public func print() {
        Swift.print("\(toString()) Total dominoes: \(dominoes.count)")
    }
    
    public func toString() -> String {
        var str = "Player : \(self.name) \n "
        for domino in self.dominoes {
            str = str + domino.toString() + " \n "
        }
        return str;
    }
    
    public func hasDoubleSix() -> Bool {
        return dominoes.contains { domino in
            return domino.hasMatchingDouble(six)
        }
    }
    
    public func getDoubleSix() -> Domino? {
        
        if let index = dominoes.firstIndex(where: { domino in
            domino.hasMatchingDouble(six)
        }) {
            return dominoes.remove(at: index)
        }
        return nil
    }
    
    public func getFirst() -> Domino? {
        return dominoes.removeFirst()
    }
    
    public func dominoesIsEmpty() -> Bool {
        return dominoes.isEmpty
    }
    
    public func addPlay(board: Board) -> Bool {
        if let nextMove = getNextMove(board: board) {
            if let index = nextMove.getIndex() {
                let domino = dominoes.remove(at: index)
                if nextMove.getHeadOrTail() {
                    board.prependHistory(domino: domino)
                    return true
                }
                board.appendHistory(domino: domino)
                return true
            }
        }
        return false
    }
    
    public func getNextMove(board: Board) -> Move? {
        let head = board.getHead()
        let tail = board.getTail()
        let headOption: Int? = dominoes.firstIndex(where: { domino in
            domino.hasMatchingSuit(head?.firstSuite)
        })
        let tailOption: Int? = dominoes.firstIndex(where: { domino in
            domino.hasMatchingSuit(tail?.secondSuite)
        })
        
        if headOption != nil && tailOption != nil {
            if Bool.random() {
                return Move(index: headOption, headOrTail: true)
            }
            
            return Move(index: tailOption, headOrTail: false)
        }
        
        if headOption != nil {
            return Move(index: headOption, headOrTail: true)
        }
        
        if tailOption != nil {
            return Move(index: tailOption, headOrTail: false)
        }
        
        return nil
    }
    
    
    public init(name: String, dominoes: [Domino])
    {
        self.dominoes = dominoes
        self.played = [Domino]()
        self.name = name
    }
    
    public init(name: String)
    {
        self.dominoes = []
        self.played = [Domino]()
        self.name = name
    }
    
}
