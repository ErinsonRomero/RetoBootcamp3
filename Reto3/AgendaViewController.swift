//
//  MuestraViewController.swift
//  Reto3
//
//  Created by Erinson Andres Romero Terry on 3/12/22.
//

import UIKit

class AgendaViewController: UIViewController {
    var listaTitulo: [String] = []
    var listaDescripcion: [String] = []
    var posicion = 0
    @IBOutlet weak var AgendaTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AgendaTableView.delegate = self
        AgendaTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func agendaToAddButton(_ sender: Any) {
        performSegue(withIdentifier: "JumpToAdd", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "JumpToAdd" {
            let destinationVC = segue.destination as! GuardaViewController
            destinationVC.delegate = self
        }
        if segue.identifier == "agendaToShow" {
            let destination = segue.destination as! MuestraViewController
            destination.pos = sender as? Int
            let textos = sender as? Int
            destination.titulo = listaTitulo[textos!]
            destination.descrip = listaDescripcion[textos!]
            destination.delegate = self
            
        }
    }
}

extension AgendaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaTitulo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = AgendaTableView.dequeueReusableCell(withIdentifier: "AgendaTableViewCell2", for: indexPath) as! AgendaTableViewCell
        celda.tituloAgendaLabel.text = listaTitulo[indexPath.row]
        celda.descripcionAgendaLabel.text = listaDescripcion[indexPath.row]
        return celda
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let possicion = indexPath.row
        performSegue(withIdentifier: "agendaToShow", sender: possicion)
        
    }
    
    
}


extension AgendaViewController: DatoDelegate {
    func darDato(_ dato: GuardaViewController, datoTitulo: String, datoDescripcion: String) {
        listaTitulo.append(datoTitulo)
        listaDescripcion.append(datoDescripcion)
        AgendaTableView.reloadData()
    }
    
    
}

extension AgendaViewController:  MuestraDelegate{
    func eliminarDato(_ dato: MuestraViewController, datoEliminar: Int?) {
        if let pos = datoEliminar {
            listaTitulo.remove(at: pos)
            listaDescripcion.remove(at: pos)
            AgendaTableView.reloadData()
        }
        
    }
}
