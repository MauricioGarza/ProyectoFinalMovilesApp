//
//  ViewControllerFiltrar.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/15/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class ViewControllerFiltrar: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var pickerEdades: UIPickerView!
    @IBOutlet var pickerCategorias: UIPickerView!
    
    @IBOutlet weak var butFiltrar: UIButton!
    let Edades : [String] = ["Joven","Adulto","Mayor"]
    let Categorias : [String] = ["Folklore","Artes Plasticas y Escenicas","Deporte","Turismo","Acondicionamiento"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        butFiltrar.layer.cornerRadius=8
        pickerEdades.dataSource = self
        pickerEdades.delegate = self
        pickerCategorias.dataSource = self
        pickerCategorias.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerEdades {
            return Edades.count
        }
        else if pickerView == pickerCategorias{
            return Categorias.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerEdades{
            return Edades[row]
        }
        else if pickerView == pickerCategorias{
            return Categorias[row]
        }
        return ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkButon(_ sender: UIButton) {
        if sender.imageView?.image == #imageLiteral(resourceName: "unchecked"){
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        else{
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
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
