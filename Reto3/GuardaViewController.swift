//
//  ViewController.swift
//  Reto3
//
//  Created by Erinson Andres Romero Terry on 3/12/22.
//

import UIKit
protocol DatoDelegate {
    func darDato(_ dato: GuardaViewController, datoTitulo: String, datoDescripcion: String)
}
class GuardaViewController: UIViewController {

    @IBOutlet weak var tituloAñadirLabel: UITextField!
    @IBOutlet weak var descripcionAñadirLabel: UITextField!
    var delegate: DatoDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func aceptarPressedButton(_ sender: UIButton) {
        if let text1 = tituloAñadirLabel.text {
            if let text2 = descripcionAñadirLabel.text {
                delegate?.darDato(self, datoTitulo: text1, datoDescripcion: text2)
                dismiss(animated: true)
            }
        }
            
            
            
            
    }
        
}
    


