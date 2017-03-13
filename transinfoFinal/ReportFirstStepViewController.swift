//
//  ReportFirstStepViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class ReportFirstStepViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITextFieldDelegate, UIPickerViewDelegate {
//UIPickerViewDataSource
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var menuButoon: UIBarButtonItem!
    //campos

    

    
    @IBOutlet weak var typeAccident: SwiftDropDownList!
    @IBOutlet weak var numberCaseField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var hourField: UITextField!
    @IBOutlet weak var numberVehiclesFIeld: UITextField!
    @IBOutlet weak var automovilistasField: UITextField!
    @IBOutlet weak var heridosField: UITextField!
    @IBOutlet weak var fatalitiesField: UITextField!
    @IBOutlet weak var latitudField: UITextField!
    @IBOutlet weak var longitudField: UITextField!
    @IBOutlet weak var stateField: SwiftDropDownList!
    @IBOutlet weak var direccionField: UILabel!
    @IBOutlet weak var cercadeField: SwiftDropDownList!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var distanceField: UITextField!
    @IBOutlet weak var UnitPedestrians: UITextField!
    
    @IBOutlet weak var medidaField: SwiftDropDownList!
    @IBOutlet weak var puntoCardinalField: SwiftDropDownList!
    @IBOutlet weak var propertyField: SwiftDropDownList!
    @IBOutlet weak var locationField: SwiftDropDownList!
    @IBOutlet weak var typeZonaField: SwiftDropDownList!
    @IBOutlet weak var municipioField: SwiftDropDownList!

   
 
    @IBOutlet weak var citiesTable: UITableView!
    
    var arrayList: NSArray = NSArray()
    
    var objectNum = Int()
    
  //  let cellReuseIdentifier = "cell"
    //Dirección
    let manager = CLLocationManager()


    
    //hora
    @IBAction func AccidenteHourField(sender: UITextField) {
        
        let timePicker:UIDatePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(ReportFirstStepViewController.timePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func timePickerValueChanged(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        hourField.text = dateformatter.stringFromDate(sender.date)
        
    }

    //Fecha
    @IBAction func AccidenteDateField(sender: UITextField) {

        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ReportFirstStepViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    @IBAction func ReportFirst(sender: AnyObject) {
        print ("------------")
      //  print (typeAccident.text)
        let  webServicesObjectPOST = WebService.init()
        webServicesObjectPOST.addIData("CrashType", value: typeAccident.text)
        webServicesObjectPOST.addIData("CaseNumber", value: numberCaseField.text)
        webServicesObjectPOST.addIData("CrashDate", value: dateTextField.text)
        webServicesObjectPOST.addIData("Hour", value: hourField.text)
        webServicesObjectPOST.addIData("UnitVehiculos", value: numberVehiclesFIeld.text)
        webServicesObjectPOST.addIData("UnitAutomovilistas", value: automovilistasField.text)
        webServicesObjectPOST.addIData("UnitPedestrians", value: UnitPedestrians.text)
        webServicesObjectPOST.addIData("UnitInjured", value: heridosField.text)
        webServicesObjectPOST.addIData("UnitFatalaties", value: fatalitiesField.text)
        webServicesObjectPOST.addIData("Latitude", value: latitudField.text)
        webServicesObjectPOST.addIData("Longitude", value: longitudField.text)
        webServicesObjectPOST.addIData("Address", value: direccionField.text)
        webServicesObjectPOST.addIData("CityDescriptionES", value: stateField.text)
        webServicesObjectPOST.addIData("CountryDescriptionES", value: municipioField.text)
        webServicesObjectPOST.addIData("NearToDescriptionEs", value: cercadeField.text)
        webServicesObjectPOST.addIData("Name", value: nameField.text)
        webServicesObjectPOST.addIData("Distance", value: distanceField.text)
        webServicesObjectPOST.addIData("MeasurementDescriptionES", value: medidaField.text)
        webServicesObjectPOST.addIData("DirectionDescriptionES", value: puntoCardinalField.text)
        webServicesObjectPOST.addIData("PropertyDescriptionES", value: propertyField.text)
        webServicesObjectPOST.addIData("LocationDescriptionES", value: locationField.text)
        webServicesObjectPOST.addIData("ZoneTypeDescriptionES", value: typeZonaField.text)
        print(webServicesObjectPOST.PostData["CrashType"])
        webServicesObjectPOST.sendPOSTs(1)
        print ("******************")

    }
    
 
   
  //  @IBAction func guardarReportFirst(sender: AnyObject) {
      
        //print(typeAccident.text)
//        let  webServicesObjectPOST = WebService.init()
//        webServicesObjectPOST.addIData("CrashType", value: typeAccident.text)
    
        
        
   // }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        //Direccion
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
//        let newObject = objectNumManager.init()
//        objectNum = newObject.getNum()
//        print(objectNum)
        
        let webServicesObject = WebService.init()
        webServicesObject.initiate(1)
        
       // arrayList = webServicesObject.arrayOfDictionaries("ListVehicleByPlateNumber")
        //print(webServicesObject.printQuery())
        
        typeAccident.isKeyboardHidden = true
        typeAccident.isDismissWhenSelected = true
        typeAccident.isArrayWithObject = true
        typeAccident.keyPath = "DescriptionES"
        typeAccident.arrayList = webServicesObject.arrayOfDictionaries("reportTypes")
        
        stateField.isKeyboardHidden = true
        stateField.isDismissWhenSelected = true
        stateField.isArrayWithObject = true
        stateField.keyPath = "DescriptionES"//
        stateField.arrayList = webServicesObject.arrayOfDictionaries("cities")//cities
        
        municipioField.isKeyboardHidden = true
        municipioField.isDismissWhenSelected = true
        municipioField.isArrayWithObject = true
        municipioField.keyPath = "DescriptionES"
        municipioField.arrayList = webServicesObject.arrayOfDictionaries("counties")
        
        medidaField.isKeyboardHidden = true
        medidaField.isDismissWhenSelected = true
        medidaField.isArrayWithObject = true
        medidaField.keyPath = "DescriptionES"
        medidaField.arrayList = webServicesObject.arrayOfDictionaries("measurements")
        
        puntoCardinalField.isKeyboardHidden = true
        puntoCardinalField.isDismissWhenSelected = true
        puntoCardinalField.isArrayWithObject = true
        puntoCardinalField.keyPath = "DescriptionES"
        puntoCardinalField.arrayList = webServicesObject.arrayOfDictionaries("directions")
        
        propertyField.isKeyboardHidden = true
        propertyField.isDismissWhenSelected = true
        propertyField.isArrayWithObject = true
        propertyField.keyPath = "DescriptionES"
        propertyField.arrayList = webServicesObject.arrayOfDictionaries("properties")
       
        locationField.isKeyboardHidden = true
        locationField.isDismissWhenSelected = true
        locationField.isArrayWithObject = true
        locationField.keyPath = "DescriptionES"
        locationField.arrayList = webServicesObject.arrayOfDictionaries("locations")
        
        typeZonaField.isKeyboardHidden = true
        typeZonaField.isDismissWhenSelected = true
        typeZonaField.isArrayWithObject = true
        typeZonaField.keyPath = "DescriptionES"
        typeZonaField.arrayList = webServicesObject.arrayOfDictionaries("zoneTypes")
        
        cercadeField.isKeyboardHidden = true
        cercadeField.isDismissWhenSelected = true
        cercadeField.isArrayWithObject = true
        cercadeField.keyPath = "DescriptionES"
        cercadeField.arrayList = webServicesObject.arrayOfDictionaries("nearTo")
        
        
        
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view, typically from a nib.
        dateTextField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        hourField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        
       
        
        //ADD SCROLL VIEW DIMENTIONS
        scrollview.contentSize.height = 1000
        
        //menu
        if revealViewController() != nil {
            menuButoon.target = revealViewController()
            menuButoon.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
        latitudField.text = "1"
        longitudField.text = "0"

    
    }
    
    override func viewWillAppear(animated: Bool) {

        print("Here it is, ",objectNum)
    }
    
    
    func addInfoDirection(info: String?) ->String{
    
        if info != nil{
            return "\(info!)\n"
        }
        else {
        return ""
        }
    }
    
    //función cargar dato de direccion en la tabla
    func locationManager(manager:CLLocationManager, didUpdateLocations locations: [CLLocation]){
       
        if let userLocation = locations.first {
            
        self.latitudField.text = "\(userLocation.coordinate.latitude)"
        self.longitudField.text = "\(userLocation.coordinate.longitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) in
            if error != nil{
                print(error)
            }
            else {
                if let p = placemarks?[0]{
                    var address = ""
                    address = address + self.addInfoDirection(p.thoroughfare)
                    address = address + self.addInfoDirection(p.subThoroughfare)
                    self.direccionField.text = address
                }
            }
        })
    }
      
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(sender: AnyObject) {
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let newData = NSEntityDescription.insertNewObjectForEntityForName("PageOne", inManagedObjectContext: context)
//        
//        
//        newData.setValue(typeAccident.text,forKey: "tipoAccidente")
//        newData.setValue(numberCaseField.text,forKey: "numCaso")
//        newData.setValue(dateTextField.text,forKey: "fechaAccidente")
//        newData.setValue(hourField.text,forKey:"hora")
//        newData.setValue(numberVehiclesFIeld.text,forKey:"vehiculoInvolu")
//        newData.setValue(automovilistasField.text,forKey:"automovilistaInvolu")
//        newData.setValue(heridosField.text,forKey:"heridosInvolu")
//        newData.setValue(fatalitiesField.text,forKey:"fatalidadesInvolu")
//        newData.setValue(latitudField.text,forKey:"coordX")
//        newData.setValue(longitudField.text,forKey:"coordY")
//        newData.setValue(stateField.text,forKey:"estado")
//        //newData.setValue ("direccionField.text",forKey:"fechaAccidente")
//        newData.setValue(municipioField.text,forKey:"municipio")
//        newData.setValue(cercadeField.text,forKey:"cercaDe")
//        newData.setValue(nameField.text,forKey:"nombre")
//        newData.setValue(distanceField.text,forKey:"distancia")
//        newData.setValue(medidaField.text,forKey:"medida")
//        newData.setValue(puntoCardinalField.text,forKey:"puntoCardinal")
//       // newData.setValue(propertyTypeField.text,forKey:"tipoPropiedad")
//        newData.setValue(locationField.text,forKey:"ubicacion")
//        newData.setValue(typeZonaField.text,forKey:"tipoZona")
//        
//        let request = NSFetchRequest(entityName: "PageOne")
//        
//        
//        
//       request.returnsObjectsAsFaults = false
//        do {
//            
//            try context.save()
//            
//        } catch {
//            
//            print("There was a problem!")
//            
//        }
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
//                    print(result.objectID)
//                    print(result.valueForKey("tipoAccidente")!)
//                    print(result.valueForKey("numCaso")!)
//                    print(result.valueForKey("fechaAccidente")!)
//                    print(result.valueForKey("hora")!)
//                    print(result.valueForKey("vehiculoInvolu")!)
//                    print(result.valueForKey("automovilistaInvolu")!)
//                    print(result.valueForKey("heridosInvolu")!)
//                    print(result.valueForKey("fatalidadesInvolu")!)
//                    print(result.valueForKey("coordX")!)
//                    print(result.valueForKey("coordY")!)
//                    print(result.valueForKey("estado")!)
//                    print(result.valueForKey("municipio")!)
//                    print(result.valueForKey("cercaDe")!)
//                    print(result.valueForKey("nombre")!)
//                    print(result.valueForKey("distancia")!)
//                    print(result.valueForKey("medida")!)
//                    print(result.valueForKey("puntoCardinal")!)
//                    print(result.valueForKey("ubicacion")!)
//                    print(result.valueForKey("tipoZona")!)
//                    
//                }
//                
//            }
//            
//        } catch {
//            
//            print("Fetch Failed")
//        }
//        
        
    }

    
    
    @IBAction func clear(sender: AnyObject) {
        typeAccident.text = ""
         numberCaseField.text = ""
         dateTextField.text = ""
        hourField.text = ""
         numberVehiclesFIeld.text = ""
         automovilistasField.text = ""
         heridosField.text = ""
         fatalitiesField.text = ""
        latitudField.text = ""
         longitudField.text = ""
        stateField.text = ""
       direccionField.text = ""
         cercadeField.text = ""
         nameField.text = ""
         distanceField.text = ""
         UnitPedestrians.text = ""
        
         medidaField.text = ""
         puntoCardinalField.text = ""
         propertyField.text = ""
        locationField.text = ""
         typeZonaField.text = ""
         municipioField.text = ""
    }
    
    
    @IBAction func unwindToFirstStep(segue: UIStoryboardSegue) {
    }
    

    
}
