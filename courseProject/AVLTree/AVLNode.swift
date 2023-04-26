//    Традиционно, узлы АВЛ-дерева хранят не высоту, а разницу высот правого и левого поддеревьев (так называемый balance factor)
class AVLNode {
    
    var value: HotelRoom
    
    var leftChild: AVLNode?
    
    var rightChild: AVLNode?
    
    var height = 0
    // Измерение баланса. Чтобы сохранить бинарное дерево сбалансированным, вам понадобится способ измерить баланс дерева. Дерево AVL достигает этого с помощью свойства height в каждом узле. В древовидной структуре высота узла - это самое длинное расстояние от текущего узла до конечного узла
    
    // разница между высотами, принимает только 3 значения -1, 0 и 1, если это не так, то дерево не сбаллансированно
    var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    // расстояние слева
    var leftHeight: Int {
        return leftChild?.height ?? -1 // если leftChild?.height == nil, то значение -1
    }
    
    // расстояние справа
    var rightHeight: Int {
        return rightChild?.height ?? -1
    }
    
    // инициализация ячейки в узел
    init(value: HotelRoom) {
        self.value = value
    }
    
    
    var min: AVLNode {
        leftChild?.min ?? self // самое левое значение(минимальное), функция вызывается рекурсивно
    }
}
extension AVLNode: CustomStringConvertible {

    //свойство, которое записывает приколы в строку
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


extension AVLNode {
    
    // симметричный порядок обхода(слева, голова, справа)
    func traversePreOrder() {
        
        print(value)
        leftChild?.traversePreOrder()
        rightChild?.traversePreOrder()
    }
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
    
    
//    func SumAndCountElem(sum: inout Int, count: inout Int) {
//        leftChild?.SumAndCountElem(sum: &sum, count: &count)
//        sum += value
//        count += 1
//        //array.append(value)
//        rightChild?.SumAndCountElem(sum: &sum, count: &count)
//    }
//
//    func substrackNum(num: Int) {
//        leftChild?.substrackNum(num: num)
//        self.value -= num
//        rightChild?.substrackNum(num: num)
//    }
//
//    func positionInTree(position: inout Int, _ number: Int,_ flag: inout Int) {
//        leftChild?.positionInTree(position: &position, number, &flag)
//        if flag != 1111 {
//            position += 1
//        }
//        if value == number {
//            print("\(position) - количество шагов, которое потребовалось, чтобы найти \(number)")
//            flag = 1111
//            return
//        }
//        rightChild?.positionInTree(position: &position, number, &flag)
//    }
//
//    func ListPls(array: inout [Int]){
//        leftChild?.ListPls(array: &array)
//        array.append(value)
//        rightChild?.ListPls(array: &array)
//    }
//
//    func ListMod3Elements(mod3Array: inout [Int]) {
//        leftChild?.ListMod3Elements(mod3Array: &mod3Array)
//        if value % 3 == 0 {
//            mod3Array.append(value)
//        }
//        rightChild?.ListMod3Elements(mod3Array: &mod3Array)
//    }
    
}

