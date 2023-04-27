// 626 - last 3 digits of student card
// 1) subject area - Регистрация постояльцев в гостинице
// 2) hashing method - Закрытое хеширование с квадратичным опробованрием
// 3) sorting method - Шейкерная
// 4) list type - Линейный двунаправленный
// 5) tree traversal method - Прямой
// 6) word search algorithm in the text - Боуера и Мура (БМ)





 //guest information
//var hashTable = GuestHashTable(capacity: 10)

//let guest1 = Guest(passportNumber: "1234-567890", fullName: "Ivan Ivanov", birthYear: 1990, address: "Moscow", purposeOfStay: "Business")
//
//hashTable.insert(guest1)
//
//let guest2 = Guest(passportNumber: "9876-543210", fullName: "Anna Petrova", birthYear: 1985, address: "Saint Petersburg", purposeOfStay: "Vacation")
//hashTable.insert(guest2)
//
//let guest3 = Guest(passportNumber: "5678-123456", fullName: "Sergey Smirnov", birthYear: 1978, address: "Kazan", purposeOfStay: "Business")
//hashTable.insert(guest3)

//let foundGuest = hashTable.search("9876-543210")
//if let guest = foundGuest {
//    print("Found guest: \(guest.fullName)")
//}
//hashTable.printGuest()
//hashTable.delete("1234-567890")






// Hotel room data
//var room1 = HotelRoom(number: "L001", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, ванна, кухня, 2 кровати")
//var room2 = HotelRoom(number: "L005", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Телевизор, окно, кухня, 2 кровати")
//var room3 = HotelRoom(number: "L302", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Котик, ванна, кухня, 2 кровати")
//var room4 = HotelRoom(number: "L201", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Прачка, ванна, кухня, 2 кровати")
//var room5 = HotelRoom(number: "L003", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "Душ, ванна, кухня, 2 кровати")

//var HotelRoomss = AVLTree()
//HotelRoomss.insert(room1)
//HotelRoomss.insert(room2)
//HotelRoomss.insert(room3)
//HotelRoomss.insert(room4)
//HotelRoomss.insert(room5)
//print(HotelRoomss.description)
//print(HotelRoomss.deleteRoom("L003"))
//print(HotelRoomss.description)
//HotelRoomss.removeAll()
//print(HotelRoomss.description)
//print(HotelRoomss.searchByEquipment("Прачка"))





// check-in and check-out of guests.
//var checkIOg1 = CheckInOut(passportId: "1917-122955", number: "L408", checkInData: "20.02.2023", checkOutData: "30.04.2023")
//var checkIOg2 = CheckInOut(passportId: "1920-143955", number: "L508", checkInData: "30.12.2022", checkOutData: "31.04.2023")
//var checkIOg3 = CheckInOut(passportId: "4917-654955", number: "L008", checkInData: "10.02.2023", checkOutData: "20.04.2023")
//var checkIOg4 = CheckInOut(passportId: "1921-642952", number: "L933", checkInData: "20.02.2023", checkOutData: "30.02.2023")
//var checkIOg5 = CheckInOut(passportId: "4017-352955", number: "L001", checkInData: "20.01.2022", checkOutData: "30.02.2022")
//var checkIOg6 = CheckInOut(passportId: "4017-352955", number: "L409", checkInData: "20.01.2022", checkOutData: "30.02.2022")
//var checkIOg7 = CheckInOut(passportId: "4017-352955", number: "L000", checkInData: "20.01.2022", checkOutData: "30.02.2022")
//var list = DLinkedList()
//
//list.prepend(value: checkIOg1)
//list.prepend(value: checkIOg2)
//list.prepend(value: checkIOg3)
//list.prepend(value: checkIOg4)
//list.append(value: checkIOg5)
//list.append(value: checkIOg6)
//list.append(value: checkIOg7)
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


print("Перед началом работы проограммы введите вместительность гостиницы: ")
var capacity = Int(readLine()!)!

var hotel = GuestHashTable(capacity: capacity) // Вместительность гостиницы
let guest1 = Guest(passportNumber: "1234-567890", fullName: "Ivan Aleksandrovich Ivanov", birthYear: 1990, address: "Moscow", purposeOfStay: "Business")

hotel.insert(guest1)

let guest2 = Guest(passportNumber: "9876-543210", fullName: "Anna Evgenievna Petrova", birthYear: 1985, address: "Saint Petersburg", purposeOfStay: "Vacation")
hotel.insert(guest2)

let guest3 = Guest(passportNumber: "5678-123456", fullName: "Andrey Ivanovich Yakovlev", birthYear: 1978, address: "Yfa", purposeOfStay: "Travel")
hotel.insert(guest3)
let guest4 = Guest(passportNumber: "5864-201987", fullName: "Sergey Aleksandrovich Smirnov", birthYear: 2003, address: "Kazan", purposeOfStay: "Business")
hotel.insert(guest4)
let guest5 = Guest(passportNumber: "1917-402234", fullName: "Aleksandr Sergeevich Andreev", birthYear: 1965, address: "Kazan", purposeOfStay: "Business")
hotel.insert(guest5)
let guest6 = Guest(passportNumber: "4201-535325", fullName: "Sergey Aleksandrovich Smirnov", birthYear: 1987, address: "Saint Petersburg", purposeOfStay: "Travel")
hotel.insert(guest6)
let guest7 = Guest(passportNumber: "1923-524566", fullName: "Amina Nikolaevna Smirnova", birthYear: 1999, address: "Babaevo", purposeOfStay: "Travel")
hotel.insert(guest7)



var hotelRooms = AVLTree() // Номера гостиницы
var room1 = HotelRoom(number: "L001", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "телевизор, ванна, кухня, 2 кровати")
var room2 = HotelRoom(number: "L005", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "телевизор, окно, кухня, 2 кровати")
var room3 = HotelRoom(number: "L302", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "котик, ванна, кухня, 2 кровати")
var room4 = HotelRoom(number: "L201", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "прачка, ванна, кухня, 2 кровати")
var room5 = HotelRoom(number: "L003", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "душ, ванна, кухня, 2 кровати")

hotelRooms.insert(room1)
hotelRooms.insert(room2)
hotelRooms.insert(room3)
hotelRooms.insert(room4)
hotelRooms.insert(room5)

var listGuests = DLinkedList() // Список гостей
var checkInguest1 = CheckInOut(passportId: "1234-567890", number: "L001", checkInData: "20.12.2022", checkOutData: "01.01.2023")
room1.addGuest()

var checkInguest2 = CheckInOut(passportId: "9876-543210", number: "L005", checkInData: "24.11.2022", checkOutData: "21.12.2022")
room2.addGuest()

var checkInguest3 = CheckInOut(passportId: "5678-123456", number: "L302", checkInData: "28.05.2023", checkOutData: "30.05.2023")
print("Регистрация постояльцев в гостинице\n")
room3.addGuest()

var doesProgramWork = true
while doesProgramWork == true {
    print("\n Выберете что вы хотите сделать: \n")
    print("1.Зарегистрировать нового постояльца")
    print("2.Удалить данные о постояльцев")
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
        var id = String(readLine()!)
        
        while true {
            if isCorrectPassport(id) == true {
                if let a = hotel.search(id) {
                    print("Пользователь уже есть в базе данных")
                    id = String(readLine()!)
                } else {
                    break
                }
            } else {
                print("паспорт введен неверно, повторите ввод")
                id = String(readLine()!)
            }
        }
        
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
        print("Номер паспорта постояльца, которого необходимо удалить из базы:")
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
        // Еще номер, в котором он проживает
        print("Введите номер паспорта:")
        let passportNumber = String(readLine()!)
        
        if let answ = hotel.search(passportNumber) {
            print(answ)
        } else {
            print("Пользователь не найден")
        }
        
    } else if answer == 6 {
        print("Введите ФИО постояльца: ")
        let fullName = String(readLine()!)
        let arrayGuests: [Guest] = hotel.searchByFullName(fullname: fullName)
        for i in 0..<arrayGuests.count {
            print(i+1)
            print("Номер паспорта - \(arrayGuests[i].passportNumber)")
            print("ФИО - \(arrayGuests[i].fullName)")
        }
        
    } else if answer == 7 {
        // алгоритм поиска слова в тексте
        
        print("Для добавления номера в гостиницу необходимо указать дополнительные данные \n")
        print("Укажите номер в формате ANNN , где ")
        print("A - буква, обозначающая тип номера(L – люкс, P – полулюкс, O – одно- местный, M – многоместный)")
        print("NNN - порядковый номер")
        var number = String(readLine()!)
        
        while true {
            if isCorrectRoomNumber(number) {
                break
            } else {
                print("Некорректно, повторите ввод: ")
                number = String(readLine()!)
            }
        }
        
        print("Укажите количество мест в номере: ")
        var numberOfSeats = String(readLine()!)
        while true {
            if let num = Int(numberOfSeats) {
                break
            } else {
                print("Некорректно, повторите ввод: ")
                numberOfSeats = String(readLine()!)
            }
        }
        print("Укажите количество комнат в номере: ")
        var numberOfRooms = String(readLine()!)
        while true {
            if let num = Int(numberOfRooms) {
                break
            } else {
                print("Некорректно, повторите ввод: ")
                numberOfRooms = String(readLine()!)
            }
        }
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
        hotelRooms.removeAll()
        print("Данные очищены")
        
    } else if answer == 11 {
        print("Введите номер:")
        let number = String(readLine()!)
        let room = hotelRooms.find(number)!
        // добавить постояльца
        print(room.getAllInformation())
        
    } else if answer == 12 {
        // алгоритм поиска
        print("Введите фрагменты оборудования через запятую с пробелом")
        let equipment = String(readLine()!)
        // дописать по методичке
        let result = hotelRooms.searchByEquipment(equipment)
        
    } else if answer == 13 {
        print("Введите серию и номер паспорта через тире, например 1111-111111:")
        var id = String(readLine()!)
        
        while true {
            if isCorrectPassport(id) == true{
                if let _ = hotel.search(id) {
                    break
                } else {
                    print("Паспорт введен корректно, но пользователь не найден в базе. Повторите ввод")
                    id = String(readLine()!)
                }
            } else {
                print("паспорт введен неверно, повторите ввод")
                id = String(readLine()!)
            }
        }
        
        print("Введите номер комнаты, в которую хотите заехать: ")
        var number = String(readLine()!)
        
        while true {
            if isCorrectRoomNumber(number) {
                if let a = hotelRooms.find(number) {
                    break
                }
                print("Номер введен корректно, но не найден в базе")
            } else {
                print("Некорректно, повторите ввод: ")
                number = String(readLine()!)
            }
        }
        
        
        print("Введите дату заезда: ")
        let checkInData = String(readLine()!)
        print("Введите дату вызаезда: ")
        let checkOutData = String(readLine()!)
        
        var room = hotelRooms.find(number)!
        if Int(room.numberOfSeats)! > room.countGuets {
            room.addGuest()
            let guestCheckIn = CheckInOut(passportId: id, number: number, checkInData: checkInData, checkOutData: checkOutData)
            listGuests.append(value: guestCheckIn)
            cocktailSort(&listGuests)
        } else {
            print("Все места в комнате заняты")
        }
        print("Постоялец заселен")
        
    } else if answer == 14 {
        print("Введите номер паспорта клиента, которого хотите выселить:")
        var id = String(readLine()!)
        
        while true {
            if isCorrectPassport(id) == true{
                if let _ = hotel.search(id) {
                    break
                } else {
                    print("Паспорт введен корректно, но пользователь не найден в базе. Повторите ввод")
                    id = String(readLine()!)
                }
            } else {
                print("паспорт введен неверно, повторите ввод")
                id = String(readLine()!)
            }
        }
        
        let nodeGuest = listGuests.find(passportId: id)
        listGuests.remove(node: nodeGuest!)
        print("Пользователь удален")
    }
    
    if answer! <= 0 || answer! > 14{
        doesProgramWork = false
    }
}
