//
//  Videojuego.swift
//  proyectoAPI_Xcode
//
//  Created by Alumno ULSA on 10/05/23.
//

import Foundation

class Videojuego: Decodable {
    var nombre : String
    var genero : String
    var fecha_salida : String
    
    init(nombre: String, genero: String, fecha_salida: String)
    {
        self.nombre = nombre
        self.genero = genero
        self.fecha_salida = fecha_salida
    }
}
