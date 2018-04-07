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
    override func viewDidLoad() {
        super.viewDidLoad()
        primerView.layer.borderWidth=1.5
        primerView.layer.borderColor=UIColor.init(red: 37.0, green: 141.0, blue: 254.0, alpha: 1.0).cgColor
        primerView.layer.cornerRadius=8.0
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

