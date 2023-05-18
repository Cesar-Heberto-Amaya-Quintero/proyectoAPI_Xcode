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
    var imagen : String
    var descripcion : String
    var jugadores : String
    var personajes : String
    var consolas : String

    init(nombre: String, genero: String, fecha_salida: String, imagen: String, descripcion: String, jugadores: String, personajes: String, consolas: String)
    {
        self.nombre = nombre
        self.genero = genero
        self.fecha_salida = fecha_salida
        self.imagen = imagen
        self.descripcion = descripcion
        self.jugadores = jugadores
        self.personajes = personajes
        self.consolas = consolas
        
    }
}
