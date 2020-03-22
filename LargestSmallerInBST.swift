import UIKit

class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func findLargetSmaller(_ root: Node?, num: Int) -> Int {
    return findLargestSmallerHelper(root, largestSmaller: -1, num: num)
}

func findLargestSmallerHelper(_ root: Node?, largestSmaller: Int, num: Int) -> Int {
    var largestSmaller = largestSmaller
    guard let root = root else { return largestSmaller }
    
    if root.value < num {
        largestSmaller = root.value
        return findLargestSmallerHelper(root.right, largestSmaller: largestSmaller, num: num)
    } else {
        return findLargestSmallerHelper(root.left, largestSmaller: largestSmaller, num: num)
    }
}

let root = Node(value: 20)
root.left = Node(value: 9)
root.right = Node(value: 25)
root.left?.left = Node(value: 5)
root.left?.left?.left = Node(value: 4)
root.left?.right = Node(value: 12)
root.left?.right?.left = Node(value: 11)
root.left?.right?.right = Node(value: 14)
findLargetSmaller(root, num: 6)
