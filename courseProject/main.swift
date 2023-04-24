// 626 - last 3 digits of student card
// 1) subject area - Регистрация постояльцев в гостинице
// 2) hashing method - Закрытое хеширование с квадратичным опробованрием
// 3) sorting method - Шейкерная
// 4) list type - Линейный двунаправленный
// 5) tree traversal method - Прямой
// 6) word search algorithm in the text - Боуера и Мура (БМ)


// guest information


// Hotel room data

// check-in and check-out of guests.
// Пример использования
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
