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
    @IBAction func addToCalendar(_ sender: Any) {
        let eventStore:EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            if(granted) && (error==nil){
                print("granted")
                print("error")
                
                let event:EKEvent=EKEvent(eventStore: eventStore)
                event.title="titulo evento"
                event.startDate=Date()
                event.endDate=Date()
                event.notes="Nota del evento"
                event.calendar=eventStore.defaultCalendarForNewEvents
                do{
                    try eventStore.save(event, span: .thisEvent)
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
