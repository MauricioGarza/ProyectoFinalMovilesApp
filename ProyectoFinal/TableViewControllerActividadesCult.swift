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

    var arrDatos : [String] = []
    var arrEventos : [Evento] = []
    var arrEventosFiltrados : [Evento] = []
    
    var Indice : Int!
    var FinalIndice : Int!
    var NombrePabellon : String = ""
    var viewHappened : Bool = false
    var bFiltrar = false
    
    var Handle:DatabaseHandle!
    var FireBaseRef:DatabaseReference!
    
    var fechaFiltrar:Date!
    var edadFiltrar:String!
    var categoFiltrar:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Conecta a la base datos Firebase
            FireBaseRef = Database.database().reference()
        FinalIndice = Indice
        navigationController?.setNavigationBarHidden(true, animated: false)
        if tabBarController?.selectedIndex != nil && NombrePabellon == "" && viewHappened == false && bFiltrar == false {
            butRegresar.setTitle("", for: .normal)
            butRegresar.isEnabled = false
            switch tabBarController?.selectedIndex{
            case 2?:
                arrEventos.removeAll()
                self.tableView.reloadData()
                butTitle.text = "Actividades Culturales"                
                let refActividadesCulturales = self.FireBaseRef?.child("ActividadesCulturales")
                llenarEvento(ref: refActividadesCulturales!)
                butRegresar.isEnabled = true
                butRegresar.isHidden = true
                butFiltrar.isHidden = false
                butFiltrar.isEnabled = true
            case 3?:
                arrDatos.removeAll()
                self.tableView.reloadData()
                butRegresar.isEnabled = false
                butRegresar.isHidden = true
                butFiltrar.isEnabled = false
                butFiltrar.isHidden = true
                butTitle.text = "Pabellones"
                Handle = self.FireBaseRef?.child("Pabellones").observe(.childAdded, with:{(DataSnapshot) in
                if let item = DataSnapshot.key as? String
                    {
                        self.arrDatos.append(item)
                        self.tableView.reloadData()
                    }
                })
                butRegresar.isEnabled = false
                butRegresar.isHidden = true
                viewHappened = true
            default:
                break
            }
        }
        else if NombrePabellon != "" && bFiltrar == false{
            butFiltrar.isHidden = false
            butFiltrar.isEnabled = true
            arrEventos.removeAll()
            self.tableView.reloadData()
            butTitle.text = NombrePabellon
            let refAct = self.FireBaseRef?.child("Pabellones").child(NombrePabellon)
            llenarEvento(ref: refAct!)
        }
        else if bFiltrar == false{
            viewHappened = false
            butFiltrar.setTitle("", for: .normal)
            butFiltrar.isEnabled = false
            butFiltrar.isHidden = true
            butRegresar.isHidden = false
            butRegresar.isEnabled = true
            arrEventos.removeAll()
            self.tableView.reloadData()
            switch FinalIndice{
            case 0?:
                butTitle.text = "Eje Derechos Humanos"
                let refAct = self.FireBaseRef?.child("Ejes").child("DerechosHumanos")
                llenarEvento(ref: refAct!)
                
            case 1?:
                butTitle.text = "Eje Bienestar"
                let refAct = self.FireBaseRef?.child("Ejes").child("Bienestar")
                llenarEvento(ref: refAct!)
            case 2?:
                butTitle.text = "Eje Calidad de Vida"
                let refAct = self.FireBaseRef?.child("Ejes").child("CalidadVida")
                llenarEvento(ref: refAct!)
            case 3?:
                butTitle.text = "Eje Geriantría"
                let refAct = self.FireBaseRef?.child("Ejes").child("Geriatria")
                llenarEvento(ref: refAct!)
            case 4?:
                butTitle.text = "Eje Inclusion Intergeneracional"
                let refAct = self.FireBaseRef?.child("Ejes").child("Inclusion")
                llenarEvento(ref: refAct!)
            case 5?:
                butTitle.text = "Eje Nueva Tecnología"
                let refAct = self.FireBaseRef?.child("Ejes").child("Tecnologia")
                llenarEvento(ref: refAct!)
            default:
                break
            }
        }
        else{
            viewHappened = false
            if arrEventos.isEmpty{
                let evento = Evento(sCategoria: "No hay", sDescripcion: "No hay Actividad con dichos filtro", sExpositor: "NA", sHora: "NA", sLugar: "NA", sNombre: "No hay resultados", sFecha: "Na")
                self.arrEventos.append(evento)
            }
            self.tableView.reloadData()
            bFiltrar = false
        }
        viewHappened = false
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
        self.refreshControl?.endRefreshing()
        if tabBarController?.selectedIndex != nil && arrDatos.count > 0{
            switch tabBarController?.selectedIndex {
            case 3?:
                return arrDatos.count
            case 2?:
                return arrEventos.count
            default:
                break
            }
            
        }
        return arrEventos.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if tabBarController?.selectedIndex != nil && arrDatos.count > 0{
            switch tabBarController?.selectedIndex {
            case 3?:
                cell.textLabel?.text = arrDatos[indexPath.row]
                cell.detailTextLabel?.text = ""
            case 2?:
                cell.textLabel?.text = arrEventos[indexPath.row].sNombre
                cell.detailTextLabel?.text = arrEventos[indexPath.row].sDescripcion
            default:
                break
            }

        }
        else {
            cell.textLabel?.text = self.arrEventos[indexPath.row].sNombre
            cell.detailTextLabel?.text = self.arrEventos[indexPath.row].sDescripcion
        }


        return cell
    }
    
    func llenarEvento(ref:DatabaseReference){
        ref.observeSingleEvent(of: .value, with:{ DataSnapshot in
            for child in DataSnapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String:Any]
                let nom = dict["Nombre"] as! String
                let desc = dict["Descripcion"] as! String
                let cat = dict["Categoria"] as! String
                let Expos = dict["Expositor"] as! String
                let Fecha = dict["Fecha"] as! String
                let Hora = dict["Hora"] as! String
                let lugar = dict["Lugar"] as! String
                let Event = Evento(sCategoria: cat, sDescripcion: desc, sExpositor: Expos, sHora: Hora, sLugar: lugar, sNombre: nom, sFecha: Fecha)
                self.arrEventos.append(Event)
                self.tableView.reloadData()
            }
        })
    }
    
    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            let ident = identifier
            if ident == "infoactividad" && arrDatos.count > 0{
                let indice = tableView.indexPathForSelectedRow
                NombrePabellon = arrDatos[(indice?.row)!]
                arrDatos.removeAll()
                self.tableView.reloadData()
                butTitle.text = NombrePabellon
                let refAct = self.FireBaseRef?.child("Pabellones").child(NombrePabellon)
                llenarEvento(ref: refAct!)
                viewHappened = false
                butRegresar.isEnabled = true
                butRegresar.isHidden = false
                butFiltrar.isHidden = false
                butFiltrar.isEnabled = true
                return false
            }
        return true
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "filtrar" && arrDatos.count == 0{
            let dest = segue.destination as! ViewControllerInfoActividad
            let indice = tableView.indexPathForSelectedRow
            
            dest.titulo = arrEventos[(indice?.row)!].sNombre
            dest.descripcion = arrEventos[(indice?.row)!].sDescripcion
            dest.Fecha = arrEventos[(indice?.row)!].sFecha
            dest.Hora = arrEventos[(indice?.row)!].sHora
            dest.Expositor = arrEventos[(indice?.row)!].sExpositor
            dest.Categoria = arrEventos[(indice?.row)!].sCategoria
            dest.Lugar = arrEventos[(indice?.row)!].sLugar


        }

        
        else{
           let dest = segue.destination as! ViewControllerFiltrar
            dest.arrEventos = arrEventos
            
        }
    }
    
    @IBAction func unwind(unwindSegue:UIStoryboardSegue){
        bFiltrar = true
        print(arrEventos.count)
        self.tableView.reloadData()
    }
    
    
    @IBAction func butRegresar(_ sender: UIButton) {
        if (butTitle.text?.contains("Eje"))!  {
            dismiss(animated: true, completion: nil)
        }
        else{
            butTitle.text = "Pabellones"
            arrEventos.removeAll()
            arrDatos.removeAll()
            self.tableView.reloadData()
            NombrePabellon = ""
            butRegresar.isHidden = true
            butRegresar.isEnabled = false
            butFiltrar.isHidden = true
            butFiltrar.isEnabled = false
            Handle = self.FireBaseRef?.child("Pabellones").observe(.childAdded, with:{(DataSnapshot) in
                if let item = DataSnapshot.key as? String
                {
                    self.arrDatos.append(item)
                    self.tableView.reloadData()
                }
            })
            self.tableView.reloadData()
        }
        
    }
    
    
}

