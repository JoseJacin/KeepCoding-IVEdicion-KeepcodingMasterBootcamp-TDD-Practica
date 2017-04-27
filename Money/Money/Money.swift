//
//  Money.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

//MARK: -- Struct Money --
struct Money {
    //MARK: - Properties
    let _amount : Int
    
    //MARK: - Initialization
    init(amount: Int) {
        _amount = amount
    }
    
    //Initialization
    init() {
        _amount = 0
    }
}

//MARK: - -- Extensions --
extension Money {
    //MARK: Functions
    // Función que multiplica amount por el número pasado por parámetro
    func times(_ n: Int) -> Money {
        return Money(amount: _amount * n)
    }
    
    // Protocolo plus. Protocolo que permite la suma de dos objetos Money
    func plus(_ add: Money) -> Money {
        return Money(amount: _amount + add._amount)
    }
}



// Según lo que se indica, "todo objeto que implementa Equatable debe de implementar Hashable".
// Nota Personal: Según lo indicado por los profes de Keepcoding, implementar Hashable cuando se implementa Equatable es lo que se llama "implementación de un protocolo informal", es decir, es algo que "sabes" que debes hacer, pero ni el compilador ni nadie te impide no hacerlo

//MARK: - -- Protocols --
//MARK: Equatable
// Protocolo Equatable. Protocolo que compara _amount de dos objetos Money retorna si son iguales.
extension Money : Equatable {
    public static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs._amount == rhs._amount
    }
}

//MARK: Hashable
// Protocolo Hashable. Protocolo que retorna el hashValue de _amount del objeto Money
extension Money : Hashable {
    public var hashValue: Int {
        get {
            return _amount.hashValue
        }
    }
}
