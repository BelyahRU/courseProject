class AVLNode {
    
    var value: HotelRoom
    
    var leftChild: AVLNode?
    
    var rightChild: AVLNode?
    
    var height = 0
    
    init(value: HotelRoom) {
        self.value = value
    }
    
    var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    var leftHeight: Int {
        return leftChild?.height ?? -1
    }
    
    var rightHeight: Int {
        return rightChild?.height ?? -1
    }
    
    
    
    var min: AVLNode {
        leftChild?.min ?? self
    }
}
extension AVLNode: CustomStringConvertible {

    var description: String {
        return diagram(for: self)
    }
    
    func diagram(for node: AVLNode?,_ top: String = "",_ root: String = "",_ bottom: String = "") -> String {

        guard let node = node else {
            return root + "nil\n"
        }

        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value.number)\n"
        }
            //вызывается рекурсивно
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ") + root + "\(node.value.number)\n" + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")

        }

    }

// прямой обход авл-дерева
extension AVLNode {
    
    func positionInTree(_ number: String, _ currentValue: inout HotelRoom?) {
     
        if value.number == number {
            currentValue = value
        }
        
        leftChild?.positionInTree(number, &currentValue)
        rightChild?.positionInTree(number, &currentValue)
    }
    func positionInTreeByEquipment(_ equipment: String, _ array: inout [HotelRoom]) {
        let set1 = Set(equipment.components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) })

        let set2 = Set(value.equipment.components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) })
        if set1.isSubset(of: set2) {
            array.append(value)
        }
        leftChild?.positionInTreeByEquipment(equipment, &array)
        rightChild?.positionInTreeByEquipment(equipment, &array)
    }
    
}

