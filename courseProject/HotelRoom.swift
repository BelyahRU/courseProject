
import Foundation
struct HotelRoom{
    var number: String // номер номера, формата ANNN
    var numberOfSeats: String // количество мест
    var numberOfRooms: String // количество комнат
    var presenceOfABathroom: Bool // наличие санузла
    var equipment: String // Оборудование в комнате
    
    var countGuets: Int = 0 // Количество гостей
    
    init(number: String, numberOfSeats: String, numberOfRooms: String, presenceOfABathroom: Bool, equipment: String) {
        self.number = number
        self.numberOfSeats = numberOfSeats
        self.numberOfRooms = numberOfRooms
        self.presenceOfABathroom = presenceOfABathroom
        self.equipment = equipment
    }
    
    mutating func addGuest(){
        countGuets += 1
    }
    
    func getCorrectNumber() -> Int {
        let currentNum = Int(number.trimmingCharacters(in: CharacterSet.letters))!
        return currentNum
    }
    
    func getAllInformation() -> String {
        var info = ""
        info += "Номер: \(number), количество мест: \(numberOfSeats), количество комнат: \(numberOfRooms), наличие санузла: \(presenceOfABathroom), Оборудование в комнате: \(equipment)"
        return info
    }
}
