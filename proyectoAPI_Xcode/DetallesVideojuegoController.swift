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
    
    
    var videojuego : Videojuego?
    
    override func viewDidLoad() {
        if videojuego != nil {
            lblNombre.text = videojuego!.nombre
            lblGenero.text = videojuego!.genero
            lblFecha.text = videojuego!.fecha_salida
        }
    }
    
}
