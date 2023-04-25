struct HotelRoom{
    var number: String // номер номера, формата ANNN
    var numberOfSeats: String // количество мест
    var numberOfRooms: String // количество комнат
    var presenceOfABathroom: Bool // наличие санузла
    var equipment: String // Оборудование в комнате
    init(number: String, numberOfSeats: String, numberOfRooms: String, presenceOfABathroom: Bool, equipment: String) {
        self.number = number
        self.numberOfSeats = numberOfSeats
        self.numberOfRooms = numberOfRooms
        self.presenceOfABathroom = presenceOfABathroom
        self.equipment = equipment
    }
}
