import Foundation

class PrefixTreeNode<P: Hashable> {
    var value: P?
    weak var parent: PrefixTreeNode?
    var children: [P: PrefixTreeNode] = [:]
    var isTerminating = false
    
    init(value: P? = nil, parent: PrefixTreeNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: P) {
        guard children[child] == nil else { return }
        children[child] = PrefixTreeNode(value: child, parent: self)
    }
}
