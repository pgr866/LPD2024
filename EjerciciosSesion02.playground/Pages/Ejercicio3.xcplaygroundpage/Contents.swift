struct Point2D {
    var componentX: Int = 0
    var componentY: Int = 0
    init?(componentX: Int = 0, componentY: Int = 0){
        if componentX < 0 || componentY < 0 {
            return nil
        }
        self.componentY = componentX
        self.componentY = componentY
    }
    func toString() -> String{
        return "(\(componentX),\(componentY))"
    }
}

if let punto1 = Point2D(componentX:10, componentY: 15){
    print(punto1.toString())
}
if let punto2 = Point2D(componentY: -15){
    print(punto2.toString())
}
if let punto3 = Point2D(componentX: -15){
    print(punto3.toString())
}
if let punto3 = Point2D(){
    print(punto3.toString())
}

// Vamos a analizar el siguiente fragmento de código:
if var punto5 = Point2D() {
    var punto6 = punto5
    punto5.componentY = -4
    punto6.componentX = -3
    print(punto5.toString())
    print(punto6.toString())
}
