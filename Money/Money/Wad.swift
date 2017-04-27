//
//  Wad.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

//MARK: - Typealiases
typealias Bills = [Bill]

//MARK: - -- Struct Wad --
struct Wad {
    //MARK: - Properties
    var _bills = Bills()
    
    var billCount : Int{
        get{
            return _bills.count
        }
    }
}

//MARK: - -- Extensions --
extension Wad : Money {
    //MARK: - Initialization
    init(amount: Int, currency: Currency) {
        _bills.append(Bill(amount: amount, currency: currency))
    }
    
    //MARK: - Functions
    // Función que multiplica amount por el número pasado por parámetro
    func times(_ n:Int) -> Wad {
        return self
    }
    
    // Función que permite la suma de dos objetos Bill
    func plus(_ add: Wad) -> Wad {
        return Wad(_bills: _bills + add._bills)
    }
    
    // Función que retorna el ratio de conversión teniendo en cuenta los parámetros de las currency llegadas por parámetro
    func reduced(to: Currency, broker: Rater) throws -> Bill {
        var tally = Bill(amount: 0, currency: to)
        
        for each in _bills {
            tally = try tally.reduced(to: to, broker: broker).plus(try each.reduced(to: to, broker: broker))
        }
        
        return tally
    }
}

//MARK: - -- Protocols Extensions --
//MARK: Equatable
// Protocolo Equatable. Protocolo que compara dos objetos Wad y retorna si son iguales.
extension Wad : Equatable{
    public static func ==(lhs: Wad, rhs: Wad) -> Bool{
        
        // Antes de poder comparar se tiene que normalizar la currency
        let broker = UnityBroker()
        
        let leftBill = try! lhs.reduced(to: "USD", broker: broker)
        let rightBill = try! rhs.reduced(to: "USD", broker: broker)
        
        return leftBill == rightBill
    }
}

//MARK: CustomStringConvertible
// Protocolo CustomStringConvertible. Protocolo que retorna la representación textual de la instancia
extension Wad : CustomStringConvertible {
    public var description: String {
        get {
            if billCount == 0 {
                return "Empty"
            } else if billCount == 1 {
                return (_bills.first?.description)!
            } else {
                var total = ""
                for bill in _bills {
                    total = total + " + \(bill)"
                }
                return total
            }
        }
    }
}
