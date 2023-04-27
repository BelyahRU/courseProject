import Foundation
struct CheckInOut {
    var passportId: String // паспорт
    var number: String // room number , format - "ANNN"
    var checkInData: String // дата заезда
    var checkOutData: String // дата выезда
    
    //инициализатор
    init(passportId: String, number: String, checkInData: String, checkOutData: String) {
        self.passportId = passportId
        self.number = number
        self.checkInData = checkInData
        self.checkOutData = checkOutData
    }
    // метод, возвращающий номер "номерав" в целочисленном формате
    func getCorrectNumber() -> Int {
        let currentNum = Int(number.trimmingCharacters(in: CharacterSet.letters))!
        return currentNum
    }
}
