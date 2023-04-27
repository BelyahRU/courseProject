func getRoomNumber() -> String {
    print("Укажите номер в формате ANNN , где ")
    print("A - буква, обозначающая тип номера(L – люкс, P – полулюкс, O – одно- местный, M – многоместный)")
    print("NNN - порядковый номер")
    var number = String(readLine()!)
    
    while true {
        if isCorrectRoomNumber(number) {
            break
        } else {
            print("Некорректно, повторите ввод: ")
            number = String(readLine()!)
        }
    }
    return number
}

func isCorrectRoomNumber(_ number: String) -> Bool{
    let arr = Array(number)
    var flag = true
    if arr.count == 4 {
        if arr[0] == "L" || arr[0] == "P" || arr[0] == "O" || arr[0] == "M" {
            if arr[1].isNumber {
                if arr[2].isNumber {
                    if arr[3].isNumber {
                        flag = true
                    } else {
                        flag = false
                    }
                } else {
                    flag = false
                }
            } else {
                flag = false
            }
        } else {
            flag = false
        }
    } else {
        flag = false
    }
    return flag
}
