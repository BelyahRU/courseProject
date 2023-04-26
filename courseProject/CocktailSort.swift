func cocktailSort(_ array: inout [Int]) {
    var beginIndex = 0
    var endIndex = array.count - 1
  
    while beginIndex < endIndex {
        var swapped = false
        
        // Проход с начала до конца
        for i in beginIndex..<endIndex {
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
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
            if array[i] > array[i + 1] {
                array.swapAt(i, i + 1)
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
