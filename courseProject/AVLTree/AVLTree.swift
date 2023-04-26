

// АВЛ-дерево — сбалансированное по высоте двоичное дерево поиска: для каждой его вершины высота её двух поддеревьев различается не более чем на 1.





import Foundation

class AVLTree {
    var root: AVLNode? // экземпляр класса
}
extension AVLTree {
    
    func insert(_ value: HotelRoom) {
        root = insert(from: root, value: value)
    }
    func insert(from node: AVLNode?, value: HotelRoom) -> AVLNode {
            guard let node = node else { //проверяем наличие значения в узле
                return AVLNode(value: value)
            }

            // сверяем значение узла со сзначением
        if value.getCorrectNumber() < node.value.getCorrectNumber() {
                //вызываем рекурсивно для левого
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
            root = remove(node: root, value: value)
    }
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
    //  Процедуру балансировки выполняют на узле, содержащем недопустимый коэффициент балансировки
    
    /* Левый поворот. Дисбаланс можно устранить с помощью левого вращения. Общее левое вращение узла x выглядит так: Прежде чем перейти к конкретике, есть два вывода из этого до и после сравнения:
        - Порядок обхода для этих узлов остается прежним.
        - Глубина дереваэто (глибина - это самое длинное расстояние от текущего узла до конечного узла) уменьшается на 1 уровень после поворота. */
    
    func leftRotate(_ node: AVLNode) -> AVLNode {
        
        //Вот шаги, необходимые для выполнения левого поворота:
        // 1
        // Правый ребенок выбран в качестве стержня(pivot). Этот узел заменит повернутый узел (по примеру, повернутый узел это Х) как корень поддерева (он будет перемещаться на уровень выше).
        let pivot = node.rightChild!
        
        // 2
        /*Вращающийся узел станет левым потомком стержня(pivot) (он перемещается вниз на уровень ниже). Это означает, что текущий левый потомок стержня должен быть перемещен в другое место.
         В общем примере, показанном на предыдущем изображении, это узел b. Поскольку b меньше y, но больше x, он может заменить y как правого потомка x. Таким образом, вы обновляете повернутый узел rightChild до pivot leftChild. */
        node.rightChild = pivot.leftChild
        
        // 3
        // Левый ребенок стержня(pivot) теперь может быть установлена ​​на повернутый узел.
        pivot.leftChild = node
        
        // 4
        // Обновляем высоты повернутого узла и оси вращения.
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        // 5
        // Наконец, возвращаем стержень, чтобы он мог заменить повернутый узел в дереве.
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
        
        //Есть три случая для рассмотрения.
        switch node.balanceFactor {
        
            //    1. Баланс-фактор 2 (case 2:) предполагает, что левый ребенок «тяжелее» (то есть содержит больше узлов), чем правый ребенок. Это означает, что вы хотите использовать правое или вращение влево - вправо.
            case 2:
                if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                    return leftRightRotate(node)
                } else {
                    return rightRotate(node)
                }
            
            //    2. Баланс фактора -2 (case -2:) предполагает, что правый ребенок тяжелее левого. Это означает, что вы хотите использовать левое или вращение вправо - влево.
            case -2:
                if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                    return rightLeftRotate(node)
                } else {
                    return leftRotate(node)
                }
            
            //    3. Случай по умолчанию предполагает, что конкретный узел сбалансирован. Здесь ничего не нужно делать, кроме как вернуть узел.
            default:
                return node
            }
        
    }
}

//extension AVLTree {
//    func find(_ value: Int) {
//        var position = 0
//        var flag = 0
//        root?.positionInTree(position: &position, value, &flag)
//        if flag == 0{
//            print("Данное число не найдено")
//        }
//    }
//}
//
//extension AVLTree {
//    func getArray() -> [Int]{
//        var array: [Int] = []
//        root?.ListPls(array: &array)
//        return array
//    }
//
//}
//
//extension AVLTree {
//    func getSrArifm() {
//        var sum = 0
//        var count = 0
//        root?.SumAndCountElem(sum: &sum, count: &count)
//        root?.substrackNum(num: sum / count)
//        return
//
//    }
//}
extension AVLTree: CustomStringConvertible {
    var description: String {
        return root?.description ?? "empty tree"
    }
}
//
//extension AVLTree {
//    func removeMod3Elems() {
//        var array: [Int] = []
//        root?.ListMod3Elements(mod3Array: &array)
//        if array == [] {
//            print("Нет чисел, делящихся без остатка на 3")
//            return
//        }
//        for i in 0...array.count-1 {
//            remove(array[i])
//        }
//        return
//    }
//}







