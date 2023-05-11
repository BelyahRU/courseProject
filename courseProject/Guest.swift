struct Guest {
    var passportNumber: String // номер паспорта
    var fullName: String // ФИО
    var birthYear: Int // день рождения
    var address: String // адресс
    var purposeOfStay: String //цель визита
    
    func getAllInformation() {
        print("\nФИО постояльца - \(fullName)")
        print("Дата рождения - \(birthYear)")
        print("Адрес - \(address)")
        print("Номер паспорта - \(passportNumber)")
        print("Цель визита - \(purposeOfStay)")
    }
}
