//
//  ViewControllerInfoActividad.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 3/15/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit
import EventKit

class ViewControllerInfoActividad: UIViewController {

    @IBOutlet weak var descActividad: UILabel!
    @IBOutlet weak var labTitulo: UILabel!
    @IBOutlet weak var labExpositor: UILabel!
    @IBOutlet weak var labFecha: UILabel!
    @IBOutlet weak var labHora: UILabel!
    @IBOutlet weak var labLugar: UILabel!
    @IBOutlet weak var labCategoría: UILabel!
    @IBOutlet weak var btAgregarCalendario: UIButton!
    
    var titulo : String!
    var descripcion : String!
    var Expositor : String!
    var Hora : String!
    var Lugar : String!
    var Categoria : String!
    var Fecha : String!
    var eventoAgregado:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btAgregarCalendario.layer.cornerRadius=8
        descActividad.text = descripcion
        labTitulo.text = titulo
        labExpositor.text = Expositor
        labHora.text = Hora
        //self.Hora=Hora.replacingOccurrences(of: "-", with: ":")
        labFecha.text = Fecha
        //self.Fecha=Fecha.replacingOccurrences(of: "-", with: ":")
        labLugar.text = Lugar
        labCategoría.text = Categoria
        self.Fecha=Fecha+" "+Hora
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
    @IBAction func addToCalendar(_ sender: Any) {
        let eventStore:EKEventStore = EKEventStore()
        var dateComponent=DateComponents()
        dateComponent.hour=1
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            if(granted) && (error==nil){
                print("granted")
                print("error")
                
                let event:EKEvent=EKEvent(eventStore: eventStore)
                event.title="Conferencia: "+self.titulo
                let dateFormatter=DateFormatter()
                dateFormatter.dateFormat="YYYY.MM.dd kk:mm"
                let fechaEvent=dateFormatter.date(from: self.Fecha)
                //print("fehca evento \(fechaEvent)")
                event.startDate=fechaEvent
                event.endDate=Calendar.current.date(byAdding: dateComponent, to: fechaEvent!)
                event.notes="Lugar: "+self.Lugar
                
                event.calendar=eventStore.defaultCalendarForNewEvents
                do{
                    try eventStore.save(event, span: .thisEvent)
                    let alerta=UIAlertController(title: "Agregado a su Calendario", message: "Evento agregado con èxito", preferredStyle: UIAlertControllerStyle.alert)
                    alerta.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                    
                } catch let error as NSError{
                    print(error)
                }
                print("Save Event")
                
                
            } else{
                print("error")
            }
            
        }
    }
    
    
}
