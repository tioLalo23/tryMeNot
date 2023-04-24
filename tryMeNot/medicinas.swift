//
//  medicinas.swift
//  tryMeNot
//
//  Created by CEDAM02 on 24/04/23.
//

import Foundation

class Medicina{
    var nombre: String
    var dosis: String
    var horario: Date
    
    init(nombre: String, dosis: String, horario: Date) {
        self.nombre = nombre
        self.dosis = dosis
        self.horario = horario
    }
}

class Toma{
    var medicina: String
    var horario: Date
    
    init(medicina: String, horario: Date) {
        self.medicina = medicina
        self.horario = horario
    }
}


