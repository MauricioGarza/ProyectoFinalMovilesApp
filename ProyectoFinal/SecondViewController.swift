//
//  SecondViewController.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/13/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var butDerechosHumanos: UIButton!
    @IBOutlet weak var butBienestar: UIButton!
    @IBOutlet weak var butCalidad: UIButton!
    @IBOutlet weak var butGeriantria: UIButton!
    @IBOutlet weak var butInclusion: UIButton!
    @IBOutlet weak var butNewTecnologia: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Dest = segue.destination as! TableViewControllerActividadesCult
        
        switch sender as! UIButton {
        case butDerechosHumanos:
            Dest.Indice = 0
        case butBienestar:
            Dest.Indice = 1
        case butCalidad:
            Dest.Indice = 2
        case butGeriantria:
            Dest.Indice = 3
        case butInclusion:
            Dest.Indice = 4
        case butNewTecnologia:
            Dest.Indice = 5
        default:
            break
    }
        
    }
    

}

