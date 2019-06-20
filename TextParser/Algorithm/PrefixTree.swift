import Foundation

class PrefixTree {
    typealias Node = PrefixTreeNode<Character>
    fileprivate let root: Node
    init() {
        root = Node()
    }
}

extension PrefixTree {
    
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count {

            let character = characters[currentIndex]
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
            
            if currentIndex == characters.count {
                currentNode.isTerminating = true
            }
        }
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return true
        } else {
            return false
        }
    }
    
}
