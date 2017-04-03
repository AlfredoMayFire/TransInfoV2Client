//
//  DataEntryTableViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Edited and managed by Alfredo Pomales III starting 8/15/2017 - Current.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class DataEntryTableViewController: UITableViewController{
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
   
    @IBOutlet var listaMiembros: UITableView!
    
    var vehicle = [NSManagedObject]()
    
    var person = [NSManagedObject]()
    
    var object = [NSManagedObject]()
    
    let section = ["Vehicles", "People"]
    
    //let  array: [Any] = []
    var items = [["vehicles"],["people"]]
    
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
       ]
    
    var dictionary1: [String:String] = [
        "categoriaPerson" :"",
        "genero" :"",
        "license" :"",
        "organDonor": "",
        "tipoPersona" :"",
        "ciudad" :"",
        "state" :"",
        "transportedBy": "",
        "name" :"",
        ]
    var dictionaryA: [String:String] = [
        "numDeTablilla" :"",
        "marca" :"",
        "modelo" :"",
        "year": "",
        "name" :"",
        "categoriaPersona" :"",
        "tipoPersona" :"",
        "genero": "",
        ]

    var objectNum = -1
    
    var oneOrOther = true

  
    @IBOutlet weak var listaMembers: UITableViewCell!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        listaMiembros.delegate = self
        listaMiembros.dataSource = self
       
        // Do any additional setup after loading the view, typically from a nib.
        //ADD SCROLL VIEW DIMENTIONS
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
          //  menuButton.action = "revealToggle:"
               menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
           
        }
        
        
      
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        //2

        if oneOrOther {
            let fetchRequest = NSFetchRequest(entityName: "PageThree")//person
            
            do {
                let results = try managedContext.executeFetchRequest(fetchRequest)
                object = results as! [NSManagedObject]
                
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }

        }
        else{
            
            let fetchRequest = NSFetchRequest(entityName: "PageFour")//vehicle
            
            do {
                let results = try managedContext.executeFetchRequest(fetchRequest)
                object = results as! [NSManagedObject]
                
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }

        }
        
        
        items[1].removeAll()//vacia people
        items[0].removeAll()//vacia vehiculo
        
        
        let fetchRequest = NSFetchRequest(entityName: "PageFour")//vehicle
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            vehicle = results as! [NSManagedObject]
            for count in results{
                items[0].append((count.valueForKey("numDeTablilla")as? String)!)
            }
        
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        let fetchRequests = NSFetchRequest(entityName: "PageThree")//person
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequests)
            person = results as! [NSManagedObject]
            for count in results{
                items[1].append((count.valueForKey("name") as? String)!)
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        

       listaMiembros.reloadData()
        
        self.tableView.reloadData()
        tableView.reloadData()
 
        
        objectNum = -1
        
        
    }
    
    
    @IBAction func refresh(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest(entityName: "PageFour")//vehicle
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            vehicle = results as! [NSManagedObject]
            for count in results{
                items[0].append((count.valueForKey("numDeTablilla")as? String)!)
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        let fetchRequests = NSFetchRequest(entityName: "PageThree")//person
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequests)
            person = results as! [NSManagedObject]
            for count in results{
                items[1].append((count.valueForKey("name") as? String)!)
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        
        listaMiembros.reloadData()
        
        self.tableView.reloadData()
        tableView.reloadData()

        
    }
    
    // MARK: UITableViewDataSource
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return object.count
//    }
    
    override func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
       
        if indexPath.section == 0{
        let vehicles = vehicle[indexPath.row]
        cell!.textLabel!.text = vehicles.valueForKey("numDeTablilla") as? String
        }
        else{
            let persons = person[indexPath.row]
            cell!.textLabel!.text = persons.valueForKey("name") as? String

        }
        
        
       
        
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
                        dictionaryA["numDeTablilla"] = result.valueForKey("numDeTablilla") as? String
                        dictionaryA["marca"] = result.valueForKey("marcaField") as? String
                        dictionaryA["modelo"] = result.valueForKey("modeloField") as? String
                        dictionaryA["year"] = result.valueForKey("yearField") as? String
                        
                    }
                    
                }
                
            }
        } catch {
            
            print("Fetch Failed")
        }
        
        let requestPeople = NSFetchRequest(entityName: "PageThree")
        requestPeople.returnsObjectsAsFaults = false
        do {
            
            try context.save()
            
        } catch {
            
            print("There was a problem!")
            
        }
        
        
        
        
        do {
            let results2 = try context.executeFetchRequest(requestPeople)
            
            if results2.count > 0 {
                
                for result in results2 as! [NSManagedObject] {
                    
                    if cellName?.textLabel?.text == result.valueForKey("name") as? String{
                        dictionaryA["name"] = result.valueForKey("name") as? String
                        dictionaryA["categoriaPersona"] = result.valueForKey("categoriaPerson") as? String
                        dictionaryA["tipoPersona"] = result.valueForKey("tipoPersona") as? String
                        dictionaryA["genero"] = result.valueForKey("genero") as? String
                        
                    }
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }


        if indexPath?.section == 0{
            performSegueWithIdentifier("EditVehicleSegue", sender: self)
        }
        else{
            performSegueWithIdentifier("EditPersonSegue", sender: self)
        }

        
        //        let indexPath = tableView.indexPathForSelectedRow // index path of selected cell
//        
//        let cellIndex = indexPath!.row // index of selected cell
//        // print(indexPath?.row)//iT'S THE NUMBER YOU WANT - 1
//        let cellName = tableView.cellForRowAtIndexPath(indexPath!) //  instance of selected cell
//        
//        
//        objectNum = cellIndex + 1
//        
//        performSegueWithIdentifier("extendedVehicle", sender: self)
//        
//        if indexPath?.section == 0{
//            let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            
//            let context: NSManagedObjectContext = appDel.managedObjectContext
//            
//            
//            let request = NSFetchRequest(entityName: "PageFour")
//            
//            request.returnsObjectsAsFaults = false
//            do {
//                
//                try context.save()
//                
//            } catch {
//                
//                print("There was a problem!")
//                
//            }
//            
//            
//            do {
//                let results = try context.executeFetchRequest(request)
//                
//                
//                
//                if results.count > 0 {
//                    
//                    for result in results as! [NSManagedObject] {
//                        
//                        if cellName?.textLabel?.text == result.valueForKey("numDeTablilla") as? String{
//                            
//                            dictionary["numDeTablilla"] = result.valueForKey("numDeTablilla") as? String
//                            dictionary["marca"] = result.valueForKey("marcaField") as? String
//                            dictionary["model"] = result.valueForKey("modeloField") as? String
//                            dictionary["year"] = result.valueForKey("yearField") as? String
//                            dictionary["tipoVehiculo"] = result.valueForKey("tipoVehiculo") as? String
//                            dictionary["ocupantes"] = result.valueForKey("ocupantes") as? String
//                            dictionary["jurisdiccion"] = result.valueForKey("jurisdicionVehiculo") as? String
//                            dictionary["estado"] = result.valueForKey("estadoField") as? String
//                            dictionary["vin"] = result.valueForKey("vinField") as? String
//                            dictionary["marbete"] = result.valueForKey("numeroDeMarbete") as? String
//                            dictionary["aseguradora"] = result.valueForKey("aseguradoraField") as? String
//                            dictionary["fechaCompra"] = result.valueForKey("fechaCompraField") as? String
//                            dictionary["fechaExpiracion"] = result.valueForKey("FechaExpiracionField") as? String
//                        }
//                        
//                    }
//                        performSegueWithIdentifier("EditVehicle", sender: self)
//                }
//            } catch {
//                
//                print("Fetch Failed")
//            }
//
//        }
//        else{//person
//            let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            
//            let context: NSManagedObjectContext = appDel.managedObjectContext
//            
//            
//            let request = NSFetchRequest(entityName: "PageThree")
//            
//            request.returnsObjectsAsFaults = false
//            do {
//                
//                try context.save()
//                
//            } catch {
//                
//                print("There was a problem!")
//                
//            }
//            
//            
//            do {
//                let results = try context.executeFetchRequest(request)
//
//                if results.count > 0 {
//                    
//                    for result in results as! [NSManagedObject] {
//                        
//                        if cellName?.textLabel?.text == result.valueForKey("name") as? String{
//                            
//                            dictionary1["categoriaPerson"] = result.valueForKey("categoriaPerson") as? String
//                            dictionary1["genero"] = result.valueForKey("genero") as? String
//                            dictionary1["license"] = result.valueForKey("license") as? String
//                            dictionary1["organDonor"] = result.valueForKey("organDonor") as? String
//                            dictionary1["tipoPersona"] = result.valueForKey("tipoPersona") as? String
//                            dictionary1["ciudad"] = result.valueForKey("ciudad") as? String
//                            dictionary1["state"] = result.valueForKey("state") as? String
//                            dictionary1["transportedBy"] = result.valueForKey("transportedBy") as? String
//                            dictionary1["name"] = result.valueForKey("name") as? String
//                        }
//                        
//                    }
//                    performSegueWithIdentifier("EditPerson", sender: self)
//                }
//            } catch {
//                
//                print("Fetch Failed")
//            }
//            
//        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section [section]
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return self.section.count
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.items[section].count
        
    }
    
     @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "EditVehicleSegue"){
            //prepare for segue to the details view controller
            
            if let detailsVC = segue.destinationViewController as? VehicleExtendedViewController {
                // let indexPath = self.tableView.indexPathForSelectedRow
                
                detailsVC.dictionary = self.dictionaryA
                detailsVC.objectNum = self.objectNum
            }
            
        }

        if (segue.identifier == "EditVehicle"){
            //prepare for segue to the details view controller
            
            if let detailsVC = segue.destinationViewController as? NewVehicleController {
                // let indexPath = self.tableView.indexPathForSelectedRow
                
                
                detailsVC.dictionary = self.dictionary
                detailsVC.objectNum = self.objectNum
            }
        }
        
        if(segue.identifier == "EditPerson"){
            if let detailsVC = segue.destinationViewController as? NewPersonController {
                //detailsVC.dictionary = self.dictionary
                detailsVC.objectNum = self.objectNum
                detailsVC.dictionary1 = self.dictionary1
            }
        }
        if(segue.identifier == "EditPersonSegue"){
            if let detailsVC = segue.destinationViewController as? PersonExtendedViewController {
                //detailsVC.dictionary = self.dictionary
                print(dictionaryA["name"])
                //detailsVC.objectNum = self.objectNum
                detailsVC.dictionaryA = self.dictionaryA
            }
        }

        self.tableView.reloadData()
        
        
        
        
        
    }


    
       
    }
    
    



