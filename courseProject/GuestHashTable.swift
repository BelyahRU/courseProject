class GuestHashTable {
    private var table: [Guest?] // сама хеш-таблица
    private var capacity: Int // вместительность хеш таблици
    private var size: Int // заполненность
    private var count: Int = 0 // количество элем
    
    // инициализатор
    init(capacity: Int) {
        self.capacity = capacity
        self.table = Array(repeating: nil, count: capacity)
        self.size = 0
    }
    
    //метод хеширования
    private func hash(_ passportNumber: String) -> Int {
        var hashValue = 0
        for char in passportNumber {
            hashValue = 31 &* hashValue &+ Int(char.asciiValue!)
        }
        return abs(hashValue % capacity)
    }
    
    // метод перехода на следующий индекс
    private func getNextIndex(_ currentIndex: Int, _ i: Int) -> Int {
        return (currentIndex + i*i) % capacity
    }
    
    // метод вставки значения в хеш-таблицу
    func insert(_ guest: Guest) {
        count += 1
        if size == capacity {
            print("Table is full")
            return
        }
        var index = hash(guest.passportNumber)
        var i = 1
        while table[index] != nil {
            index = getNextIndex(index, i)
            i += 1
        }
        table[index] = guest
        size += 1
    }
    
    // метод поиска гостя в хештаблице по паспорту
    func search(_ passportNumber: String) -> Guest? {
        var index = hash(passportNumber)
        var i = 1
        while table[index] != nil {
            if table[index]?.passportNumber == passportNumber {
                return table[index]
            }
            index = getNextIndex(index, i)
            i += 1
        }
        return nil
    }
    
    
    // удаление элемента в хештаблице
    func delete(_ passportNumber: String) -> Bool{
        count -= 1
        var index = hash(passportNumber)
        var i = 1
        while table[index] != nil {
            if table[index]?.passportNumber == passportNumber {
                table[index] = nil
                size -= 1
                return true
            }
            index = getNextIndex(index, i)
            i += 1
        }
        return false
    }
    // удаление всех элементов в хештаблице
    func deleteAll() {
        count = 0
        self.table = Array(repeating: nil, count: capacity)
    }
    // метод, печатающий ФИО постояльца и его номер паспорта
    func printGuest(){
        for i in 0 ..< table.count{
            if table[i] != nil {
                print("\nПостоялец - \(table[i]!.fullName), его номер паспорта - \(table[i]!.passportNumber)")
            }
        }
    }
    
    // метод поиска по ФИО, возвращает список гостей с одинаковыми ФИО
    func searchByFullName(fullname: String) -> [Guest]{
        var arrayGuests: [Guest] = []
        for i in 0 ..< table.count {
            if table[i] != nil {
                if fullname == table[i]!.fullName {
                    arrayGuests.append(table[i]!)
                }
            }
        }
        return arrayGuests
    }
    
}
