//
//  Broker.swift
//  Money
//
//  Created by Jose Sanchez Rodriguez on 27/4/17.
//  Copyright © 2017 Jose Sanchez Rodriguez. All rights reserved.
//

import Foundation

//MARK: - Enums
// Errors
enum BrokerErrors : Error {
    case unknownRate
}

//MARK: - Typealiases
typealias RatesDictionary = [String : Rate]
typealias Rate = Int    // en el futuro, lo cambiaré a Double

//MARK: - -- Types --
struct UnityBroker : Rater{}


//MARK: - -- Struct Broker --
struct Broker: Rater {
    //MARK: - Properties
    var _rates = RatesDictionary()
    
    //MARK: - Functions
    // Función que crea la clave de ratio de conversión que se añadirá al diccionario de ratios de conversión
    private func _makeKeyForRate(from: Currency, to: Currency) -> String { 
        return "\(from)->\(to)"
    }
    
    // Función que añade los posibles factores de conversión al diccionario de ratios de conversión
    mutating func addRate(from: Currency, to:Currency, rate: Rate)  {
        _rates[_makeKeyForRate(from: from, to: to)] = rate     // directo
        _rates[_makeKeyForRate(from: to, to: from)] = 1 / rate // inverso
        _rates[_makeKeyForRate(from: from, to: from)] = 1	   // trivial
        _rates[_makeKeyForRate(from: to, to: to)] = 1	       // trivial
    }
    
    // Función que retorna el ratio de conversión teniendo en cuenta los parámetros de las currency llegadas por parámetro
    func rate(from: Currency, to: Currency) throws -> Rate {
        guard let rate = _rates[_makeKeyForRate(from: from, to: to)] else {
            throw BrokerErrors.unknownRate
        }
        return rate
    }
}

//MARK: - -- Protocols --
protocol Rater {
    func rate(from: Currency, to: Currency) throws -> Rate
}


//MARK: - -- Extensions --
extension Rater {
    func rate(from: Currency, to: Currency) throws -> Rate {
        return 1
    }
}
