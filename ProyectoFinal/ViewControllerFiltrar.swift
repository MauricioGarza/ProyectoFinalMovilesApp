//
//  ViewControllerFiltrar.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/15/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class ViewControllerFiltrar: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var btFecha: UIButton!
    @IBOutlet weak var btEdad: UIButton!
    @IBOutlet weak var btCategoria: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var pickerEdades: UIPickerView!
    @IBOutlet var pickerCategorias: UIPickerView!
    
    @IBOutlet weak var butFiltrar: UIButton!
    let Edades : [String] = ["Joven","Adulto","Mayor"]
    let Categorias : [String] = ["Folklore","Artes Plasticas y Escenicas","Deporte","Turismo","Acondicionamiento"]
    
    var edadEscogida:String!
    var categoEscogida:String!
    
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag==0{
            edadEscogida=Edades[row]
        }else {
            categoEscogida=Categorias[row]
        }
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
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDestino=segue.destination as! TableViewControllerActividadesCult
        let dateFormater=DateFormatter()
        dateFormater.dateFormat="YYYY-MM-dd"
        if btFecha.imageView?.image==#imageLiteral(resourceName: "checked"){
            vistaDestino.fechaFiltrar=datePicker.date
        }
        if btEdad.imageView?.image==#imageLiteral(resourceName: "checked"){
            vistaDestino.edadFiltrar=edadEscogida
        }
        if btCategoria.imageView?.image==#imageLiteral(resourceName: "checked"){
            vistaDestino.categoFiltrar=categoEscogida
        }
        
     }
    
    
    @IBAction func butRegresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
