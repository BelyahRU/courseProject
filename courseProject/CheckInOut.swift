struct CheckInOut {
    var passportId: String // паспорт
    var number: String // room number , format - "ANNN"
    var checkInData: String // дата заезда
    var checkOutData: String // дата выезда
    
    init(passportId: String, number: String, checkInData: String, checkOutData: String) {
        self.passportId = passportId
        self.number = number
        self.checkInData = checkInData
        self.checkOutData = checkOutData
    }
}
