class DNode {
    var value: CheckInOut?
    
    var next: DNode?
    
    var previous: DNode?
    
    init(value: CheckInOut) {
        self.value = value
    }
}

struct DLinkedList {
    var head: DNode?
    
    var tail: DNode?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: DNode? {
        print(head?.value ?? "List is empty")
        return head
    }
    
    var last: DNode? {
        print(tail?.value ?? "List is empty")
        return tail
    }
    
    public mutating func prepend(value: CheckInOut) {
        let newNode = DNode(value: value)
        
        if let headNode = head {
            newNode.next = headNode
            headNode.previous = newNode
            head = newNode
            
            var current = head
            while current != nil {
                if current?.next == nil {
                    tail = current
                    return
                }
                else {
                    current = current?.next
                }
            }
        }
        else {
            head = newNode
            tail = newNode
        }
    }
    
    public mutating func append(value: CheckInOut) {
        let newNode = DNode(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tailNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> DNode? {
        var node: DNode?
        var current = head
        
        for _ in 0..<index {
            current = current?.next
        }
        
        node = current
        
        if node == nil {
            print("Index out of bounds")
        }
        
        return node
    }
    
    public mutating func insert(value: CheckInOut, at index: Int) {
        let newNode = DNode(value: value)
        
        if index == 0, tail == nil {
            head = newNode
            tail = newNode
            return
        }
        
        guard let nodeAtIndex = nodeAt(index: index) else {
            print("Index out of bounds")
            return
        }
        
        let previousNode = nodeAtIndex.previous
        
        if previousNode == nil {
            head = newNode
        }
        
        previousNode?.next = newNode
        newNode.previous = previousNode
        
        newNode.next = nodeAtIndex
        nodeAtIndex.previous = newNode
    }
    
    public mutating func insert(node: DNode, at index: Int) {
        if index == 0, tail == nil {
            head = node
            tail = node
            return
        }
        guard let nodeAtIndex = nodeAt(index: index) else {
            print("Index out of bounds")
            return
        }
        
        let previousNode = nodeAtIndex.previous
        
        if previousNode == nil {
            head = node
        }
        previousNode?.next = node
        nodeAtIndex.previous = node
        
        node.previous = previousNode
        node.next = nodeAtIndex
    }
    
    public mutating func remove(at index: Int) {
        var nodeAtIndex = nodeAt(index: index)
        guard nodeAtIndex != nil else {
            print("Index out of bounds")
            return
        }
        
        let previousNode = nodeAtIndex?.previous
        let nextNode = nodeAtIndex?.next
        
        if previousNode == nil {
            head = nextNode
        }
        if nextNode == nil {
            tail = previousNode
        }
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        nodeAtIndex = nil
    }
    
    public mutating func remove(node: DNode) -> CheckInOut {
        let nextNode = node.next
        let previousNode = node.previous
        
        if previousNode == nil {
            head = nextNode
        }
        if nextNode == nil {
            tail = previousNode
        }
        
        nextNode?.previous = previousNode
        previousNode?.next = nextNode
        
        node.previous = nil
        node.next = nil
        
        return node.value!
    }
    
    public mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    public func printList() {
        if head == nil {
            print("No items in this list")
            print("")
            return
        }
        else {
            print("Items in this list:")
            var current = head
            var count = 1
            
            while current != nil {
                
                print("Item \(count): \((current?.value)!)")
                current = current?.next
                count += 1
            }
            
            print("")
        }
    }
    public func getCountElements()->Int {
        var current = head
        var count = 1
        while current != nil {
            current = current?.next
            count += 1
        }
        return count - 1
    }
    public func find(passportId: String) -> DNode? {
        var current = head
        
        while current != nil {
            if current?.value?.passportId == passportId {
                return current!
            }
            current = current?.next
            
        }
        return nil
    }
    
    
}
