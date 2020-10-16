let item1 = 50.4
let item2 = 30.2
var fechaRenta = ["anio": 2019, "mes" : 05, "dia": 01]
var numDiasRenta = 5
var ultimoDia = 0
print("La fecha de renta es: \(fechaRenta["dia"])/\(fechaRenta["mes"])/\(String(describing: fechaRenta["anio"]))")
print("Es biciesto: ", biciesto(anio: fechaRenta["anio"]!))
print("El ultimo dia del mes es: ", ultimoDiaMes(mes: fechaRenta["mes"]! ,anio: fechaRenta["anio"]!))
let (diaLimit , mesLimit, anioLimit) = calcularFechaEntrega(renta: fechaRenta, diasRenta: numDiasRenta)
print("La ultima fecha es: \(diaLimit!)/\(mesLimit!)/\(anioLimit!)")


func biciesto(anio: Int) -> Bool{
    return (anio%4 == 0 && anio % 100 != 0) 
}

func ultimoDiaMes(mes : Int,anio : Int)  -> Int {
    var diasMes=30
    switch mes {
    case 1,3,5,7,8,10,12:
        diasMes=31
    case 4,6,9,11:
        diasMes=30
    case 2:
        diasMes=biciesto(anio: anio) ? 29 :28
    default:
        diasMes=0
    }
    return diasMes
}

func calcularFechaEntrega(renta:[String:Int],diasRenta:Int) -> (Int?,Int?,Int?){
    var anioEntrega=renta["anio"]!
    var mesEntrega=renta["mes"]!
    var diaEntrega=renta["dia"]!
    let ultimoDiaMesv = ultimoDiaMes(mes: mesEntrega, anio: anioEntrega)
    if 1 ... 15 ~= diasRenta{
        for _ in 1...diasRenta {
            if(diaEntrega == ultimoDiaMesv){
                diaEntrega = 0
                if(mesEntrega == 12){
                    mesEntrega = 0
                }
                mesEntrega += 1
            }
            diaEntrega += 1
        }
    }else{
        diaEntrega=0
        mesEntrega=0
        anioEntrega=0
    }
    
    
    return (diaEntrega,mesEntrega,anioEntrega)
}
