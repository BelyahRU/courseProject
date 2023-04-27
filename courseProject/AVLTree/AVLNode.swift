// узел авл-дерева
class AVLNode {
    
    var value: HotelRoom // значение, находящееся в узле АВЛ-дерева
    
    var leftChild: AVLNode? // левая ветка
    
    var rightChild: AVLNode? // правая ветка
    
    var height = 0 // высота дерева
    
    // инициализатор
    init(value: HotelRoom) {
        self.value = value
    }
    
    // свойство, возвращающее разницу между ветвями АВЛ-дерева
    var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    // высота левой ветки
    var leftHeight: Int {
        return leftChild?.height ?? -1
    }
    
    // высота правой ветки
    var rightHeight: Int {
        return rightChild?.height ?? -1
    }
    
    
    
}
extension AVLNode: CustomStringConvertible {
    
    // свойство, вызывающее распечатывание дерева
    var description: String {
        return diagram(for: self)
    }
    
    // метод, возвращающий распечатанной дерево
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
    
    // посиция в значения в АВЛ дереве
    func positionInTree(_ number: String, _ currentValue: inout HotelRoom?) {
     
        if value.number == number {
            currentValue = value
        }
        
        leftChild?.positionInTree(number, &currentValue)
        rightChild?.positionInTree(number, &currentValue)
    }
    
    // Алгоритм Боуера...
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

