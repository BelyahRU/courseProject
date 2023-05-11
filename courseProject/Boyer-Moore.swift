import Foundation
func search(equpmentRoom: String, equipment: String) -> Bool {
    let myArray = equipment.components(separatedBy: ", ")
    let p = equpmentRoom.replacingOccurrences(of: ",", with: " ")

    for i in 0..<myArray.count{
        if boyerMooreSearch(string: p, pattern: myArray[i]) == false {
            return false
        }
    }
    
    return true

}
func boyerMooreSearch(string: String, pattern: String) -> Bool {
    let strCount = string.count
    let patCount = pattern.count
    
    guard strCount >= patCount else {
        return false
    }
    
    // Создаем таблицу плохого совпадения для данного шаблона
    var badMatchTable = [Character: Int]()
    for (i, char) in pattern.enumerated() {
        badMatchTable[char] = max(1, patCount - i - 1)
    }
    
    // Находим вхождение шаблона в строку
    var strIndex = pattern.count - 1
    while strIndex < strCount {
        var patIndex = pattern.count - 1
        var matchIndex = strIndex
        
        // Проверяем, совпадает ли шаблон в текущей позиции
        while patIndex >= 0 && string[string.index(string.startIndex, offsetBy: matchIndex)] == pattern[pattern.index(pattern.startIndex, offsetBy: patIndex)] {
            patIndex -= 1
            matchIndex -= 1
        }
        
        // Если мы прошли весь шаблон, значит, мы нашли вхождение
        if patIndex < 0 {
            return true
        } else {
            // Иначе, пропускаем строку до следующей возможной позиции для сравнения
            let badMatch = badMatchTable[string[string.index(string.startIndex, offsetBy: matchIndex)]] ?? patCount
            strIndex += badMatch
        }
    }
    
    return false
}
