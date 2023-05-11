import Foundation
// АВЛ-дерево — сбалансированное по высоте двоичное дерево поиска: для каждой его вершины высота её двух поддеревьев различается не более чем на 1.
class AVLTree {
    var root: AVLNode? // экземпляр класса
    var allNumbers: [String] = []
}
extension AVLTree {
    
    func insert(_ value: HotelRoom) {
        allNumbers.append(value.number)
        root = insert(from: root, value: value)
    }
    // метод, вставляющий элемент в дерево
    func insert(from node: AVLNode?, value: HotelRoom) -> AVLNode {
        guard let node = node else { //проверяем наличие значения в узле
            return AVLNode(value: value)
        }
        // сверяем значение узла со сзначением
        if value.getCorrectNumber() < node.value.getCorrectNumber() {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
        // баллансируем
            let balancedNode = balanced(node)
            balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
            return balancedNode
    }
}


extension AVLTree {
    
    public func remove(_ value: HotelRoom) {
        allNumbers.remove(at: allNumbers.firstIndex(of: value.number)!)
        root = remove(node: root, value: value)
    }
    // метод, удалющий элемент из дерева
    private func remove(node: AVLNode?, value: HotelRoom) -> AVLNode? {
            guard let node = node else {
                return nil
            }
        if value.getCorrectNumber() == node.value.getCorrectNumber() {
                if node.leftChild == nil && node.rightChild == nil {
                    return nil
                }
                if node.leftChild == nil {
                    return node.rightChild
                }
                if node.rightChild == nil {
                    return node.leftChild
                }
                node.value = node.rightChild!.min.value
                node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value.getCorrectNumber() < node.value.getCorrectNumber() {
                node.leftChild = remove(node: node.leftChild, value: value)
            } else {
                node.rightChild = remove(node: node.rightChild, value: value)
            }
            let balancedNode = balanced(node)
            balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
            return balancedNode
        }
}


extension AVLTree {
    // метод поиска номера комнаты в дереве
    func find(_ number: String) -> HotelRoom?{
        var currentValue:HotelRoom? = nil
        root?.positionInTree(number, &currentValue)
        return currentValue
    }
}
extension AVLTree {
    // метод удаление комнаты в дереве
    func deleteRoom(_ number: String){
        remove(find(number)!)
    }
}

extension AVLTree {
    // метод удаления всех элементов дерва
    func removeAll() {
        allNumbers = []
        root = nil
    }
}
extension AVLTree {
    // метод поиска по "Оборудованию"
    func searchByEquipment(_ equipment: String) -> [HotelRoom]{
        //подходящие комнаты
        var array: [HotelRoom] = []
        root?.positionInTreeByEquipment(equipment, &array)
        return array
    }
}

extension AVLTree: CustomStringConvertible {
    // свойство возвращающее распечатанное авл-дерево
    var description: String {
        return root?.description ?? "empty tree"
    }
}

extension AVLTree {
    //  Процедуру балансировки выполняют на узле, содержащем недопустимый коэффициент балансировки
    
    /* Левый поворот. Дисбаланс можно устранить с помощью левого вращения. Общее левое вращение узла x выглядит так: Прежде чем перейти к конкретике, есть два вывода из этого до и после сравнения:
        - Порядок обхода для этих узлов остается прежним.
        - Глубина дереваэто (глибина - это самое длинное расстояние от текущего узла до конечного узла) уменьшается на 1 уровень после поворота. */
    func leftRotate(_ node: AVLNode) -> AVLNode {
        let pivot = node.rightChild!
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    //    Правое вращение. Правое вращение является симметричной противоположностью левого вращения. Когда ряд левых детей вызывает дисбаланс, пора повернуть вправо. Общее правое вращение узла x выглядит следующим образом:
    func rightRotate(_ node: AVLNode) -> AVLNode {
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    //    Вращение вправо-влево
    //    Возможно заметить что левый и правый повороты уравновешивают узлы, которые являются левыми или правыми дочерними узлами. Способ заключается в том, чтобы выполнить правое вращение правого дочернего элемента перед выполнением левого вращения.
    func rightLeftRotate(_ node: AVLNode) -> AVLNode {
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    //    Вращение влево-вправо.
    //    Вращение влево-вправо является симметричной противоположностью вращения вправо-влево.
    func leftRightRotate(_ node: AVLNode) -> AVLNode {
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    //Вот и все для вращения.
    //Далее выясним, когда применять эти повороты в правильном месте
    
    //Следующая задача - разработать метод, который использует balanceFactor, чтобы решить, требуется ли балансировка для узла. Знак balanceFactor может использоваться для определения необходимости одного или двойного вращения:
    
//    balanced(_ node: AVLNode<Element>) проверяет баланс-фактор, чтобы определить правильный курс действий. Все, что осталось - это призвать балансировку в нужном месте.
    func balanced(_ node: AVLNode) -> AVLNode {
        
        
        switch node.balanceFactor {
        
            case 2:
                if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                    return leftRightRotate(node)
                } else {
                    return rightRotate(node)
                }
            
            case -2:
                if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                    return rightLeftRotate(node)
                } else {
                    return leftRotate(node)
                }
            
            default:
                return node
            }
        
    }
}





