import Foundation

public class Move {
    private let index: Int?
    private let headOrTail: Bool
    
    public func getIndex() -> Int? {
        return index
    }
    
    public func getHeadOrTail() -> Bool {
        return headOrTail
    }
    
    public init(index: Int?, headOrTail: Bool) {
        self.index = index
        self.headOrTail = headOrTail
    }
}

public class Player {
    
    var dominoes: [Domino]
    var played: [Domino]
    var name: String
    var six = 6
    
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
    
    public func dominoesIsEmpty() -> Bool {
        return dominoes.isEmpty
    }
    
    public func addPlay(board: Board) {
        if let nextMove = getNextMove(board: board) {
            if let index = nextMove.getIndex(){
                let domino = dominoes.remove(at: index)
                if nextMove.getHeadOrTail() {
                    board.prependHistory(domino: domino)
                } else {
                    board.appendHistory(domino: domino)
                }
            }
            
        }
      
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
            } else {
                return Move(index: tailOption, headOrTail: false)
            }
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
