struct Guest {
    var passportNumber: String
    var fullName: String
    var birthYear: Int
    var address: String
    var purposeOfStay: String //цель визита
    
    func getAllInformation() {
        print("\nФИО постояльца - \(fullName)")
        print("Дата рождения - \(birthYear)")
        print("Адрес - \(address)")
        print("Номер паспорта - \(passportNumber)")
        print("Цель визита - \(purposeOfStay)")
    }
}
