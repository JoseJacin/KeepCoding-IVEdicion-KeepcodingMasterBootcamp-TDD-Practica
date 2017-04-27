//
//  Bill.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

//MARK: - Typealiases
typealias Currency = String

//MARK: - -- Struct Bill --
struct Bill {
    //MARK: - Properties
    let _amount : Int
    let _currency : Currency
    
    //MARK: - Initialization
    init(amount: Int, currency: Currency = "EUR") {
        _amount = amount
        _currency = currency
    }
    
    //Initialization
    init() {
        _amount = 0
        _currency = "EUR"
    }
}

//MARK: - -- Extensions --
extension Bill {
    //MARK: Functions
    // Función que multiplica amount por el número pasado por parámetro
    func times(_ n: Int) -> Bill {
        return Bill(amount: _amount * n)
    }
    
    // Función que permite la suma de dos objetos Bill
    func plus(_ add: Bill) -> Bill {
        return Bill(amount: _amount + add._amount)
    }
    
    // Función que realiza la conversión aplicando el factor de corrección recuperado de Broker
    func reduced(to: Currency, broker: Broker) throws ->Bill{
        let rate = try! broker.rate(from: _currency, to: to)
        return Bill(amount: _amount * rate , currency: to)
    }
}



// Según lo que se indica, "todo objeto que implementa Equatable debe de implementar Hashable".
// Nota Personal: Según lo indicado por los profes de Keepcoding, implementar Hashable cuando se implementa Equatable es lo que se llama "implementación de un protocolo informal", es decir, es algo que "sabes" que debes hacer, pero ni el compilador ni nadie te impide no hacerlo

//MARK: - -- Protocols --
//MARK: Equatable
// Protocolo Equatable. Protocolo que compara _amount de dos objetos Bill retorna si son iguales.
extension Bill : Equatable {
    public static func == (lhs: Bill, rhs: Bill) -> Bool {
        return lhs._amount == rhs._amount
    }
}

//MARK: Hashable
// Protocolo Hashable. Protocolo que retorna el hashValue de _amount del objeto Bill
extension Bill : Hashable {
    public var hashValue: Int {
        get {
            return _amount.hashValue
        }
    }
}
