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

class NewPersonController: UIViewController/*, PPScanningDelegate*/{
    //Faltan cosa por hacer on los fields!
    //Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!//Faltan cosa por hacer on los fields!
    
    
    
    
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

    //For Search
    var dictionaryQuery = [String:AnyObject] ()
    var content = String()
    var finalContent = [String:String] ()
    var vehicle: AnyObject?
    var dictionaries: Dictionary<String,AnyObject> = ["vacio":"empty"]
    var myArray = Array<AnyObject> ()
    
    
    //FALTAN PAR DE VALORES
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

    
    //self.captureSession = [[AVCaptureSession alloc] init];
    //AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];

//    @IBAction func driverLIcenceTouchUpInside(sender: UIButton) {
//        
//        /** Instantiate the scanning coordinator */
//        let error: NSErrorPointer = nil
//        let coordinator = self.coordinatorWithError(error)
//        
//        /** If scanning isn't supported, present an error */
//        if coordinator == nil {
//            let messageString: String = (error.memory?.localizedDescription) ?? ""
//            UIAlertView(title: "Warning", message: messageString, delegate: nil, cancelButtonTitle: "Ok").show()
//            return
//        }
//        /** Allocate and present the scanning view controller */
//        let scanningViewController: UIViewController = PPViewControllerFactory.cameraViewControllerWithDelegate(self, coordinator: coordinator!, error: nil)
//        
//        /** You can use other presentation methods as well */
//        self.presentViewController(scanningViewController, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 1000
        
        //ws
        
        
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
        
        

        
        
        //categoriaPerson.text = dictionary1["categoriaPerson"]
        generoField.text = dictionary1["genero"]
        numLicenciaField.text = dictionary1["license"]
        organDonor.text = dictionary1["organDonor"]
       // personType.text = dictionary1["tipoPersona"]
        city.text = dictionary1["ciudad"]
        state.text = dictionary1["state"]
        //transportedBy.text = dictionary1["transportedBy"]
        nombreField.text = dictionary1["name"]
        
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let requests = NSFetchRequest(entityName: "PageThree")
//        
//        do {
//            
//            
//            let results = try context.executeFetchRequest(requests)
//            
//            
//            
//            if objectNum == 0 {
//                objectNum = results.count + 1
//            }
//            if (objectNum == 0 && results.count == 1){
//                objectNum = results.count + 1
//            }
//            //print("This here is the objectNum being used: ",objectNum)
//            
//            
//            
//            
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    
////                print("Here is the object IDs",result.valueForKey("objectNum"))
//                    if let idHolder = objectNum as? Int{
//                        if idHolder == result.valueForKey("objectNum") as? Int{
//                            
//                            print("is updating")
//                            isUpdating = true
//                        }
//                    }
//                }
//            }
//        }catch{
//            print("Error")
//        }
//    
//        
//        
////        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
////        
////        let context: NSManagedObjectContext = appDel.managedObjectContext
////        
//        let request = NSFetchRequest(entityName: "PageFour")
//        
//        //let departmentSort = NSSortDescriptor(key: "numDeTablilla", ascending: true)
//        request.sortDescriptors = []
//        //let moc = dataController.managedObjectContext
//        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context,sectionNameKeyPath: "numDeTablilla", cacheName: "rootCache")
//        fetchedResultsController.delegate = self as? NSFetchedResultsControllerDelegate
//        
//        do {
//            try fetchedResultsController.performFetch()
//        } catch {
//            fatalError("Failed to initialize FetchedResultsController: \(error)")
//        }
//
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        
//        
//        let fetchRequest = NSFetchRequest(entityName: "PageFour")
//        
//        //3
//        do {
//        let results = try managedContext.executeFetchRequest(fetchRequest)
//        object = results as! [NSManagedObject]
//        } catch let error as NSError {
//        print("Could not fetch \(error), \(error.userInfo)")
//        }

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
        // Dispose of any resources that can be recreated.
    
//    func coordinatorWithError(error: NSErrorPointer) -> PPCameraCoordinator? {
//        
//        /** 0. Check if scanning is supported */
//        
//        if (PPCameraCoordinator.isScanningUnsupportedForCameraType(PPCameraType.Back, error: error)) {
//            return nil;
//        }
//        
//        
//        /** 1. Initialize the Scanning settings */
//        
//        // Initialize the scanner settings object. This initialize settings with all default values.
//        let settings: PPSettings = PPSettings()
//        
//        
//        /** 2. Setup the license key */
//        
//        // Visit www.microblink.com to get the license key for your app
//        settings.licenseSettings.licenseKey = "53FGCYH6-CZS7USEW-HYUFWLR7-MXW4R7LS-4WXJCLCB-UZAM4JWJ-45DL47JC-CQNZKPADh";
//        //"N7E2CVWA-53NU6P42-4R5PPORH-EG4IDJLM-2DYMTRYX-YYID4OQ4-QQGZRDLH-PL22BO5S"
//        
//        
//        /**
//         * 3. Set up what is being scanned. See detailed guides for specific use cases.
//         * Remove undesired recognizers (added below) for optimal performance.
//         */
//        
//       /* do { // Remove this if you're not using MRTD recognition
//            
//            // To specify we want to perform MRTD (machine readable travel document) recognition, initialize the MRTD recognizer settings
//            let mrtdRecognizerSettings = PPMrtdRecognizerSettings()
//            
//            /** You can modify the properties of mrtdRecognizerSettings to suit your use-case */
//            
//            // tell the library to get full image of the document. Setting this to YES makes sense just if
//            // settings.metadataSettings.dewarpedImage = YES, otherwise it wastes CPU time.
//            mrtdRecognizerSettings.dewarpFullDocument = false;
//            
//            // Add MRTD Recognizer setting to a list of used recognizer settings
//            settings.scanSettings.addRecognizerSettings(mrtdRecognizerSettings)
//        }
//        
//        do { // Remove this if you're not using USDL recognition
//            
//            // To specify we want to perform USDL (US Driver's license) recognition, initialize the USDL recognizer settings
//            let usdlRecognizerSettings = PPUsdlRecognizerSettings()
//            
//            /** You can modify the properties of usdlRecognizerSettings to suit your use-case */
//            
//            // Add USDL Recognizer setting to a list of used recognizer settings
//            settings.scanSettings.addRecognizerSettings(usdlRecognizerSettings)
//        }*/
//        do {
//            // To specify we want to perform PDF417 recognition, initialize the PDF417 recognizer settings
//            let ocrRecognizerSettings: PPPdf417RecognizerSettings = PPPdf417RecognizerSettings()
//            
//            /** You can modify the properties of pdf417RecognizerSettings to suit your use-case */
//            
//            // Add PDF417 Recognizer setting to a list of used recognizer settings
//            settings.scanSettings.addRecognizerSettings(ocrRecognizerSettings)
//        }
//
//        
//        /** 4. Initialize the Scanning Coordinator object */
//        
//        let coordinator: PPCameraCoordinator = PPCameraCoordinator(settings: settings)
//        
//        return coordinator
//    }
//    
//    
//    func scanningViewControllerUnauthorizedCamera(scanningViewController: UIViewController) {
//        // Add any logic which handles UI when app user doesn't allow usage of the phone's camera
//    }
//    
//    func scanningViewController(scanningViewController: UIViewController, didFindError error: NSError) {
//        // Can be ignored. See description of the method
//    }
//    
//    func scanningViewControllerDidClose(scanningViewController: UIViewController) {
//        // As scanning view controller is presented full screen and modally, dismiss it
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func scanningViewController(scanningViewController: UIViewController?, didOutputResults results: [PPRecognizerResult]) {
//        
//        let scanConroller : PPScanningViewController = scanningViewController as! PPScanningViewController
//        
//        // Here you process scanning results. Scanning results are given in the array of PPRecognizerResult objects.
//        
//        // first, pause scanning until we process all the results
//        scanConroller.pauseScanning()
//        
//        var message : String = ""
//        var title : String = ""
//        
//        // Collect data from the result
//        for result in results {
//            /*if(result.isKindOfClass(PPMrtdRecognizerResult)) {
//                let mrtdResult : PPMrtdRecognizerResult = result as! PPMrtdRecognizerResult
//                title="MRTD"
//                message=mrtdResult.description
//            }
//            if(result.isKindOfClass(PPUsdlRecognizerResult)) {
//                let usdlResult : PPUsdlRecognizerResult = result as! PPUsdlRecognizerResult
//                title="USDL"
//                message=usdlResult.description
//            }*/
//            if(result.isKindOfClass(PPPdf417RecognizerResult)) {
//                /** Pdf417 code was detected */
//                
//                let pdf417Result = result as! PPPdf417RecognizerResult
//                
//                title = "Scanning Complete"
//                
//                // Save the string representation of the code
//                message = pdf417Result.stringUsingGuessedEncoding()
//                string1 = ""
//                string2 = ""
//                string3 = ""
//                string4 = ""
//                
//                
//              // Begin result appending
//                for character in message.characters
//                {
//                    if character == "-"
//                    {
//                        break
//                    }
//                    string1.append(character)
//                   
//                }
//                for count in 8...16
//                {
//                    string2.append(message[message.startIndex.advancedBy(count)])
//                }
//                for count in 18...100
//                {
//                    if message[message.startIndex.advancedBy(count)] == "n" || message[message.startIndex.advancedBy(count)] == "u" || message[message.startIndex.advancedBy(count)] == "l"
//                    {
//                        continue
//                    }
//                    
//                    if message[message.startIndex.advancedBy(count)] == "-"
//                    {
//                        
//                        if message[message.startIndex.advancedBy(count-1)] != "l"
//                        {
//                            string3.append(" " as Character)
//                        }
//                        continue
//                    }
//                    //checks for gender
//                    if message[message.startIndex.advancedBy(count)] == "C"
//                    {
//                        if message[message.startIndex.advancedBy(count+1)] == "I"
//                        {
//                            if message[message.startIndex.advancedBy(count+2)] == "T"
//                            {
//                                if message[message.startIndex.advancedBy(count+3)] == "-"
//                                {
//                                    if message[message.startIndex.advancedBy(count+4)] == "n"
//                                    {
//                                        if message[message.startIndex.advancedBy(count+5)] == "u"
//                                        {
//                                            if message[message.startIndex.advancedBy(count+6)] == "l"
//                                            {
//                                                if message[message.startIndex.advancedBy(count+7)] == "l"
//                                                {
//                                                    string4.append(message[message.startIndex.advancedBy(count+10)])
//                                                    break
//                                                }
//                                            }
//                                        }
//                                    }
//                                    
//                                    string4.append(message[message.startIndex.advancedBy(count+7)])
//                                    break
//                                }
//                            }
//                        }
//                    }
//                    string3.append(message[message.startIndex.advancedBy(count)])
//                }
//                numLicenciaField.text = string1
//                fechaExpiracionField.text = string2
//                nombreField.text = string3
//                generoField.text = string4
//            }
//
//        }
    
        //present the alert view with scanned results
        let alertView = UIAlertView(title: title, message: "Click OK to see results.", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let newData = NSEntityDescription.insertNewObjectForEntityForName("PageThree", inManagedObjectContext: context)
//        
//        if isUpdating{
//            do{
//            let request = NSFetchRequest(entityName: "PageThree")
//            
//            //request.predicate = NSPredicate(format: "objectNum = %@", "objectNum")
//            
//            let results = try context.executeFetchRequest(request)
//            
//            
//            //print(results.count)
//            
//            
//            
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    //                        print("Time # ",result)
//                    //                        context.deleteObject(result)
//                    //print("Here is objectNum: ",objectNum)
//                   // print(result.valueForKey("objectNum"))
//                    if result.valueForKey("objectNum") as? Int == objectNum {
//                      
//                        result.setValue(categoriaPerson.text,forKey:"categoriaPerson")
//                        result.setValue(generoField.text,forKey:"genero")
//                        result.setValue(driverLicence.text,forKey:"license")
//                        result.setValue(organDonor.text,forKey:"organDonor")
//                        result.setValue(personType.text, forKey: "tipoPersona")
//                        result.setValue(city.text, forKey: "ciudad")
//                        result.setValue(state.text, forKey: "state")
//                        result.setValue(transportedBy.text, forKey: "transportedBy")
//                        result.setValue(nombreField.text, forKey: "name")
//                        result.setValue(objectNum, forKey: "objectNum")
//                        if result.valueForKey("objectNum") as? Int == 0 {
//                            context.deleteObject(result)
//                            do{
//                                try context.save()
//                                print("did it")
//                            }catch{
//                                print("couldn't do it")
//                            }
//                        }
//                    }
//                }
//            }
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
//        }catch{
//            print("Error")
//        }
//
//    }
//    
//    else{
//            newData.setValue(categoriaPerson.text,forKey:"categoriaPerson")
//            newData.setValue(generoField.text,forKey:"genero")
//            newData.setValue(driverLicence.text,forKey:"license")
//            newData.setValue(organDonor.text,forKey:"organDonor")
//            newData.setValue(personType.text, forKey: "tipoPersona")
//            newData.setValue(city.text, forKey: "ciudad")
//            newData.setValue(state.text, forKey: "state")
//            newData.setValue(transportedBy.text, forKey: "transportedBy")
//            newData.setValue(nombreField.text, forKey: "name")
//            newData.setValue(objectNum, forKey: "objectNum")
//            
//            let request = NSFetchRequest(entityName: "PageThree")
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
//        }
//        
//        //Cleanup
//        let request = NSFetchRequest(entityName: "PageThree")
//        request.returnsObjectsAsFaults = false
//        do {
//            let results = try context.executeFetchRequest(request)
//            
//            
//            
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
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
 
        
       
        dictionary1["genero"] = dictionaries["gender"] as? String
        dictionary1["name"] = dictionaries["name"] as? String

        if let detailsVC = segue.destinationViewController as? PersonExtendedViewController{
            detailsVC.dictionary = self.dictionary1
            //print("Leaving VC")
        

        }
    }
    
    @IBAction func Guardar(sender: AnyObject) {
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
        
        
        
        //Captura el Valor del id de vehiculo.....idNewVehicle
        
        webServicesObjectPOST.sendPOSTs(5)
        
        
        
    }

    
    
    
    @IBAction func searchLicence(sender: AnyObject) {
        
        let webServicesQuery = WebService.init()
        webServicesQuery.initiate(1)

        dictionaryQuery = webServicesQuery.printQueryPerson(numLicenciaSearch.text!)
        
        //put first query for success key
        //print(dictionaryQuery.first!.1)
        vehicle = dictionaryQuery.first!.1
        
        //put vehile list into array of anyobjects because vehicle is an anyobject dictionary
        //print(vehicle!["VehicleList"].debugDescription)
        
        myArray = (vehicle?["PersonList"])! as! Array<AnyObject>
        
        if myArray.count != 0 {
            //print("Here's the second item",myArray[0])
            
            //put first value of array into dictionaries which is just a single dictionary
            
            dictionaries = myArray[0] as! Dictionary<String, AnyObject>
            
            
            print("here's the third item", dictionaries)
            
            
            print(dictionaries)
            
//            let alertController = UIAlertController(title: "Persona encontrado!", message:
//                "Al aceptar pasaras al reporte.", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//            alertController.addAction(UIAlertAction(title: "Utilizar", style: UIAlertActionStyle.Default, handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
            performSegueWithIdentifier("FoundPerson", sender: self)
            
        }
        else{
//            let alertController = UIAlertController(title: "Vehiculo no encontrado!", message:
//                "Entrar informacion para uno nuevo.", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//            
//            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        
        
        
    }

    @IBAction func unwindToPerson(segue: UIStoryboardSegue) {
    }
        
    }
    
    

