struct CheckInOut {
    var passportId: String
    var number: String // room number , format - "ANNN"
    var checkInData: String
    var checkOutData: String
    
    init(passportId: String, number: String, checkInData: String, checkOutData: String) {
        self.passportId = passportId
        self.number = number
        self.checkInData = checkInData
        self.checkOutData = checkOutData
    }
}
