//
//  PersonsTableViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class PersonsTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet var listaPersonas: UITableView!
    
    var object = [NSManagedObject]()
    var dictionary: [String:String] = [
        "name" :"",
        "categoriaPersona" :"",
        "tipoPersona" :"",
        "genero": "",
        
        "row": "",
        "seat": "",
        "otherLocation": "",
        "restraintSystem": "",
        "airbagActivation": "",
        "expulsion": "",
        "extractionDescription": "",
        "speedRelatedDescription": "",
    
        "distractedDriver": "",
        "safetyEquipment": "",
        "suspectAlcohol": "",
        "suspectSubst": "",
        "testStatusAl": "",
        "testTypeAl": "",
        "testResultAl": "",
    
        "testResultSubst": "",
        "testStatusSubst": "",
        "testTypeSubst": "",
        "waySchool": "",
        "locationWhenCollision": "",
      ]
    var objectNum = Int()

    
    
    
    
    
    override func viewDidLoad() {
        listaPersonas.delegate = self
        listaPersonas.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            //menuButton.action = "revealToggle:"
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
        objectNum = object.count
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        
        
        let fetchRequest = NSFetchRequest(entityName: "PageThree")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            object = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()

        
        
        
        
    
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let person = object[indexPath.row]
        
        cell!.textLabel!.text = person.valueForKey("name") as? String
        
        return cell!
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow // index path of selected cell
        
        let cellIndex = indexPath!.row // index of selected cell
      
        objectNum = cellIndex + 1
        
        let cellName = tableView.cellForRowAtIndexPath(indexPath!) //  instance of selected cell
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request1 = NSFetchRequest(entityName: "PageThree")
        let request2 = NSFetchRequest(entityName: "PageTen")
        let request3 = NSFetchRequest(entityName: "PageEleven")
        let request4 = NSFetchRequest(entityName: "PageThirteen")
        
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
                   
                    if cellName?.textLabel?.text == result.valueForKey("name") as? String{
                        dictionary["name"] = result.valueForKey("name") as? String
                        dictionary["categoriaPersona"] = result.valueForKey("categoriaPerson") as? String
                        dictionary["tipoPersona"] = result.valueForKey("tipoPersona") as? String
                        dictionary["genero"] = result.valueForKey("genero") as? String
                        
                    }
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }
        do {
            let results2 = try context.executeFetchRequest(request2)
            
            
            
            if results2.count > 0 {
                
                for result in results2 as! [NSManagedObject] {
                    
                    if objectNum == result.valueForKey("objectNum") as? Int{
                        dictionary["row"] = result.valueForKey("row") as? String
                        dictionary["seat"] = result.valueForKey("seat") as? String
                        dictionary["otherLocation"] = result.valueForKey("otherLocation") as? String
                        dictionary["restraintSystem"] = result.valueForKey("restraintSystem") as? String
                        dictionary["airbagActivation"] = result.valueForKey("airbagActivation") as? String
                        dictionary["expulsion"] = result.valueForKey("expulsion") as? String
                        dictionary["extractionDescription"] = result.valueForKey("extractionDescription") as? String
                        dictionary["speedRelatedDescription"] = result.valueForKey("speedRelatedDescription") as? String
                        dictionary["distractedDriver"] = result.valueForKey("distractedDriver") as? String
                        dictionary["safetyEquipment"] = result.valueForKey("safetyEquipment") as? String
                    }
                    
                }
                
            }
            
        } catch {
            
            print("Fetch Failed")
        }
        do {
            let results3 = try context.executeFetchRequest(request3)
            
            
            
            if results3.count > 0 {
                
                for result in results3 as! [NSManagedObject] {
                    
                    if objectNum == result.valueForKey("objectNum") as? Int{
                    
                        dictionary["suspectAlcohol"] = result.valueForKey("suspectAlcohol") as? String
                        dictionary["suspectSubst"] = result.valueForKey("suspectSubst") as? String
                        dictionary["testStatusAl"] = result.valueForKey("testStatusAl") as? String
                        dictionary["testTypeAl"] = result.valueForKey("testTypeAl") as? String
                        dictionary["testResultAl"] = result.valueForKey("testResultAl") as? String
                        dictionary["testResultSubst"] = result.valueForKey("testResultSubst") as? String
                        dictionary["testStatusSubst"] = result.valueForKey("testStatusSubst") as? String
                        dictionary["testTypeSubst"] = result.valueForKey("testTypeSubst") as? String

                        
                    }

                }
            }
        } catch {
            
            print("Fetch Failed")
        }

        do {
            let results4 = try context.executeFetchRequest(request4)
            
            
            
            if results4.count > 0 {
                
                for result in results4 as! [NSManagedObject] {
                    
                    if objectNum == result.valueForKey("objectNum") as? Int{
                                               dictionary["waySchool"] = result.valueForKey("waySchool") as? String
                        dictionary["locationWhenCollision"] = result.valueForKey("locationWhenCollision") as? String
                    }
                }
            }
        } catch {
            
            print("Fetch Failed")
        }
      //  print(dictionary["testResultAl"])
         performSegueWithIdentifier("EditPersonSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "EditPersonSegue"){
            //prepare for segue to the details view controller
            
            if let detailsVC = segue.destinationViewController as? PersonExtendedViewController {
                // let indexPath = self.tableView.indexPathForSelectedRow
                
                detailsVC.dictionary = self.dictionary
                detailsVC.objectNum = self.objectNum
            }
            
        }
    }

    @IBAction func unwindToVC2(segue: UIStoryboardSegue) {
    }


}
