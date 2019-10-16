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
