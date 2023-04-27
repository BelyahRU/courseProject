// функция получения паспорта, путем чтения строки
func getPassportNumber() -> String{
    print("Введите серию и номер паспорта через тире, например 1111-111111:")
    var id = String(readLine()!)
    while true {
        if isCorrectPassport(id) == true {
            break
        } else {
            print("Паспорт введен неверно, повторите ввод")
            id = String(readLine()!)
        }
    }
    return id
}
// функция, проверяющаю корректность введенных данных
func isCorrectPassport(_ passportNumber: String) -> Bool {
    let arr = Array(passportNumber)
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
