import Foundation

public class DominoSet {
    var dominoes: [Domino]
    
    /// The number of dominoes in the collection.
    public var count: Int {
        return dominoes.count
    }
    
    public static func standardSet(_ highestSuit: Int) -> DominoSet {
        var dominoes: [Domino] = []
        for suitValueOne in 0...highestSuit {
            for suitValueTwo in suitValueOne...highestSuit {
                dominoes.append(Domino(firstSuite: suitValueOne,
                                       secondSuite: suitValueTwo))
            }
        }
        dominoes.shuffle()
        return DominoSet(dominoes: dominoes)
    }
    
    public func shuffle() {
        dominoes.shuffle()
    }
    
    public func deal() -> Domino! {
        guard !dominoes.isEmpty else { return nil }
        return dominoes.removeLast()
    }
    
    public func print() {
        for domino in dominoes {
            Swift.print(domino)
        }
    }
    
    public init(dominoes: [Domino]) {
        self.dominoes = dominoes
    }
}
