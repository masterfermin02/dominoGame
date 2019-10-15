import Foundation

public class Board {
    
    var boardHistory: [Domino]
    
    public func appendHistory(domino: Domino) {
        if domino.matchSecondSuit(boardHistory.last?.secondSuite) {
            domino.switchSuit()
        }
       boardHistory.append(domino)
    }
    
    public func prependHistory(domino: Domino) {
        if domino.matchFirstSuit(boardHistory.first?.firstSuite) {
            domino.switchSuit()
        }
        boardHistory.insert(domino, at: 0)
    }
    
    public func addPlay(player: Player){
        
    }
    
    public func getHead() -> Domino? {
        return boardHistory.first
    }
    
    public func getTail() -> Domino? {
        return boardHistory.last
    }
    
    public func print()
    {
        for domino in boardHistory {
            Swift.print(domino)
        }
    }
    
    public init() {
        boardHistory = []
    }
    
}

extension Board: CustomStringConvertible {
    /// Textual representation of a domino.
    public var description: String {
        return boardHistory.reduce("") { str, domino in
            str + domino.toString()
        }
    }
}
