// 626 - last 3 digits of student card
// 1) subject area - Регистрация постояльцев в гостинице
// 2) hashing method - Закрытое хеширование с квадратичным опробованрием
// 3) sorting method - Шейкерная
// 4) list type - Линейный двунаправленный
// 5) tree traversal method - Прямой
// 6) word search algorithm in the text - Боуера и Мура (БМ)
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

var hotelRooms = AVLTree()
hotelRooms.insert(HotelRoom(number: "L001", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "телевизор, ванна, кухня, 2 кровати"))
hotelRooms.insert(HotelRoom(number: "L005", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "телевизор, окно, кухня, 2 кровати"))
hotelRooms.insert(HotelRoom(number: "L302", numberOfSeats: "1", numberOfRooms: "3", presenceOfABathroom: true, equipment: "котик, ванна, кухня, 2 кровати"))
hotelRooms.insert(HotelRoom(number: "L201", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "прачка, ванна, кухня, 2 кровати"))
hotelRooms.insert(HotelRoom(number: "L003", numberOfSeats: "2", numberOfRooms: "3", presenceOfABathroom: true, equipment: "душ, ванна, кухня, 2 кровати"))

var listGuests = DLinkedList() // Список гостей
var checkInguest1 = CheckInOut(passportId: "1234-567890", number: "L001", checkInData: "20.12.2022", checkOutData: "01.01.2023")

var checkInguest2 = CheckInOut(passportId: "9876-543210", number: "L001", checkInData: "24.11.2022", checkOutData: "21.12.2022")

var checkInguest3 = CheckInOut(passportId: "5678-123456", number: "L302", checkInData: "28.05.2023", checkOutData: "30.05.2023")

print("Регистрация постояльцев в гостинице\n")
listGuests.append(value: checkInguest1)
listGuests.append(value: checkInguest2)
listGuests.append(value: checkInguest3)
var room = hotelRooms.find("L001")!
print(listGuests.getCountGuests(room: room))
var dict: Dictionary<String, Int> = [:]
var doesProgramWork = true
while doesProgramWork == true {
    print("\n    Выберете действие: \n")
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
    let answer = getIntNumber()
    //проверка корректности ввода
    if answer == 1 {
        print("Для регистрации постояльца вам нужно будет ввести его данные")
        var passportNumber = checkPassportInData()
        print("Введите ФИО через пробел:")
        let fullName = String(readLine()!)
        print("Введите год рождения:")
        let birthYear = getIntNumber()
        print("Введите адрес прибытия:")
        let adress = String(readLine()!)
        print("Введите цель прибытия:")
        let purpose = String(readLine()!)
        
        let guest = Guest(passportNumber: passportNumber, fullName: fullName, birthYear: birthYear, address: adress, purposeOfStay: purpose)
        hotel.insert(guest)
        
        print("Постоялец зарегестрированн")
        
    }else if answer == 2 {
        
        print("Номер паспорта постояльца, которого необходимо удалить из базы:")
        let passportNumber = getPassportNumber()
        
        if hotel.delete(passportNumber) {
            print("Данные о постояльце удалены")
        } else {
            print("Пользователь не найден")
        }
        
    } else if answer == 3 {
        //живет ли
        print("Все зарегистрированные постояльцы: ")
        hotel.printGuest()
        
    } else if answer == 4{
        hotel.deleteAll()
        print("Данные о постояльцах очищены")
        
    } else if answer == 5 {
        print("Введите номер паспорта:")
        let passportNumber = getPassportNumber()
        
        if let answ = hotel.search(passportNumber) {
            answ.getAllInformation()
            if let roomAnsw = listGuests.find(passportId: answ.passportNumber)?.value {
                print( hotelRooms.find(roomAnsw.number)!.getAllInformation())
            } else {
                print("В данный момент не проживает в отеле")
                
            }
        } else {
            print("Пользователь не найден")
        }
        
    } else if answer == 6 {
        print("Введите ФИО постояльца: ")
        let fullName = String(readLine()!)
        let arrayGuests: [Guest] = hotel.searchByFullName(fullname: fullName)
        for i in 0..<arrayGuests.count {
            print("\n\(i+1) найденный постоялец: ")
            print("Номер паспорта - \(arrayGuests[i].passportNumber)")
            print("ФИО - \(arrayGuests[i].fullName)")
        }
        
    } else if answer == 7 {
        print("Для добавления номера в гостиницу необходимо указать дополнительные данные \n")
        var number = getRoomNumber()
        
        while true {
            if hotelRooms.find(number) == nil {
                break
            } else {
                print("Гостиничный номер с данным номером уже существует, повторите ввод")
                number = getRoomNumber()
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
        
        var presenceOfBathroom = Bool(readLine()!)
        //добавить проверку
        
        print("Укажите Оборудование")
        print("Оборудование обязательно должно быть написано через запятую с пробелом!")
        let equipment = String(readLine()!)
        
        let room = HotelRoom(number: number, numberOfSeats: numberOfSeats, numberOfRooms: numberOfRooms, presenceOfABathroom: presenceOfBathroom!, equipment: equipment)
        hotelRooms.insert(room)
        print("Номер создан")
        
    } else if answer == 8 {
        var number = getRoomNumber()
        while true {
            if hotelRooms.find(number) != nil {
                break
            } else {
                print("Данного номера не существует")
                number = getRoomNumber()
            }
        }
        
        hotelRooms.deleteRoom(number)
        print("Номер удален")
        
    } else if answer == 9 {
        let arrayRooms = hotelRooms.allNumbers
        if arrayRooms == [] {
            print("Номеров нет")
        }
        for i in 0..<arrayRooms.count {
            let room = hotelRooms.find(arrayRooms[i])!
            print(hotelRooms.find(room.number)!.getAllInformation())
        }
        print("\nНомера в виде АВЛ-дерева:")
        print(hotelRooms.description)
        
    } else if answer == 10 {
        hotelRooms.removeAll()
        print("Данные очищены")
        
    } else if answer == 11 {
        print("Введите номер:")
        let number = getRoomNumber()
        let room = hotelRooms.find(number)!
        let idArray = listGuests.findPassport(room: room)
        for i in 0..<idArray.count {
            let answ = hotel.search(idArray[i])
            answ!.getAllInformation()
        }
        print(room.getAllInformation())
        
    } else if answer == 12 {
        // алгоритм поиска
        print("Введите фрагменты оборудования через запятую с пробелом")
        let equipment = String(readLine()!)
        let result = hotelRooms.searchByEquipment(equipment)
        for i in 0..<result.count {
            print(result[i].number)
        }
        print(result)
        
    } else if answer == 13 {
        var id = getPassportNumber()
        
        while true {
            if let _ = hotel.search(id) {
                break
            } else {
                print("Паспорт введен корректно, но пользовательне найден в базе. Повторите ввод")
                id = getPassportNumber()
            }
        }
        var number = checkRoomInData()
        print("Введите дату заезда: ")
        let checkInData = String(readLine()!)
        print("Введите дату выезда: ")
        let checkOutData = String(readLine()!)
        
        var room = hotelRooms.find(number)!
        var countGuest = listGuests.getCountGuests(room: room)
        if Int(room.numberOfSeats)! > countGuest {
            let guestCheckIn = CheckInOut(passportId: id, number: number, checkInData: checkInData, checkOutData: checkOutData)
            listGuests.append(value: guestCheckIn)
            cocktailSort(&listGuests)
            print("Постоялец заселен")
        } else {
            print("Все места в комнате заняты")
        }
        
    } else if answer == 14 {
        print("Введите номер паспорта клиента, которого хотите выселить:")
        var id = checkPassportInData()
        let nodeGuest = listGuests.find(passportId: id)
        listGuests.remove(node: nodeGuest!)
        print("Пользователь удален")
    }
    if answer <= 0 || answer > 14{
        doesProgramWork = false
    }
}
