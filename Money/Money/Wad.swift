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
}

//MARK: - -- Extensions --
extension Wad : Money {
    //MARK: - Initialization
    init(amount: Int, currency: Currency) {
    
    }
    
    //MARK: - Functions
    // Función que multiplica amount por el número pasado por parámetro
    func times(_ n:Int) -> Wad {
        return self
    }
    
    // Función que permite la suma de dos objetos Bill
    func plus(_ addend: Wad) -> Wad {
        return self
    }
    
    // Función que retorna el ratio de conversión teniendo en cuenta los parámetros de las currency llegadas por parámetro
    func reduced(to: Currency, broker: Broker) throws -> Wad {
        return self
    }
}
