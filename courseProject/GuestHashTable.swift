class GuestHashTable {
    private var table: [Guest?]
    private var capacity: Int
    private var size: Int
    
    init(capacity: Int) {
        self.capacity = capacity
        self.table = Array(repeating: nil, count: capacity)
        self.size = 0
    }
    
    private func hash(_ passportNumber: String) -> Int {
        var hashValue = 0
        for char in passportNumber {
            hashValue = 31 &* hashValue &+ Int(char.asciiValue!)
        }
        return abs(hashValue % capacity)
    }
    
    private func getNextIndex(_ currentIndex: Int, _ i: Int) -> Int {
        return (currentIndex + i*i) % capacity
    }
    
    func insert(_ guest: Guest) {
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
    
    func delete(_ passportNumber: String) {
        var index = hash(passportNumber)
        var i = 1
        while table[index] != nil {
            if table[index]?.passportNumber == passportNumber {
                table[index] = nil
                size -= 1
                return
            }
            index = getNextIndex(index, i)
            i += 1
        }
    }
}
