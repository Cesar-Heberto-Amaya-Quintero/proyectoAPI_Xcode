//
//  ViewController.swift
//  proyectoAPI_Xcode
//
//  Created by Alumno ULSA on 10/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvVideojuegos: UITableView!
    var videojuegos : [Videojuego] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videojuegos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaVideojuego") as! CeldaVideojuegoController
        
        celda.lblNombre.text = videojuegos[indexPath.row].nombre
        celda.lblGenero.text = videojuegos[indexPath.row].genero
        celda.lblFecha.text = videojuegos[indexPath.row].fecha_salida
        let urlImagen = URL(string: "http://localhost:8000/storage/imagenes/" + videojuegos[indexPath.row].imagen)!
        var solicitud = URLRequest(url: urlImagen)
                        
        solicitud.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: solicitud) {
                            data, response, error in
                            if let data = data {
                                celda.img.image = UIImage(data: data)
                            }
                        }
        task.resume()
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destino = segue.destination as! DetallesVideojuegoController
            destino.videojuego = videojuegos[tvVideojuegos.indexPathForSelectedRow!.row]
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://localhost:8000/api/apivideojuegos")!
        var solicitud = URLRequest(url: url)
        solicitud.setValue("application/json", forHTTPHeaderField: "Content-Type")
        solicitud.setValue("application/json", forHTTPHeaderField: "Accept")
        solicitud.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: solicitud) {
            data, response, error in
            if let data = data {
                if let videojuegos = try? JSONDecoder().decode([Videojuego].self, from: data) {
                    self.videojuegos = videojuegos
                    DispatchQueue.global(qos: .background).async {
                        DispatchQueue.main.async{
                            self.tvVideojuegos.reloadData()
                        }
                    }
                    
                }
            }
        }
        task.resume()
    }
    

    

}

