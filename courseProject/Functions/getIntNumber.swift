func getIntNumber() -> Int{
    var number: Int = 0
    while true {
        if let types = readLine() {
            if let typess = Int(types) {
                number = typess
                break
            } else {
                print("Введено не целое число, повторите ввод")
            }
        } else {
            print("Ничего не введено, повторите ввод")
        }
        
    }
    return number
}
