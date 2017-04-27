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
