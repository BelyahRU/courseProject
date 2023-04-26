// 626 - last 3 digits of student card
// 1) subject area - Регистрация постояльцев в гостинице
// 2) hashing method - Закрытое хеширование с квадратичным опробованрием
// 3) sorting method - Шейкерная
// 4) list type - Линейный двунаправленный
// 5) tree traversal method - Прямой
// 6) word search algorithm in the text - Боуера и Мура (БМ)


// guest information
var hashTable = GuestHashTable(capacity: 10)

let guest1 = Guest(passportNumber: "1234-567890", fullName: "Ivan Ivanov", birthYear: 1990, address: "Moscow", purposeOfStay: "Business")

hashTable.insert(guest1)

let guest2 = Guest(passportNumber: "9876-543210", fullName: "Anna Petrova", birthYear: 1985, address: "Saint Petersburg", purposeOfStay: "Vacation")
hashTable.insert(guest2)

let guest3 = Guest(passportNumber: "5678-123456", fullName: "Sergey Smirnov", birthYear: 1978, address: "Kazan", purposeOfStay: "Business")
hashTable.insert(guest3)

let foundGuest = hashTable.search("9876-543210")
if let guest = foundGuest {
    print("Found guest: \(guest.fullName)")
}

hashTable.delete("1234-567890")

// Hotel room data
var room1 = HotelRoom(number: "L001", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, ванна, кухня, 2 кровати")
var room2 = HotelRoom(number: "L005", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, окно, кухня, 2 кровати")
var room3 = HotelRoom(number: "L302", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Котик, ванна, кухня, 2 кровати")
var room4 = HotelRoom(number: "L201", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Прачка, ванна, кухня, 2 кровати")
var room5 = HotelRoom(number: "L003", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Душ, ванна, кухня, 2 кровати")

var HotelRooms = AVLTree()
HotelRooms.insert(room1)
HotelRooms.insert(room2)
HotelRooms.insert(room3)
HotelRooms.insert(room4)
HotelRooms.insert(room5)
print(HotelRooms.description)
// check-in and check-out of guests.
// Пример использования
