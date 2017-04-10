//
//  ViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/26/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
    var myAO: AnyObject?
    var officerID = Dictionary<String,AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        print ("------------")
        
        //let  webServicesObjectPOST = WebService.init()
        //            webServicesObjectPOST.addIData("username", value: userTextField.text)
        //            webServicesObjectPOST.addIData("password", value: passwordTextField.text)
        //            webServicesObjectPOST.sendPOSTs(8)
        
        print ("------outtt------")
        
        let url = "http://localhost:9000/login"
        var loginPostResults = WebService.post(url, parameters: ["username":userTextField.text!,"password":passwordTextField.text!] )
        //print("Here's this Thing",loginPostResults["payload"])
        //print(loginPostResults["error_code"])
        //...................................
        
        myAO = loginPostResults["payload"]
        officerID = (myAO as? Dictionary<String,AnyObject>)!
        print("Here's the OfficerID",officerID["OfficerID"])
        
        
        let error = loginPostResults["error_code"] as! String
        if( error != ""){
            let alert = UIAlertController(title: "Alert", message: "Username or password invalid", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            //Capturar el valor del OfficerID
            
            let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let context: NSManagedObjectContext = appDel.managedObjectContext
            
            let newData = NSEntityDescription.insertNewObjectForEntityForName("Posts", inManagedObjectContext: context)
            
            newData.setValue(officerID["OfficerID"], forKey: "officerID")
            
            
            
            do {
                
                try context.save()
                
            } catch {
                
                print("There was a problem!")
                
            }
            
            
            
            let request11 = NSFetchRequest(entityName: "Posts")
            
            
            
            request11.returnsObjectsAsFaults = false
            
            
            //
            //        do {
            //            let results = try context.executeFetchRequest(request11)
            //
            //
            //
            //            if results.count > 0 {
            //
            //                for result in results as! [NSManagedObject] {
            //
            //                    if result.valueForKey("crashBasicInformation") as? Int != 0 {
            //                        print("here is the crashid for page1: ",result.valueForKey("crashBasicInformation"))
            //                        values["AccidenteFK"] = result.valueForKey("crashBasicInformation")?.stringValue
            //                    }
            //                    
            //                }
            //            }
            //            
            //        }catch {
            //            
            //            print("Fetch Failed")
            //        }
            //
            
            
            
            
            
            
        }

        }
        
        
        
    
}

