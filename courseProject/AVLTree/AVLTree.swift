import Foundation

class AVLTree {
    var root: AVLNode?
}
extension AVLTree {
    
    func insert(_ value: HotelRoom) {
        
        root = insert(from: root, value: value)
    }
    func insert(from node: AVLNode?, value: HotelRoom) -> AVLNode {
            guard let node = node else {
                return AVLNode(value: value)
            }

        if value.getCorrectNumber() < node.value.getCorrectNumber() {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
        
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
    func find(_ number: String) -> HotelRoom?{
        var currentValue:HotelRoom? = nil
        root?.positionInTree(number, &currentValue)
        return currentValue
    }
}
extension AVLTree {
    func deleteRoom(_ number: String){
        remove(find(number)!)
    }
}

extension AVLTree {
    func removeAll() {
        root = nil
    }
}
extension AVLTree {
    func searchByEquipment(_ equipment: String) -> [HotelRoom]{
        var array: [HotelRoom] = []
        root?.positionInTreeByEquipment(equipment, &array)
        return array
    }
}

extension AVLTree: CustomStringConvertible {
    var description: String {
        return root?.description ?? "empty tree"
    }
}

extension AVLTree {
    
    func leftRotate(_ node: AVLNode) -> AVLNode {
        let pivot = node.rightChild!
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    func rightRotate(_ node: AVLNode) -> AVLNode {
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    func rightLeftRotate(_ node: AVLNode) -> AVLNode {
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    func leftRightRotate(_ node: AVLNode) -> AVLNode {
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
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





