// узел списка
class DNode {
    var value: CheckInOut? // значение
    
    var next: DNode? // следующий элемент
    
    var previous: DNode? // предыдущий элемент
    
    init(value: CheckInOut) { // инициализация значения
        self.value = value
    }
}

// линейный двунаправленный список
struct DLinkedList {
    var head: DNode? // голова списка
    
    var tail: DNode? // тело списка
    
    var isEmpty: Bool { // проверка на пустосту
        return head == nil
    }
    
    var first: DNode? {
        print(head?.value ?? "List is empty") // первый элемент списка
        return head
    }
    
    var last: DNode? { // последний элемент списка
        print(tail?.value ?? "List is empty")
        return tail
    }
    
    // метод, позволяющий вставить значение в начало списка
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
    
    // метод, позволяющий вставить элемент в конец списка
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
    
    // с помощью этого метода узел вставляется в заданное индексом место в списке
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
    
    // метод, с помощью которого значение вставляется в заданное место индексом в списке
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
    // метод, с помощью которого узел вставляется в заданное место индексом в списке
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
    
    // метод, с помощью которого удаляется узел, на заданном индексом месте в списке
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
    // метод, удаляющя узел, возвращает значение этого узла
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
    
    // метод, которыйудаляяет все элементы списка
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
    
    // метод, который возвращает количество элементов в списке
    public func getCountElements()->Int {
        var current = head
        var count = 1
        while current != nil {
            current = current?.next
            count += 1
        }
        return count - 1
    }
    // метод, который находит номер паспорта в списке и возвращает узел
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
    
    // метод, который находит массив паспортов людей, которые живут в комнате
    public func findPassport(room: HotelRoom) -> [String] {
        var current = head
        var array: [String] = []
        while current != nil {
            if current?.value?.number == room.number {
                array.append(current!.value!.passportId)
            }
            current = current?.next
        }
        return array
    }
    
    // метод, возвращающий количество людей в списке
    public func getCountGuests(room: HotelRoom) -> Int{
        var current = head
        var count = 0
        while current != nil {
            if current?.value?.number == room.number {
                count += 1
            }
            current = current?.next
        }
        return count 
    }
    
    
}
