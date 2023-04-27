func checkRoomInData() -> String {
    var number = getRoomNumber()
    
    while true {
        if hotelRooms.find(number) != nil {
            break
        } else {
            print("Номер введен корректно, но не найден в базе")
            number = getRoomNumber()
        }
    }
    return number
}
