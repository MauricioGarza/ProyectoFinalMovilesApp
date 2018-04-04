//
//  ViewControllerInfoActividad.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/15/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class ViewControllerInfoActividad: UIViewController {

    @IBOutlet weak var descActividad: UILabel!
    @IBOutlet weak var labTitulo: UILabel!
    
    var titulo : String!
    var descripcion : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        descActividad.text = descripcion
        labTitulo.text = titulo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func butRegresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
