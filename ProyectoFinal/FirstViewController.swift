//
//  FirstViewController.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/13/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var primerView: UIView!
    @IBOutlet weak var lbPrimerView: UILabel!
    @IBOutlet weak var segundoView: UIView!
    @IBOutlet weak var lbSegundoView: UILabel!
    @IBOutlet weak var tercerView: UIView!
    @IBOutlet weak var lbTercerView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        primerView.layer.borderWidth=1.5
        primerView.layer.borderColor=UIColor.green.cgColor
        primerView.layer.cornerRadius=8.0
        segundoView.layer.borderWidth=1.5
        segundoView.layer.borderColor=UIColor.white.cgColor
        segundoView.layer.cornerRadius=8.0
        tercerView.layer.borderWidth=1.5
        tercerView.layer.borderColor=UIColor.green.cgColor
        tercerView.layer.cornerRadius=8.0
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

