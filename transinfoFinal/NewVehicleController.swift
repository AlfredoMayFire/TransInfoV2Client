//
//  NewVehicleController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class NewVehicleController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var typeVehicleField: SwiftDropDownList!
    @IBOutlet weak var jurisdictionVehicleField: SwiftDropDownList!
    
    @IBOutlet weak var ocupantesField: UITextField!
    @IBOutlet weak var numeroDeTablilla: UITextField!
    @IBOutlet weak var estadoField: UITextField!
    @IBOutlet weak var VINField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var marcaField: UITextField!
    @IBOutlet weak var modeloField: UITextField!
    @IBOutlet weak var numeroDeMarbete: UITextField!
    @IBOutlet weak var aseguradoraField: UITextField!
    
    @IBOutlet weak var fechaCompraField: UITextField!
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var fechaExpiracionField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var search: UITextField!
    
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
        "isUpdate": "no"
        ]
    var dictionaryQuery = [String:AnyObject] ()
    var content = String()
    var finalContent = [String:String] ()
    var vehicle: AnyObject?
    var dictionaries: Dictionary<String,AnyObject> = ["vacio":"empty"]

    var objectNum = Int()
    var isUpdating = false

    var myArray = Array<AnyObject> ()
    
    @IBAction func fechaCompraField(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewVehicleController.datePickerValueChanged1), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    @IBAction func fechaExpiracionField(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewVehicleController.datePickerValueChanged2), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    
    func datePickerValueChanged1(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        fechaCompraField.text = dateFormatter.stringFromDate(sender.date)

    }
    func datePickerValueChanged2(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        fechaExpiracionField.text = dateFormatter.stringFromDate(sender.date)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       //
        //ws
        //lena todos los espacios hay un error
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cellIdentifier")
        

        
        
        let webServicesObject = WebService.init()
        webServicesObject.initiate(5)
        
        
        typeVehicleField.isKeyboardHidden = true
        typeVehicleField.isDismissWhenSelected = true
        typeVehicleField.isArrayWithObject = true
        typeVehicleField.keyPath = "DescriptionES"
        typeVehicleField.arrayList = webServicesObject.arrayOfDictionaries("vehicleTypes")
        
        jurisdictionVehicleField.isKeyboardHidden = true
        jurisdictionVehicleField.isDismissWhenSelected = true
        jurisdictionVehicleField.isArrayWithObject = true
        jurisdictionVehicleField.keyPath = "DescriptionES"
        jurisdictionVehicleField.arrayList = webServicesObject.arrayOfDictionaries("vehicleJurisdictions")
        print(webServicesObject.arrayOfDictionaries("ListVehicleByPlateNumber"))
        
        // Do any additional setup after loading the view, typically from a nib.
        scrollVIew.contentSize.height = 1000
        //Cargar Automaticamente Fecha
        fechaCompraField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        fechaExpiracionField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)        
        typeVehicleField.text = dictionary["tipoVehiculo"]
        //ocupantesField.text = dictionary["ocupantes"]
        numeroDeTablilla.text = dictionary["numDeTablilla"]
        jurisdictionVehicleField.text = dictionary["jurisdiccion"]
        estadoField.text =  dictionary["estado"]
        VINField.text = dictionary["vin"]
        yearField.text = dictionary["year"]
        marcaField.text = dictionary["marca"]
        modeloField.text =  dictionary["model"]
        numeroDeMarbete.text = dictionary["marbete"]
        aseguradoraField.text =  dictionary["aseguradora"]
        fechaCompraField.text = dictionary["fechaCompra"]
        fechaExpiracionField.text = dictionary["fechaExpiracion"]
        
        
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "PageFour")
//        
//        do {
//            
//            
//            let results = try context.executeFetchRequest(request)
//            
//            
//            
//            if objectNum == 0 {
//                objectNum = results.count + 1
//            }
//            if (objectNum == 0 && results.count == 1){
//                objectNum = results.count + 1
//            }//error aqui
//          //  print("This here is the objectNum being used: ",objectNum)
//    
//            
//            
//            //print("Here is objectNum again",objectNum)
//            
//           // print("Here is result count",results.count)
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    
////                    if (result.valueForKey("objectNum") as? Int == 0){
////                        context.deleteObject(result)
////                        do{
////                            try context.save()
////                            print("did it")
////                        }catch{
////                            print("couldn't do it")
////                        }
////
////                        
////                    }
//                    
////                    print("Here is the object IDs",result.valueForKey("objectNum"))
//                     if let idHolder = objectNum as? Int{
//                        if idHolder == result.valueForKey("objectNum") as? Int{
//                            
//                            print("is updating")
//                            isUpdating = true
//                        }
//                    }
//                    
////                    print("here is core data objectNum",result.valueForKey("objectNum") as? Int)
//                    //                    if result.valueForKey("objectNum") as? Int == objectNum {
//                    //                        updatingTrue = true
//                    //                        print("yes")
//                    //                    }
//                    
//                    
//                }
//            }
//        }catch{
//            print("Error")
//        }
//        
//        
        search.text = "123"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func viewDidAppear(animated: Bool) {
    }
    
    @IBAction func guardar(sender: AnyObject) {
            }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let newData = NSEntityDescription.insertNewObjectForEntityForName("PageFour", inManagedObjectContext: context)
//        
//        
//        if isUpdating {
//         
//            do {
//                let request = NSFetchRequest(entityName: "PageFour")
//                
//                //request.predicate = NSPredicate(format: "objectNum = %@", "objectNum")
//                
//                let results = try context.executeFetchRequest(request)
//                
//                
//                //print(results.count)
//                
//                
//                
//                if results.count > 0 {
//                
//                    for result in results as! [NSManagedObject] {
////                        print("Time # ",result)
////                        context.deleteObject(result)
//                        print("Here is objectNum: ",objectNum)
//                        print(result.valueForKey("objectNum"))
//                        if result.valueForKey("objectNum") as? Int == objectNum {
//                            print("Entre")
//                            result.setValue(typeVehicleField.text,forKey: "tipoVehiculo")
//                            result.setValue(jurisdictionVehicleField.text,forKey: "jurisdicionVehiculo")
//                            result.setValue(ocupantesField.text,forKey: "ocupantes")
//                            result.setValue(numeroDeTablilla.text,forKey:"numDeTablilla")
//                            result.setValue(estadoField.text,forKey:"estadoField")
//                            result.setValue(VINField.text,forKey:"vinField")
//                            result.setValue(yearField.text,forKey:"yearField")
//                            result.setValue(marcaField.text,forKey:"marcaField")
//                            result.setValue(modeloField.text,forKey:"modeloField")
//                            result.setValue(numeroDeMarbete.text,forKey:"numeroDeMarbete")
//                            result.setValue(aseguradoraField.text,forKey:"aseguradoraField")
//                            
//                            result.setValue(fechaCompraField.text,forKey:"fechaCompraField")
//                            result.setValue(fechaExpiracionField.text,forKey:"fechaExpiracionField")
//                            result.setValue(objectNum, forKey: "objectNum")
//                            if result.valueForKey("objectNum") as? Int == 0 {
//                                context.deleteObject(result)
//                                do{
//                                    try context.save()
//                                    print("did it")
//                                }catch{
//                                    print("couldn't do it")
//                                }
//                                
//                            
//                                
//                            }
//                        }
//                        
//                        
//                    }
//                }
//                do {
//                    
//                    try context.save()
//                    print("Vehicle Saved")
//                    
//                } catch {
//                    
//                    print("There was a problem!")
//                    
//                }
//
//            }catch{
//                print("Error")
//            }
//
//        }
//        
//        else{
//            
//            
//            newData.setValue(typeVehicleField.text,forKey: "tipoVehiculo")
//            newData.setValue(jurisdictionVehicleField.text,forKey: "jurisdicionVehiculo")
//            newData.setValue(ocupantesField.text,forKey: "ocupantes")
//            newData.setValue(numeroDeTablilla.text,forKey:"numDeTablilla")
//            newData.setValue(estadoField.text,forKey:"estadoField")
//            newData.setValue(VINField.text,forKey:"vinField")
//            newData.setValue(yearField.text,forKey:"yearField")
//            newData.setValue(marcaField.text,forKey:"marcaField")
//            newData.setValue(modeloField.text,forKey:"modeloField")
//            newData.setValue(numeroDeMarbete.text,forKey:"numeroDeMarbete")
//            newData.setValue(aseguradoraField.text,forKey:"aseguradoraField")
//            
//            newData.setValue(fechaCompraField.text,forKey:"fechaCompraField")
//            newData.setValue(fechaExpiracionField.text,forKey:"fechaExpiracionField")
//            newData.setValue(objectNum, forKey: "objectNum")
//            
//            let request = NSFetchRequest(entityName: "PageFour")
//            
//            
//            
//            request.returnsObjectsAsFaults = false
//            do {
//                
//                try context.save()
//                print("Vehicle Saved")
//                
//            } catch {
//                
//                print("There was a problem!")
//                
//            }
//            
//            //onlynecessaryifneedresults
////            do {
////                let results = try context.executeFetchRequest(request)
////                
////                
////                
////                if results.count > 0 {
////                    
////                    for result in results as! [NSManagedObject] {
////                        print("For object #",result.valueForKey("objectNum")!)
////                        print(result.valueForKey("vinField")!)
////                        print(result.valueForKey("yearField")!)
////                        print(result.valueForKey("tipoVehiculo")!)
////                        print(result.valueForKey("jurisdicionVehiculo")!)
////                        print(result.valueForKey("ocupantes")!)
////                        print(result.valueForKey("numDeTablilla")!)
////                        print(result.valueForKey("estadoField")!)
////                        print(result.valueForKey("marcaField")!)
////                        print(result.valueForKey("modeloField")!)
////                        print(result.valueForKey("numeroDeMarbete")!)
////                        print(result.valueForKey("aseguradoraField")!)
////                        print(result.valueForKey("fechaCompraField")!)
////                        print(result.valueForKey("fechaExpiracionField")!)
////                        
////                    }
////                    
////                }
////                
////            } catch {
////                
////                print("Fetch Failed")
////            }
//        }
//        
//        
//        let request = NSFetchRequest(entityName: "PageFour")
//        request.returnsObjectsAsFaults = false
//
//        
//        do {
//            let results = try context.executeFetchRequest(request)
//            
//            
//            
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    print("For object #",result.valueForKey("objectNum")!)
////                    print(result.valueForKey("vinField")!)
////                    print(result.valueForKey("yearField")!)
////                    print(result.valueForKey("tipoVehiculo")!)
////                    print(result.valueForKey("jurisdicionVehiculo")!)
////                    print(result.valueForKey("ocupantes")!)
////                    print(result.valueForKey("numDeTablilla")!)
////                    print(result.valueForKey("estadoField")!)
////                    print(result.valueForKey("marcaField")!)
////                    print(result.valueForKey("modeloField")!)
////                    print(result.valueForKey("numeroDeMarbete")!)
////                    print(result.valueForKey("aseguradoraField")!)
////                    print(result.valueForKey("fechaCompraField")!)
////                    print(result.valueForKey("fechaExpiracionField")!)
//                    if (result.valueForKey("objectNum") as? Int == 0){
//                        context.deleteObject(result)
//                        do{
//                            try context.save()
//                            print("did it")
//                        }catch{
//                            print("couldn't do it")
//                        }
//                    }
//                    
//                }
//                
//            }
//            
//        }catch {
//            
//            print("Fetch Failed")
//        }

        
        
        
//        if segue.identifier == "exitToDataEntry"{
        
            dictionary["numDeTablilla"] = numeroDeTablilla.text
        dictionary["model"] = modeloField.text
        dictionary["marca"] = marcaField.text
        dictionary["year"] = yearField.text
            if let detailsVC = segue.destinationViewController as? VehicleExtendedViewController{
            detailsVC.dictionary = self.dictionary
           // print("Leaving VC")
            objectNum = 0
            isUpdating = false
           // }
        }
    

    }
    
    @IBAction func submit(sender: AnyObject) {
        
        
        print("--------------------")
   
        let webServicesObjectPOST = WebService.init()
        
        webServicesObjectPOST.addIData("VehicleType", value: typeVehicleField.text)
        
        webServicesObjectPOST.addIData("Occupants", value: ocupantesField.text)
        
        webServicesObjectPOST.addIData("PlateNumber", value: numeroDeTablilla.text)
        
        webServicesObjectPOST.addIData("VehicleJurisdiction", value: jurisdictionVehicleField.text)
        
        webServicesObjectPOST.addIData("State", value: estadoField.text)
        
        webServicesObjectPOST.addIData("Vin", value: VINField.text)
        
        webServicesObjectPOST.addIData("Year", value: yearField.text)
        
        webServicesObjectPOST.addIData("Make", value: marcaField.text)
        
        webServicesObjectPOST.addIData("modelos", value: modeloField.text)
        
        webServicesObjectPOST.addIData("RegistrationNumber", value: numeroDeMarbete.text)
        
        webServicesObjectPOST.addIData("InsuranceCompany", value: aseguradoraField.text)
        
        webServicesObjectPOST.addIData("PurchaseDate", value: fechaCompraField.text)
        
        webServicesObjectPOST.addIData("ExpirationDate", value: fechaExpiracionField.text)
        
        webServicesObjectPOST.sendPOSTs(4)
        
    }
    

    @IBAction func searchTablilla(sender: AnyObject) {
      
        
        let webServicesQuery = WebService.init()
        webServicesQuery.initiate(1)
        print(webServicesQuery.printQuery(search.text!))
        print("Here's your value: ")

        dictionaryQuery = webServicesQuery.printQuery(search.text!)
        
        //put first query for success key
        //print(dictionaryQuery.first!.1)
        vehicle = dictionaryQuery.first!.1
        
        //put vehile list into array of anyobjects because vehicle is an anyobject dictionary
        //print(vehicle!["VehicleList"].debugDescription)
        
        myArray = (vehicle?["VehicleList"])! as! Array<AnyObject>
        
        if myArray.count != 0 {
            //print("Here's the second item",myArray[0])
            
            //put first value of array into dictionaries which is just a single dictionary
            
            dictionaries = myArray[0] as! Dictionary<String, AnyObject>
            
            
            print("here's the third item", dictionaries)
            
            
            print(dictionaries["vehicleJurisdiction"])
//            
//            let alertController = UIAlertController(title: "Vehiculo encontrado!", message:
//                "Al aceptar pasaras al reporte.", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//            alertController.addAction(UIAlertAction(title: "Utilizar", style: UIAlertActionStyle.Default, handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
            
            jurisdictionVehicleField.text = dictionaries["vehicleJurisdiction"] as? String
            numeroDeTablilla.text = dictionaries["plateNumber"] as? String
            estadoField.text = dictionaries["state"] as? String
            typeVehicleField.text = dictionaries["vehicleType"] as? String
            VINField.text = dictionaries["vin"] as? String
            marcaField.text = dictionaries["make"] as? String
            modeloField.text = dictionaries["modelos"] as? String
            numeroDeMarbete.text = dictionaries["registrationNumber"] as? String
            aseguradoraField.text = dictionaries["insuranceCOmpany"] as? String
            fechaCompraField.text = dictionaries["purchaseDate"] as? String
            fechaExpiracionField.text = dictionaries["expirationDate"] as? String
            yearField.text = dictionaries["year"] as? String
            
            performSegueWithIdentifier("FoundVehicle", sender: self)
        }
        else{
//            let alertController = UIAlertController(title: "Vehiculo no encontrado!", message:
//                "Entrar informacion para uno nuevo.", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    
    
    
    
    func initializeFetchedResultsController() {
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        //        guard let selectedObject = fetchedResultsController.objectAtIndexPath(indexPath) as? NSManagedObject else { fatalError("Unexpected Object in FetchedResultsController") }
        //        // Populate cell from the NSManagedObject instance
        //        print("Object for configuration: \(selectedObject)")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        // Set up the cell
        //        configureCell(cell, indexPath: indexPath)
        //        let vehicle = object[indexPath.row + modifier]
        //        if modifier<object.count{
        //            modifier += 1
        //        }
        //
        //        cell.textLabel?.text = vehicle.valueForKey("numDeTablilla") as? String
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0//fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        guard let sections = fetchedResultsController.sections else {
        //            fatalError("No sections in fetchedResultsController")
        //        }
        //        let sectionInfo = sections[section]
        return 0//sectionInfo.numberOfObjects
    }
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Move:
            break
        case .Update:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Update:
            configureCell(tableView.cellForRowAtIndexPath(indexPath!)!, indexPath: indexPath!)
        case .Move:
            tableView.moveRowAtIndexPath(indexPath!, toIndexPath: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    

    
}
