//
//  TableViewControllerActividadesCult.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/13/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class TableViewControllerActividadesCult: UITableViewController {
    @IBOutlet weak var butRegresar: UIButton!
    @IBOutlet weak var butFiltrar: UIButton!
    @IBOutlet weak var butTitle: UILabel!
    
    let arrActividades : [String] = ["Actividad 1","Actividad 2", "Actividad 3", "Actividad 4", "Actividad 5"]
    let arrPabellones : [String] = ["Pabellon 1", "Pabellon 2", "Pabellon 3", "Pabellon 4", "Pabellon 5", "Pabellon 6"]
    let arrDerHumanos : [String] = ["Humano 1", "Humano 2", "Humano 3", "Humano 4"]
    let caliddadVida : [String] = ["Cal1", "Cal2", "Cal3", "Cal4", "Cal5","Cal6"]
    let geriatria : [String] = ["G1","G2"]
    let inclusion : [String] = ["Inc1","Inc2","Norby","Norby2"]
    let tec : [String] = ["Tec1","Tec2","Tec3","Tec4","Tec5","Tec21","Tec22"]
    let bienestar : [String] = ["Bien1","Bien2","Bien3","Bien4","Bien5","6","7","8"]
    
    var Indice : Int!
    var FinalIndice : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FinalIndice = Indice
        navigationController?.setNavigationBarHidden(true, animated: false)
        if tabBarController?.selectedIndex != nil {
            butRegresar.setTitle("", for: .normal)
            butRegresar.isEnabled = false
            switch tabBarController?.selectedIndex{
            case 2?:
                butTitle.text = "Actividades Culturales"
            case 3?:
            butTitle.text = "Pabellones"
            default:
                break
            }
        }
        else{
            butFiltrar.setTitle("", for: .normal)
            butFiltrar.isEnabled = false
            switch FinalIndice{
            case 0:
                butTitle.text = "Actividades Eje Derechos Humanos"
            case 1:
                butTitle.text = "Actividades Eje Bienestar"
            case 2:
                butTitle.text = "Actividades Eje Calidad de Vida"
            case 3:
                butTitle.text = "Actividades Eje Geriantría"
            case 4:
                butTitle.text = "Actividades Eje Inclusion Intergeneracional"
            case 5:
                butTitle.text = "Actividades Eje Nueva Tecnología"
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tabBarController?.selectedIndex != nil{
            switch tabBarController?.selectedIndex {
            case 3?:
                return arrPabellones.count
            case 2?:
                return arrActividades.count
            default:
                break
            }
            
        }
        else {
            switch FinalIndice{
            case 0:
                return arrDerHumanos.count
            case 1:
                return bienestar.count
            case 2:
                return caliddadVida.count
            case 3:
                return geriatria.count
            case 4:
                return inclusion.count
            case 5:
                return tec.count
            default:
                break
            }
        }
        return 0

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if tabBarController?.selectedIndex != nil{
            switch tabBarController?.selectedIndex {
            case 3?:
                cell.textLabel?.text = arrPabellones[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion breve pabellon"
            case 2?:
                cell.textLabel?.text = arrActividades[indexPath.row]
                cell.detailTextLabel?.text = "Descripción breve actividad"
            default:
                break
            }

        }
        else {
            switch FinalIndice{
            case 0:
                cell.textLabel?.text = self.arrDerHumanos[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion act derechos humanos"
            case 1:
                cell.textLabel?.text = bienestar[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion act bienestar"
            case 2:
                cell.textLabel?.text = caliddadVida[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion actividades calidad vida"
            case 3:
                cell.textLabel?.text = geriatria[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion actividades eje geriantria"
            case 4:
                cell.textLabel?.text = inclusion[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion de actividades eje    inclusion"
            case 5:
                cell.textLabel?.text = tec[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion actividades eje tecnologias"
            default:
                print("Norby me la pela")
            }
        }


        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "filtrar"{
            let dest = segue.destination as! ViewControllerInfoActividad
            let indice = tableView.indexPathForSelectedRow
            if tabBarController?.selectedIndex != nil{
                switch tabBarController?.selectedIndex {
                case 3?:
                    dest.titulo = arrPabellones[(indice?.row)!]
                    dest.descripcion = "Descripcion de los pabellones"
                case 2?:
                    dest.titulo = arrActividades[(indice?.row)!]
                    dest.descripcion = "Descripcion de actividades culturales"
                default:
                    break
                }
                
            }
            else {
                switch FinalIndice{
                case 0:
                    dest.titulo = arrDerHumanos[(indice?.row)!]
                    dest.descripcion = "Descripcion act derechos humanos"
                case 1:
                    dest.titulo =  bienestar[(indice?.row)!]
                    dest.descripcion = "Descripcion act bienestar"
                case 2:
                    dest.titulo = caliddadVida[(indice?.row)!]
                    dest.descripcion = "Descripcion actividades calidad vida"
                case 3:
                    dest.titulo = geriatria[(indice?.row)!]
                    dest.descripcion = "Descripcion actividades eje geriantria"
                case 4:
                    dest.titulo = inclusion[(indice?.row)!]
                    dest.descripcion = "Descripcion de actividades eje    inclusion"
                case 5:
                    dest.titulo = tec[(indice?.row)!]
                    dest.descripcion = "Descripcion actividades eje tecnologias"
                default:
                    break
                }
            }
        }
        else{
           _ = segue.destination as! ViewControllerFiltrar
        }
    }
    

    
    @IBAction func butRegresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

