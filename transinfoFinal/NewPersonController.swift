//
//  NewPersonController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class NewPersonController: UIViewController/*, PPScanningDelegate*/, UITableViewDelegate, UITableViewDataSource {
    //Faltan cosa por hacer on los fields!
    //Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!
    var cellName = "Vehicle #1"
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var saveSubmit: UIBarButtonItem!
    
    @IBOutlet weak var driverLicence: SwiftDropDownList!
    @IBOutlet weak var generoField: SwiftDropDownList!

    @IBOutlet weak var organDonor: SwiftDropDownList!
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    
    @IBOutlet weak var numLicenciaSearch: UITextField!
    
    
    @IBOutlet weak var urbanizacionBarrio: UITextField!
    
    @IBOutlet weak var calle: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fechaExpiracionField: UITextField!
    @IBOutlet weak var numLicenciaField:UITextField!
    @IBOutlet weak var nombreField:UITextField!
 
    //var personfk = AnyObject.self
    
    //For Scanner
    var string1 = ""
    var string2 = ""
    var string3 = ""
    var string4 = ""
    var objectNum = Int()
    var isUpdating = false
    var fetchedResultsController: NSFetchedResultsController!
    var object = [NSManagedObject]()
    var modifier = 0
    
    //For Singleton
    var values: [String:AnyObject] = [
        "accidentfk":"",
        "personfk":""
        ]

    //For Search
    var dictionaryQuery = [String:AnyObject] ()
   
    
    var vehicle: AnyObject?
    var dictionaries: Dictionary<String,AnyObject> = ["vacio":"empty"]
    var myArray = Array<AnyObject> ()
    
    var newPersonID = Dictionary<String,AnyObject>()
    
    
    //FALTAN PAR DE VALORES
    var dictionary1: [String:String] = [
        "name" :"",
        "gender" :"",
        "typeLicense" :"",
        "numLicense": ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 1000
        
        //ws
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
//        let singleton = Global.sharedGlobal
        
        //singleton.foreignKeys[0].crashBasicInformation = 112
        
        let webServicesObject = WebService.init()
        webServicesObject.initiate(3)
        
      

        
        generoField.isKeyboardHidden = true
        generoField.isDismissWhenSelected = true
        generoField.isArrayWithObject = true
        generoField.keyPath = "DescriptionES"
        generoField.arrayList = webServicesObject.arrayOfDictionaries("genders")
        
        driverLicence.isKeyboardHidden = true
        driverLicence.isDismissWhenSelected = true
        driverLicence.isArrayWithObject = true
        driverLicence.keyPath = "DescriptionES"
        driverLicence.arrayList = webServicesObject.arrayOfDictionaries("driverLicenseTypes")
        
        organDonor.isKeyboardHidden = true
        organDonor.isDismissWhenSelected = true
        organDonor.isArrayWithObject = true
        organDonor.keyPath = "DescriptionES"
        organDonor.arrayList = webServicesObject.arrayOfDictionaries("organDonor")
       
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
   
    }
    
    @IBAction func fechaExpiracionFieldAction(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewPersonController.datePickerValueChanged1), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged1(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        fechaExpiracionField.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
 
        
       
        dictionary1["genero"] = dictionaries["gender"] as? String
        dictionary1["name"] = dictionaries["name"] as? String


        
        
        //
    //
        //
    //
        //
    //
        //
    //
        //
    //
        //
    //
        
        
        
        
        
        
        
        
        
        
        
        
        print("--------------------")
        let webServicesObjectPOST = WebService.init()
        
        
        
        
        
        webServicesObjectPOST.addIData("Name", value: nombreField.text)
        
        webServicesObjectPOST.addIData("Gender", value: generoField.text)
        
        webServicesObjectPOST.addIData("LicenseType", value: driverLicence.text)
        
        webServicesObjectPOST.addIData("LicenceNumber", value: numLicenciaField.text)
        
        webServicesObjectPOST.addIData("OrganDonor", value: organDonor.text)
        
        webServicesObjectPOST.addIData("ExpirationDate", value: fechaExpiracionField.text)
        
        webServicesObjectPOST.addIData("Neighborhood", value: urbanizacionBarrio.text)
        
        webServicesObjectPOST.addIData("StreetName", value: calle.text)
        
        webServicesObjectPOST.addIData("City", value: city.text)
        
        webServicesObjectPOST.addIData("StateCountry", value: state.text)
        
        webServicesObjectPOST.addIData("ZipCode", value: zipCode.text)
        
        webServicesObjectPOST.addIData("PhoneNumber", value: PhoneNumber.text)
        
        
        newPersonID = webServicesObjectPOST.sendPOSTs(5)
        
        
        let singleton = Global.sharedGlobal
        
//

        
        
        if (newPersonID.first!.0 == "error_code" || newPersonID.first!.0 == "error")  {
            let alertController = UIAlertController(title: "No has llenado todos los campos o has puesto un valor erroneo.", message:
                "Por favor llena/arregla los campos.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            newPersonID.removeAll()
            
        }else{
            let myID = newPersonID.first!.1
            let results = myID as? Dictionary<String,AnyObject>
            print("Here it is!",results!["NewPersonId"])
            singleton.foreignKeys[0].newPerson = (results!["NewPersonId"]?.integerValue)!
            print(singleton.foreignKeys[0].newPerson)
            
            
        }

        values["personfk"] = singleton.foreignKeys[0].newPerson
        values["accidentfk"] = singleton.foreignKeys[0].crashBasicInformation

        let webServicesObjectPOST2 = WebService.init()
        webServicesObjectPOST2.clearPostData()
        webServicesObjectPOST2.addIData("Person_fk", value: values["personfk"]?.stringValue)
        webServicesObjectPOST2.addIData("Accident_fk", value: values["accidentfk"]?.stringValue)
        
        print("Here's postdata",webServicesObjectPOST2.PostData)
        print("here's the singleton", singleton.foreignKeys[0])
        print("here's value personfk",values["personfk"]?.stringValue)
        print("here's value accidentfk",values["accidentfk"]?.stringValue)
        webServicesObjectPOST2.sendPOSTs(10)
        
        print(singleton.foreignKeys[0])

        dictionary1["name"] = nombreField.text
        dictionary1["gender"] = generoField.text
        dictionary1["typeLicense"] = driverLicence.text
        dictionary1["numLicense"] = numLicenciaField.text
        
        let newPerson = People(person: dictionary1)
        singleton.listPeople.append(newPerson)

        singleton.listNum[1] += 1
        
        print(singleton.listPeople)
        print(singleton.listNum)
    }
    
    @IBAction func Guardar(sender: AnyObject) {
        
    }

    
    
    
    @IBAction func searchLicence(sender: AnyObject) {
        
        let webServicesQuery = WebService.init()
        webServicesQuery.initiate(1)
        print(numLicenciaSearch.text)
    
        if numLicenciaSearch.text == "" {

            myArray.append(dictionary1)
            myArray.removeAll()
        }
        else{
            dictionaryQuery = webServicesQuery.printQueryPerson(numLicenciaSearch.text!)
            vehicle = dictionaryQuery.first!.1
            myArray = (vehicle?["PersonList"])! as! Array<AnyObject>
        }

        
        if myArray.count != 0 {
            //print("Here's the second item",myArray[0])
            
            //put first value of array into dictionaries which is just a single dictionary
            
            dictionaries = myArray[0] as! Dictionary<String, AnyObject>
            
            
            print("here's the third item", dictionaries)
            
            
            print(dictionaries)
            
            numLicenciaField.text = dictionaries["licenceNumber"] as? String
            generoField.text = dictionaries["gender"] as? String
            organDonor.text = dictionaries["organDonor"] as? String
            city.text = dictionaries["city"] as? String
            state.text = dictionaries["stateCountry"] as? String
            urbanizacionBarrio.text = dictionaries["neighborhood"] as? String
            calle.text = dictionaries["streetname"] as? String
            zipCode.text = dictionaries["zipCode"] as? String
            PhoneNumber.text = dictionaries["phoneNumber"] as? String
            nombreField.text = dictionaries["name"] as? String
            
            
            let alertController = UIAlertController(title: "Persona encontrado!", message:
                "Escoge Dismiss para buscar de nuevo.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: willNotUse))
            alertController.addAction(UIAlertAction(title: "Utilizar", style: UIAlertActionStyle.Default, handler: FoundPerson))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            //
        }
        else{
            let alertController = UIAlertController(title: "Persona no encontrado!", message:
            "Entrar informacion para añadir.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: willNotUse))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
        
        
    }

    func FoundPerson(action: UIAlertAction){
        saveSubmit.title = "Submit"
        
        let WebServiceObject = WebService.init()
        print(WebServiceObject.getListofVehiclesPerson(numLicenciaSearch.text!))

    }
    
    
    func willNotUse(action: UIAlertAction){
        saveSubmit.title  = "Guardar"
        //function to clear out fields
        numLicenciaField.text = ""
        generoField.text = ""
        organDonor.text = ""
        city.text = ""
        state.text = ""
        urbanizacionBarrio.text = ""
        calle.text = ""
        zipCode.text = ""
        PhoneNumber.text = ""
        nombreField.text = ""

    }
    @IBAction func unwindToPerson(segue: UIStoryboardSegue) {
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = cellName//self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

    
    
    
}
    
    

