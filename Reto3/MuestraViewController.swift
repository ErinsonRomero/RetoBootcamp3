//
//  MuestraViewController.swift
//  Reto3
//
//  Created by Erinson Andres Romero Terry on 3/12/22.
//

import UIKit
protocol MuestraDelegate {
    func eliminarDato(_ dato: MuestraViewController, datoEliminar: Int?)
}

class MuestraViewController: UIViewController {
    var delegate: MuestraDelegate?
    var pos: Int?
    var titulo: String?
    var descrip: String?
    
    @IBOutlet weak var tituloShowLabel: UILabel!
    
    @IBOutlet weak var descriptionShowLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tituloShowLabel.text = titulo
        descriptionShowLabel.text = descrip
    }
    

    @IBAction func deleteButton(_ sender: Any) {
        delegate?.eliminarDato(self, datoEliminar: pos)
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

