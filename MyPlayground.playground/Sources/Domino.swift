import Foundation


public class Domino {
    
    var firstSuite: Int
    var secondSuite: Int
    
    /// The sum of the two suited ends, also called weight.
    public var rank: Int {
        return firstSuite + secondSuite
    }
    
    public func toString() -> String {
        return "[\(firstSuite)|\(secondSuite)]"
    }
    
    public func hasMatchingSuit(_ suit: Int?) -> Bool {
        return firstSuite == suit || secondSuite == suit
    }
    
    public func matchFirstSuit(_ suit: Int?) -> Bool {
        return firstSuite == suit
    }
    
    public func matchSecondSuit(_ suit: Int?) -> Bool {
        return secondSuite == suit
    }
    
    public func hasMatchingDouble(_ suit: Int) -> Bool {
        return firstSuite == suit && secondSuite == suit
    }
    
    public func switchSuit() {
        let temp = firstSuite
        firstSuite = secondSuite
        secondSuite = temp
    }
    
    public init(firstSuite: Int, secondSuite: Int){
        self.firstSuite = firstSuite
        self.secondSuite = secondSuite
    }
    
}

extension Domino: CustomStringConvertible {
    /// Textual representation of a domino.
    public var description: String {
        return "[\(firstSuite)|\(secondSuite)]"
    }
}
