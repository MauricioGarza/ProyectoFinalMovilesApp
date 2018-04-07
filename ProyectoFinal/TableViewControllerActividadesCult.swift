//
//  TableViewControllerActividadesCult.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/13/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit
import Firebase

class TableViewControllerActividadesCult: UITableViewController {
    @IBOutlet weak var butRegresar: UIButton!
    @IBOutlet weak var butFiltrar: UIButton!
    @IBOutlet weak var butTitle: UILabel!

    var arrActividadesCulturales : [String] = []
    var arrActDerHumanos : [String] = []
    var arrDerHumanos : [String] = []
    var arrCalidadVida : [String] = []
    var arrActGeriatria : [String] = []
    var arrActInclusion : [String] = []
    var arrActTecnologia : [String] = []
    var arrActBienestar : [String] = []
    
    var Indice : Int!
    var FinalIndice : Int!
    
    var Handle:DatabaseHandle?
    var FireBaseRef:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Conecta a la base datos Firebase
            FireBaseRef = Database.database().reference()
        FinalIndice = Indice
        navigationController?.setNavigationBarHidden(true, animated: false)
        if tabBarController?.selectedIndex != nil {
            butRegresar.setTitle("", for: .normal)
            butRegresar.isEnabled = false
            switch tabBarController?.selectedIndex{
            case 2?:
                butTitle.text = "Actividades Culturales"
                Handle = FireBaseRef?.observe(.childAdded, with:{(DataSnapshot) in
                    if let item = DataSnapshot.value as? String
                    {
                        self.arrActividadesCulturales.append(item)
                        self.tableView.reloadData()
                    }
                })
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
                butTitle.text = "Actividades Eje arrActBienestar"
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
                return arrActDerHumanos.count
            case 2?:
                return arrActividadesCulturales.count
            default:
                break
            }
            
        }
        else {
            switch FinalIndice{
            case 0:
                return arrDerHumanos.count
            case 1:
                return arrActBienestar.count
            case 2:
                return arrCalidadVida.count
            case 3:
                return arrActGeriatria.count
            case 4:
                return arrActInclusion.count
            case 5:
                return arrActTecnologia.count
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
                cell.textLabel?.text = arrActDerHumanos[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion breve pabellon"
            case 2?:
                cell.textLabel?.text = arrActividadesCulturales[indexPath.row]
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
                cell.textLabel?.text = arrActBienestar[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion act arrActBienestar"
            case 2:
                cell.textLabel?.text = arrCalidadVida[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion actividades calidad vida"
            case 3:
                cell.textLabel?.text = arrActGeriatria[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion actividades eje geriantria"
            case 4:
                cell.textLabel?.text = arrActInclusion[indexPath.row]
                cell.detailTextLabel?.text = "Descripcion de actividades eje    inclusion"
            case 5:
                cell.textLabel?.text = arrActTecnologia[indexPath.row]
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
                    dest.titulo = arrActDerHumanos[(indice?.row)!]
                    dest.descripcion = "Descripcion de los pabellones"
                case 2?:
                    dest.titulo = arrActividadesCulturales[(indice?.row)!]
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
                    dest.titulo =  arrActBienestar[(indice?.row)!]
                    dest.descripcion = "Descripcion act arrActBienestar"
                case 2:
                    dest.titulo = arrCalidadVida[(indice?.row)!]
                    dest.descripcion = "Descripcion actividades calidad vida"
                case 3:
                    dest.titulo = arrActGeriatria[(indice?.row)!]
                    dest.descripcion = "Descripcion actividades eje geriantria"
                case 4:
                    dest.titulo = arrActInclusion[(indice?.row)!]
                    dest.descripcion = "Descripcion de actividades eje    inclusion"
                case 5:
                    dest.titulo = arrActTecnologia[(indice?.row)!]
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

