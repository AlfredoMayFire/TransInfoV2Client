//
//  NewDataEntryTableViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit

class NewDataEntryTableViewController: UITableViewController {
    var dictionary: [String:String] = [
        "tipoVehiculo" :"",
        "ocupantes" :"",
        "numDeTablilla" :"",
        "jurisdiccion": "",
        "estado" :"",
        "vin" :"",
        "year" :"",
        "marca": "",
        "model" :"",
        "marbete" :"",
        "aseguradora" :"",
        "fechaCompra": "",
        "fechaExpiracion": "",
        "isUpdate": "no"]
    var objectNum = 1
    
    override func viewDidLoad() {
        //print(objectNum)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoVehiculo"
        {
            if let detailsVC = segue.destinationViewController as? NewVehicleController{
            detailsVC.objectNum = self.objectNum
            }
        }
    }

}
