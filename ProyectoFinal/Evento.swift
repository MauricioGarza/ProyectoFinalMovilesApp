//
//  Evento.swift
//  ProyectoFinal
//
//  Created by Mauricio Garza on 4/7/18.
//  Copyright © 2018 Mauricio Garza. All rights reserved.
//

import UIKit

class Evento: NSObject {

    var sCategoria:String = ""
    var sDescripcion:String = ""
    var sExpositor:String = ""
    var sHora:String = ""
    var sLugar:String = ""
    var sNombre:String = ""
    var sFecha:String = ""
    
    init(sCategoria : String, sDescripcion : String, sExpositor : String, sHora : String, sLugar : String, sNombre:String, sFecha:String) {
        self.sCategoria = sCategoria
        self.sDescripcion = sDescripcion
        self.sExpositor = sExpositor
        self.sHora = sHora
        self.sLugar = sLugar
        self.sNombre = sNombre
        self.sFecha = sFecha
    }
    

}
