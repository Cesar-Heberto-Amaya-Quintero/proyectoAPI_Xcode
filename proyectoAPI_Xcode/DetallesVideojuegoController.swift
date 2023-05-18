//
//  DetallesVideojuegoController.swift
//  proyectoAPI_Xcode
//
//  Created by Alumno ULSA on 10/05/23.
//

import Foundation
import UIKit

class DetallesVideojuegoController: UIViewController{
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblJugadores: UILabel!
    @IBOutlet weak var lblPersonajes: UILabel!
    @IBOutlet weak var lblConsolas: UILabel!
    
    
    var videojuego : Videojuego?
    
    override func viewDidLoad() {
        if videojuego != nil {
            lblNombre.text = videojuego!.nombre
            lblGenero.text = videojuego!.genero
            lblFecha.text = videojuego!.fecha_salida
            lblDescripcion.text = videojuego!.descripcion
            lblJugadores.text = videojuego!.jugadores
            lblPersonajes.text = videojuego!.personajes
            lblConsolas.text = videojuego!.consolas
            
            let urlImagen = URL(string: "http://localhost:8000/storage/imagenes/" + videojuego!.imagen)!
            var solicitud = URLRequest(url: urlImagen)
                            
            solicitud.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: solicitud) {
                                data, response, error in
                                if let data = data {
                                    self.img.image = UIImage(data: data)
                                }
                            }
            task.resume()
            
        }
    }
    
}
