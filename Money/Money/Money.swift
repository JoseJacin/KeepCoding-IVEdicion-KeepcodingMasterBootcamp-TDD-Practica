//
//  Money.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

protocol Money {
    //MARK: - Initialization
    init(amount: Int, currency: Currency)
    
    //MARK: - Functions
    // Protocolo que multiplica amount por el número pasado por parámetro
    func times(_ n:Int) -> Self
    
    // Protocolo que permite la suma de dos objetos Bill
    func plus(_ add: Self) -> Self
    
    // Protocolo que realiza la conversión aplicando el factor de corrección recuperado de Broker
    func reduced(to: Currency, broker: Broker) throws -> Self
}
