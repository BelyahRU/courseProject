func isCorrectPassport(_ passportNumber: String) -> Bool {
    var arr = Array(passportNumber)
    var flag = true
    if arr.count == 11 {
        for i in 0...10 {
            if flag == false {
                break
            }
            if i >= 0 && i <= 3 && arr[i].isNumber {
                flag = true
            } else if i == 4 && arr[i] == "-" {
                flag = true
            } else if i > 4 && i <= 10 && arr[i].isNumber {
                flag = true
            } else {
                flag = false
            }
        }
    } else {
        flag = false
    }
    return flag
}

func isCorrectRoomNumber(_ number: String) -> Bool{
    var arr = Array(number)
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
