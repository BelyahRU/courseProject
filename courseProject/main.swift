// 626 - last 3 digits of student card
// 1) subject area - Регистрация постояльцев в гостинице
// 2) hashing method - Закрытое хеширование с квадратичным опробованрием
// 3) sorting method - Шейкерная
// 4) list type - Линейный двунаправленный
// 5) tree traversal method - Прямой
// 6) word search algorithm in the text - Боуера и Мура (БМ)





 //guest information
var hashTable = GuestHashTable(capacity: 10)

let guest1 = Guest(passportNumber: "1234-567890", fullName: "Ivan Ivanov", birthYear: 1990, address: "Moscow", purposeOfStay: "Business")

hashTable.insert(guest1)

let guest2 = Guest(passportNumber: "9876-543210", fullName: "Anna Petrova", birthYear: 1985, address: "Saint Petersburg", purposeOfStay: "Vacation")
hashTable.insert(guest2)

let guest3 = Guest(passportNumber: "5678-123456", fullName: "Sergey Smirnov", birthYear: 1978, address: "Kazan", purposeOfStay: "Business")
hashTable.insert(guest3)

let foundGuest = hashTable.search("9876-543210")
//if let guest = foundGuest {
//    print("Found guest: \(guest.fullName)")
//}
//hashTable.printGuest()
//hashTable.delete("1234-567890")






// Hotel room data
var room1 = HotelRoom(number: "L001", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, ванна, кухня, 2 кровати")
var room2 = HotelRoom(number: "L005", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, окно, кухня, 2 кровати")
var room3 = HotelRoom(number: "L302", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Котик, ванна, кухня, 2 кровати")
var room4 = HotelRoom(number: "L201", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Прачка, ванна, кухня, 2 кровати")
var room5 = HotelRoom(number: "L003", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Душ, ванна, кухня, 2 кровати")

var HotelRoomss = AVLTree()
HotelRoomss.insert(room1)
HotelRoomss.insert(room2)
HotelRoomss.insert(room3)
HotelRoomss.insert(room4)
HotelRoomss.insert(room5)
print(HotelRoomss.description)
print(HotelRoomss.deleteRoom("L003"))
print(HotelRoomss.description)






// check-in and check-out of guests.
var checkIOg1 = CheckInOut(passportId: "1917-122955", number: "L408", checkInData: "20.02.2023", checkOutData: "30.04.2023")
var checkIOg2 = CheckInOut(passportId: "1920-143955", number: "L508", checkInData: "30.12.2022", checkOutData: "31.04.2023")
var checkIOg3 = CheckInOut(passportId: "4917-654955", number: "L008", checkInData: "10.02.2023", checkOutData: "20.04.2023")
var checkIOg4 = CheckInOut(passportId: "1921-642952", number: "L933", checkInData: "20.02.2023", checkOutData: "30.02.2023")
var checkIOg5 = CheckInOut(passportId: "4017-352955", number: "L001", checkInData: "20.01.2022", checkOutData: "30.02.2022")
var checkIOg6 = CheckInOut(passportId: "4017-352955", number: "L409", checkInData: "20.01.2022", checkOutData: "30.02.2022")
var checkIOg7 = CheckInOut(passportId: "4017-352955", number: "L000", checkInData: "20.01.2022", checkOutData: "30.02.2022")
var list = DLinkedList<CheckInOut>()

let coolNode = DNode<CheckInOut?>(value: nil)
list.prepend(value: checkIOg1)
list.prepend(value: checkIOg2)
list.prepend(value: checkIOg3)
list.prepend(value: checkIOg4)
list.append(value: checkIOg5)
list.append(value: checkIOg6)
list.append(value: checkIOg7)
//print(list.getCountElements())

//print(list.nodeAt(index: 1)!.value!)
//list.insert(value: "apples", at: 2)
//list.insert(node: coolNode, at: 3)

//list.printList()

//cocktailSort(&list)
//print(list.nodeAt(index: 2)!.value!.getCorrectNumber())
//list.printList()
// Пример использования
//list.printList()





var hotel = GuestHashTable(capacity: 999) // Вместительность гостиницы
var hotelRooms = AVLTree() // Номера гостиницы
print("Регистрация постояльцев в гостинице\n")

var doesProgramWork = true
while doesProgramWork == true {
    print("Выберете что вы хотите сделать: \n")
    print("1.Зарегистрировать нового постояльца")
    print("2.Удалить данные о постояльце")
    print("3.Просмотр всех зарегистрированных постояльцев")
    print("4.Очистка данных о постояльцах")
    print("5.Поиск постояльца по номеру паспорта")
    print("6.Поиск постояльца по ФИО")
    print("7.Добавление нового гостиничного номера")
    print("8.Удаление сведений о гостиничном номере")
    print("9.Просмотр всех имеющихся номеров")
    print("10.Очистка данных о гостиничных номерах")
    print("11.Поиск гостиничного номера по \"по номеру гостиничного номера\"")
    print("12.Поиск гостиничного номера по фрагментам \"Оборудования\"")
    print("13.Регистрация вселения нового постояльца")
    print("14.Регистрация вЫселения нового постояльца")
    print("Для выхода из программы введите число, не соответствующее диапазону")
    let answer = Int(readLine()!)
    if answer! == 1 {
        print("Для регистрации постояльца вам нужно будет ввести его данные")
        print("Введите серию и номер паспорта через тире, например 1111-111111:")
        // нужно написать проверку на корректность ввода данных
        let id = String(readLine()!)
        print("Введите ФИО через пробел:")
        let fullName = String(readLine()!)
        print("Введите год рождения:")
        let birthYear = Int(readLine()!)
        print("Введите адрес прибытия:")
        let adress = String(readLine()!)
        print("Введите цель прибытия:")
        let purpose = String(readLine()!)
        
        let guest = Guest(passportNumber: id, fullName: fullName, birthYear: birthYear!, address: adress, purposeOfStay: purpose)
        hotel.insert(guest)
        print("Гость добавлен")
    }else if answer == 2 {
        print("Номер пасспорта постояльца, которого необходимо удалить из базы:")
        let passportNumber = String(readLine()!)
        hotel.delete(passportNumber)
        print("Постоялец удален из базы")
    } else if answer == 3 {
        print("Все зарегистрированные пользователи: ")
        hotel.printGuest()
    } else if answer == 4{
        hotel.deleteAll()
        print("Все постояльцы удалены")
    } else if answer == 5 {
        print("Введите номер паспорта:")
        let passportNumber = String(readLine()!)
        
        if let answ = hotel.search(passportNumber) {
            print(answ)
        } else {
            print("Пользователь не найден")
        }
    } else if answer == 6 {
        
        
        
        print()
        
        
        
    } else if answer == 7 {
        print("Для добавления номер в гостиницу необходимо указать дополнительные данные \n")
        print("Укажите номер в формате ANNN: ")
        //добавь проверку формата
        let number = String(readLine()!)
        print("Укажите количество мест в номере: ")
        let numberOfSeats = String(readLine()!)
        print("Укажите количество комнат в номере: ")
        let numberOfRooms = String(readLine()!)
        print("Укажите есть ли санузел (true/false)")
        let presenceOfBathroom = Bool(readLine()!)
        print("Укажите Оборудование")
        let equipment = String(readLine()!)
        let room = HotelRoom(number: number, numberOfSeats: numberOfSeats, numberOfRooms: numberOfRooms, presenceOfABathroom: presenceOfBathroom!, equipment: equipment)
        hotelRooms.insert(room)
        print("Номер создан")
    } else if answer == 8 {
        print("Введите номер, который вы хотите удалить")
        let number = String(readLine()!)
        hotelRooms.deleteRoom(number)
        print("Номер удален")
    } else if answer == 9 {
        // Добавить массив
        print(hotelRooms.description)
    } else if answer == 10 {
        hotelRooms.re
    }
    
    if answer! <= 0 || answer! > 14{
        doesProgramWork = false
    }
}
