//
//  Euro.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

// Estructura Euro
struct Euro {
    //MARK: - Properties
    let _amount : Int
    
    //MARK: - Initialization
    init(amount: Int) {
        _amount = amount
    }
    
    //Inicializador 
    init() {
        _amount = 0
    }
    
    //MARK: - Functions
    // Función que multiplica amount por el número pasado por parámetro
    func times(_ n: Int) -> Euro {
        return Euro(amount: _amount * n)
    }
}

//MARK: - Extensions
// Según lo que se indica, "todo objeto que implementa Equatable debe de implementar Hashable".
// Nota Personal: Según lo indicado por los profes de Keepcoding, implementar Hashable cuando se implementa Equatable es lo que se llama "implementación de un protocolo informal", es decir, es algo que "sabes" que debes hacer, pero ni el compilador ni nadie te impide no hacerlo

// Protocolo Equatable. Protocolo que compara _amount de dos objetos Euro retorna si son iguales.
extension Euro : Equatable{
    public static func ==(lhs: Euro, rhs: Euro) -> Bool{
        return lhs._amount == rhs._amount
    }
}

// Protocolo Hashable. Protocolo que retorna el hashValue de _amount del objeto Euro
extension Euro : Hashable{
    public var hashValue: Int{
        get{
            return _amount.hashValue
        }
    }
}




