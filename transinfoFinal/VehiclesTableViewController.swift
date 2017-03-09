//
//  VehiclesTableViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class VehiclesTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var object = [NSManagedObject]()
    var ID = [NSManagedObjectID]()
    
    var dictionary: [String:String] = [
        "numDeTablilla" :"",
        "marca" :"",
        "modelo" :"",
        "year": "",
        "tipoVehiculoMotor": "",
        "direccionDeViaje": "",
        "funcionEspecial": "",
        "usoDeVehiculo": "",
        "maniobra": "",
        "mph": "",
        "limiteDeVelocidad": "",
        "alineamiento": "",
        "categoriaCarril": "",
        "inclinacion": "",
        "operationOrLost": "",
        "tipoCarril": "",
        "cantidadCarril": "",
        "objectNum": "",
        "primeraCategoria": "",
        "segundaCategoria": "",
        "terceraCategoria": "",
        "cuartaCategoria": "",
        "primerEvento": "",
        "segundoEvento": "",
        "tercerEvento": "",
        "cuartoEvento": "",
        "busUse": "",
        "leftPlace": "",
        "towedDamage": "",
        "primerDefectoMec": "",
        "segundoDefectoMec": "",
        "initialContactPoint": "",
        "diamondIDNumber": "",
        "descripcionCarretera": "",
        "commercialVehicle": "",
        "movingVehicle": "",
        "inspectionDate": "",
        "extendDamage": "",
        "authorizedDriver": "",
        "vehicleConfiguration": "",
        "hazardousMaterial": "",
        "specialPermit": "",
        "totalAxis": "",
        "heavyVehicleType": "",
        "grossWeight": "",
    ]
    
    var objectNum = -1
    
    @IBOutlet var listaVehiculos: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaVehiculos.delegate = self
        listaVehiculos.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        //ADD SCROLL VIEW DIMENTIONS
        
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
           // menuButton.action = "revealToggle:"
               menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
        }
        objectNum = object.count
        
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
      //  print(objectNum)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        
        
        let fetchRequest = NSFetchRequest(entityName: "PageFour")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            object = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()
        
        dictionary["numDeTablilla"] =                ""
        dictionary["year"] =                ""
        dictionary["marca"] =                ""
        dictionary["modelo"] =                ""
        
        dictionary["tipoVehiculoMotor"] =                ""
        dictionary["direccionDeViaje"] =                ""
        dictionary["funcionEspecial"] =                ""
        dictionary["usoDeVehiculo"] =                ""
        dictionary["maniobra"] =                ""
        dictionary["descripcionCarretera"] =                ""
        dictionary["alineamiento"] =                ""
        dictionary["inclinacion"] =                ""
        dictionary["categoriaCarril"] =                ""
        dictionary["tipoCarril"] =                ""
        // tipoControlesField.text = dictionary["numDeTablilla"]
        dictionary["operationOrLost"] =                ""
        dictionary["primeraCategoria"] =                ""
        dictionary["segundaCategoria"] =                ""
        dictionary["terceraCategoria"] =                ""
        dictionary["cuartaCategoria"] =                ""
        dictionary["primerEvento"] =                ""
        dictionary["segundoEvento"] =                ""
        dictionary["tercerEvento"] =                ""
        dictionary["cuartoEvento"] =                ""
        dictionary["busUse"] =                ""
        dictionary["leftPlace"] =                ""
        dictionary["towedDamage"] =                ""
        dictionary["primerDefectoMec"] =                ""
        dictionary["segundoDefectoMec"] =                ""
        dictionary["initialContactPoint"] =                ""
        //areaAfectadaField.text = dictionary["numDeTablilla"]
        dictionary["extendDamage"] =                ""
        dictionary["commercialVehicle"] =                ""
        dictionary["movingVehicle"] =                ""
        dictionary["authorizedDriver"] =                ""
        dictionary["inspectionDate"] =                ""
        dictionary["specialPermit"] =                ""
        dictionary["grossWeight"] =                ""
        
        
        dictionary["vehicleConfiguration"] =                ""
        dictionary["heavyVehicleType"] =                ""
        dictionary["hazardousMaterial"] =                ""
        dictionary["diamondIDNumber"] =                ""
        //huboDerrameMPField.text = dictionary["numDeTablilla"]
        
        
        
        dictionary["totalAxis"] =                ""
        dictionary["mph"] =                ""
        dictionary["limiteDeVelocidad"] =                ""
        dictionary["cantidadCarril"] =                ""
        
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let person = object[indexPath.row]
        
        cell!.textLabel!.text = person.valueForKey("numDeTablilla") as? String
        
        return cell!
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow // index path of selected cell
        
        let cellIndex = indexPath!.row // index of selected cell
        print(indexPath?.row)//iT'S THE NUMBER YOU WANT - 1
        let cellName = tableView.cellForRowAtIndexPath(indexPath!) //  instance of selected cell
        
        objectNum = cellIndex + 1
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        //let newData = NSEntityDescription.insertNewObjectForEntityForName("PageFour", inManagedObjectContext: context)
        let request1 = NSFetchRequest(entityName: "PageFour")
        
        request1.returnsObjectsAsFaults = false
        do {
            
            try context.save()
            
        } catch {
            
            print("There was a problem!")
            
        }
        
        
        do {
            let results1 = try context.executeFetchRequest(request1)
            
            
            
            if results1.count > 0 {
            
                for result in results1 as! [NSManagedObject] {
                    //print(result.objectID)
                    if cellName?.textLabel?.text == result.valueForKey("numDeTablilla") as? String{
                        dictionary["numDeTablilla"] = result.valueForKey("numDeTablilla") as? String
                        dictionary["marca"] = result.valueForKey("marcaField") as? String
                        dictionary["modelo"] = result.valueForKey("modeloField") as? String
                        dictionary["year"] = result.valueForKey("yearField") as? String

                    }
    
                }
                
            }
            
            let request2 = NSFetchRequest(entityName: "PageSix")
            
            request2.returnsObjectsAsFaults = false
            
            let results2 = try context.executeFetchRequest(request2)
            
            if results2.count > 0{
                for result in results2 as! [NSManagedObject] {
                    print("Here is objectNum: ",objectNum, "and here is coredata value: ", result.valueForKey("objectNum"))
                    if objectNum == result.valueForKey("objectNum") as? Int{
                        print("I got in")
                        dictionary["tipoVehiculoMotor"] = result.valueForKey("tipoVehiculoMotor") as? String
                        dictionary["direccionDeViaje"] = result.valueForKey("direccionDeViaje") as? String
                        dictionary["funcionEspecial"] = result.valueForKey("funcionEspecial") as? String
                        dictionary["usoDeVehiculo"] = result.valueForKey("usoDeVehiculo") as? String
                        dictionary["maniobra"] = result.valueForKey("maniobra") as? String
                        dictionary["mph"] = result.valueForKey("mph") as? String
                        dictionary["limiteDeVelocidad"] = result.valueForKey("limiteDeVelocidad") as? String
                        
                    }
                }
            }
            
            let request3 = NSFetchRequest(entityName: "PageSeven")
            
            request3.returnsObjectsAsFaults = false
            
            let results3 = try context.executeFetchRequest(request3)
            if results3.count > 0{
                for result in results3 as! [NSManagedObject] {
                    print("Here is objectNum: ",objectNum, "and here is coredata value: ", result.valueForKey("objectNum"))

                    if objectNum == result.valueForKey("objectNum") as? Int{
                        print("I got in")
                        dictionary["alineamiento"] = result.valueForKey("alineamiento") as? String
                        dictionary["categoriaCarril"] = result.valueForKey("categoriaCarril") as? String
                        dictionary["descripcionCarretera"] = result.valueForKey("descripcionCarretera") as? String
                        dictionary["inclinacion"] = result.valueForKey("inclinacion") as? String
                        dictionary["operationOrLost"] = result.valueForKey("operationOrLost") as? String
                        dictionary["tipoCarril"] = result.valueForKey("tipoCarril") as? String
                        dictionary["cantidadCarril"] = result.valueForKey("cantidadCarril") as? String
    
                    }
                }
            }

            let request4 = NSFetchRequest(entityName: "PageEight")
            
            request4.returnsObjectsAsFaults = false
            
            let results4 = try context.executeFetchRequest(request4)
            
            if results4.count > 0{
                for result in results4 as! [NSManagedObject] {
                    print("Here is objectNum: ",objectNum, "and here is coredata value: ", result.valueForKey("objectNum"))

                    if objectNum == result.valueForKey("objectNum") as? Int{
                        print("I got in")
                        dictionary["primeraCategoria"] = result.valueForKey("primeraCategoria") as? String
                        dictionary["segundaCategoria"] = result.valueForKey("segundaCategoria") as? String
                        dictionary["terceraCategoria"] = result.valueForKey("terceraCategoria") as? String
                        dictionary["cuartaCategoria"] = result.valueForKey("cuartaCategoria") as? String
                        dictionary["primerEvento"] = result.valueForKey("primerEvento") as? String
                        dictionary["segundoEvento"] = result.valueForKey("segundoEvento") as? String
                        dictionary["tercerEvento"] = result.valueForKey("tercerEvento") as? String
                        dictionary["cuartoEvento"] = result.valueForKey("cuartoEvento") as? String
                        dictionary["busUse"] = result.valueForKey("busUse") as? String
                        dictionary["leftPlace"] = result.valueForKey("leftPlace") as? String
                        dictionary["towedDamage"] = result.valueForKey("towedDamage") as? String
                        dictionary["primerDefectoMec"] = result.valueForKey("primerDefectoMec") as? String
                        dictionary["segundoDefectoMec"] = result.valueForKey("segundoDefectoMec") as? String

                    }
                }
            }
            
            let request5 = NSFetchRequest(entityName: "PageNine")
            
            request5.returnsObjectsAsFaults = false
            
            let results5 = try context.executeFetchRequest(request5)
            
            if results5.count > 0{
                for result in results5 as! [NSManagedObject] {
                    

                    if objectNum == result.valueForKey("objectNum") as? Int{
                                                dictionary["initialContactPoint"] = result.valueForKey("initialContactPoint") as? String
                        dictionary["diamondIDNumber"] = result.valueForKey("diamondIDNumber") as? String
                        dictionary["commercialVehicle"] = result.valueForKey("commercialVehicle") as? String
                        dictionary["movingVehicle"] = result.valueForKey("movingVehicle") as? String
                        dictionary["inspectionDate"] = result.valueForKey("inspectionDate") as? String
                        dictionary["extendDamage"] = result.valueForKey("extendDamage") as? String
                        dictionary["authorizedDriver"] = result.valueForKey("authorizedDriver") as? String
                        dictionary["vehicleConfiguration"] = result.valueForKey("vehicleConfiguration") as? String
                        dictionary["hazardousMaterial"] = result.valueForKey("hazardousMaterial") as? String
                        dictionary["totalAxis"] = result.valueForKey("totalAxis") as? String
                        dictionary["specialPermit"] = result.valueForKey("specialPermit") as? String
                        dictionary["heavyVehicleType"] = result.valueForKey("heavyVehicleType") as? String
                        dictionary["grossWeight"] = result.valueForKey("grossWeight") as? String
                    }
                }
            }

            
        } catch {
            
            print("Fetch Failed")
        }

        performSegueWithIdentifier("EditVehicleSegue", sender: self)

        
        
    }
    
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "EditVehicleSegue"){
            //prepare for segue to the details view controller
            
            if let detailsVC = segue.destinationViewController as? VehicleExtendedViewController {
               // let indexPath = self.tableView.indexPathForSelectedRow
               
                detailsVC.dictionary = self.dictionary
                detailsVC.objectNum = self.objectNum
            }
            
        }
    }

}
