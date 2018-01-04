//: Playground - noun: a place where people can play

import UIKit

class Node{
    var value: Int?
    var next: Node?
    
    init(value: Int){
        self.value = value
    }
    
    static func getTestData() -> Node{ 
        let node25: Node = Node(value: 25)
        let node15: Node = Node(value: 15)
        let node14: Node = Node(value: 14)
        let node10: Node = Node(value: 10)
        let node9: Node = Node(value: 9)
        let node13: Node = Node(value: 13)
        let node7: Node = Node(value: 7)
        let node6: Node = Node(value: 6)
        let node5: Node = Node(value: 5)
        let node4: Node = Node(value: 4)
        let node3: Node = Node(value: 3)
        let node2: Node = Node(value: 2)
        let node: Node = Node(value: 1)
        
        node.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        node7.next = node13
        node13.next = node9
        node9.next = node10
        node10.next = node14
        node14.next = node15
        node15.next = node25
        
        return node
    }
}

class MyLinkedList {
    var head: Node?
    
    func getHead() -> Node? {
        return self.head
    }
}


class Test {
    
    var hashCodeList: Array<Int> = Array()
    
    func isCyclingNode(node: Node?) -> Bool{ // True ise sonsuz döngü
        if(node != nil){
            let nodeHashCode = ObjectIdentifier(node!).hashValue
            hashCodeList.append(nodeHashCode)
            if(node?.next != nil){
                let nodeNextHashCode = ObjectIdentifier((node?.next)!).hashValue
                if(nodeHashCode != nodeNextHashCode){
                    print("Node: \(nodeHashCode) - NodeNext: \(nodeNextHashCode)")
                    print("---------------------------------------------------------------")
                    if(!(hashCodeList.contains(nodeNextHashCode))){
                        return isCyclingNode(node:node?.next!)
                    } else {
                        print("Result --> Endless Loop - Return Hard")
                        return true
                    }
                } else {
                 print("Result -->Head is Same Node Next")
                    return true
                }
            } else {
                print("NEXT NODE IS NULL")
                return false
            }
        } else {
            print("HEAD IS NULL")
            return false
        }
    }
    
}

let test: Test = Test()
let myLinkedList: MyLinkedList = MyLinkedList()
myLinkedList.head = Node.getTestData()
let isCycling: Bool = test.isCyclingNode(node: myLinkedList.head)
if(isCycling){
    print("Endless Loop!!!")
} else {
    print("Good - No Error")
}
