func checkPassportInData() -> String {
    var passportNumber = getPassportNumber()
    while true {
        if hotel.search(passportNumber) != nil {
            print("Пользователь уже есть в базе данных")
            passportNumber = getPassportNumber()
        } else {
            break
        }
    }
    return passportNumber
}
