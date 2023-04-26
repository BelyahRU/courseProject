func cocktailSort(_ linkedList: inout DLinkedList<CheckInOut>) {
    var beginIndex = 0
    var endIndex = linkedList.getCountElements() - 1

    while beginIndex < endIndex {
        var swapped = false

        // Проход с начала до конца
        for i in beginIndex..<endIndex {
            
            if linkedList.nodeAt(index: i)!.value!.getCorrectNumber() > linkedList.nodeAt(index: i+1)!.value!.getCorrectNumber(){
                
                var a = linkedList.nodeAt(index: i)!.value!
                if i == linkedList.getCountElements() - 2 {
                    
                    linkedList.remove(node: linkedList.nodeAt(index: i)!)
                    linkedList.append(value: a)
                    
                } else {
                    linkedList.remove(node: linkedList.nodeAt(index: i)!)
                    
                    linkedList.insert(value: a, at: i+1)
                }

                swapped = true
            }
            
            
        }

        // Если не было смены элементов - массив отсортирован
        if !swapped {
            break
        }
        endIndex -= 1

        // Проход с конца до начала
        for i in stride(from: endIndex - 1, to: beginIndex - 1, by: -1) {
            if linkedList.nodeAt(index: i)!.value!.getCorrectNumber() > linkedList.nodeAt(index: i+1)!.value!.getCorrectNumber() {

                var a = linkedList.nodeAt(index: i)!
                linkedList.remove(node: linkedList.nodeAt(index: i)!)
                linkedList.insert(node: a, at: i + 1)
                swapped = true
            }
        }

        beginIndex += 1

        // Если не было смены элементов - массив отсортирован
        if !swapped {
            break
        }
    }
}
