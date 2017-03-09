//
//  ReportSecondStepViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/27/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class ReportSecondStepViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UIPickerViewDelegate {
    
   
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    //
    
   
    @IBOutlet weak var typeColisionField: SwiftDropDownList!
    @IBOutlet weak var eventField: SwiftDropDownList!
    @IBOutlet weak var eventLocationField: SwiftDropDownList!
    @IBOutlet weak var mannerColisionField: SwiftDropDownList!
    @IBOutlet weak var condition1Field: SwiftDropDownList!
    @IBOutlet weak var condition2Field: SwiftDropDownList!
    @IBOutlet weak var visibilidadConditionField: SwiftDropDownList!
    @IBOutlet weak var pavimentCondition: SwiftDropDownList!
    @IBOutlet weak var circunstanciaAmbientalField: SwiftDropDownList!
    @IBOutlet weak var circunstanciaCarreteraField: SwiftDropDownList!
    @IBOutlet weak var interseccionDesnivelField: SwiftDropDownList!
    @IBOutlet weak var lugarEspecificoField: SwiftDropDownList!
    @IBOutlet weak var tipoIntersecciónField: SwiftDropDownList!
    @IBOutlet weak var RelacionadoOmnibusField: SwiftDropDownList!
    @IBOutlet weak var relacionField: SwiftDropDownList!
    @IBOutlet weak var localizacionAccidenteField: SwiftDropDownList!
    @IBOutlet weak var typezonaField: SwiftDropDownList!
    @IBOutlet weak var trabajadoresPresentesField: SwiftDropDownList!
    @IBOutlet weak var policiaPresenteField: SwiftDropDownList!
    
    @IBOutlet weak var narrativeField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ws
        let webServicesObject = WebService.init()
        webServicesObject.initiate(2)
        
        
        typeColisionField.isKeyboardHidden = true
        typeColisionField.isDismissWhenSelected = true
        typeColisionField.isArrayWithObject = true
        typeColisionField.keyPath = "DescriptionES"
        typeColisionField.arrayList = webServicesObject.arrayOfDictionaries("harmfulEventCategories")
        
        eventField.isKeyboardHidden = true
        eventField.isDismissWhenSelected = true
        eventField.isArrayWithObject = true
        eventField.keyPath = "DescriptionES"
        eventField.arrayList = webServicesObject.arrayOfDictionaries("harmfulEvents")
        
        eventLocationField.isKeyboardHidden = true
        eventLocationField.isDismissWhenSelected = true
        eventLocationField.isArrayWithObject = true
        eventLocationField.keyPath = "DescriptionES"
        eventLocationField.arrayList = webServicesObject.arrayOfDictionaries("relativeToTrafficways")
        
        mannerColisionField.isKeyboardHidden = true
        mannerColisionField.isDismissWhenSelected = true
        mannerColisionField.isArrayWithObject = true
        mannerColisionField.keyPath = "DescriptionES"
        mannerColisionField.arrayList = webServicesObject.arrayOfDictionaries("mannerOfColisions")
        
        condition1Field.isKeyboardHidden = true
        condition1Field.isDismissWhenSelected = true
        condition1Field.isArrayWithObject = true
        condition1Field.keyPath = "DescriptionES"
        condition1Field.arrayList = webServicesObject.arrayOfDictionaries("weatherConditions")
        
        condition2Field.isKeyboardHidden = true
        condition2Field.isDismissWhenSelected = true
        condition2Field.isArrayWithObject = true
        condition2Field.keyPath = "DescriptionES"
        condition2Field.arrayList = webServicesObject.arrayOfDictionaries("weatherConditions")
        
        visibilidadConditionField.isKeyboardHidden = true
        visibilidadConditionField.isDismissWhenSelected = true
        visibilidadConditionField.isArrayWithObject = true
        visibilidadConditionField.keyPath = "DescriptionES"
        visibilidadConditionField.arrayList = webServicesObject.arrayOfDictionaries("lightingConditions")
        
        pavimentCondition.isKeyboardHidden = true
        pavimentCondition.isDismissWhenSelected = true
        pavimentCondition.isArrayWithObject = true
        pavimentCondition.keyPath = "DescriptionES"
        pavimentCondition.arrayList = webServicesObject.arrayOfDictionaries("roadSurfaces")
        
        circunstanciaAmbientalField.isKeyboardHidden = true
        circunstanciaAmbientalField.isDismissWhenSelected = true
        circunstanciaAmbientalField.isArrayWithObject = true
        circunstanciaAmbientalField.keyPath = "DescriptionES"
        circunstanciaAmbientalField.arrayList = webServicesObject.arrayOfDictionaries("environmentConditions")
        
        circunstanciaCarreteraField.isKeyboardHidden = true
        circunstanciaCarreteraField.isDismissWhenSelected = true
        circunstanciaCarreteraField.isArrayWithObject = true
        circunstanciaCarreteraField.keyPath = "DescriptionES"
        circunstanciaCarreteraField.arrayList = webServicesObject.arrayOfDictionaries("roadCircumstances")
        
        interseccionDesnivelField.isKeyboardHidden = true
        interseccionDesnivelField.isDismissWhenSelected = true
        interseccionDesnivelField.isArrayWithObject = true
        interseccionDesnivelField.keyPath = "DescriptionES"
        interseccionDesnivelField.arrayList = webServicesObject.arrayOfDictionaries("roadSurfaces")
        
        lugarEspecificoField.isKeyboardHidden = true
        lugarEspecificoField.isDismissWhenSelected = true
        lugarEspecificoField.isArrayWithObject = true
        lugarEspecificoField.keyPath = "DescriptionES"
        lugarEspecificoField.arrayList = webServicesObject.arrayOfDictionaries("junctions")
        
        tipoIntersecciónField.isKeyboardHidden = true
        tipoIntersecciónField.isDismissWhenSelected = true
        tipoIntersecciónField.isArrayWithObject = true
        tipoIntersecciónField.keyPath = "DescriptionES"
        tipoIntersecciónField.arrayList = webServicesObject.arrayOfDictionaries("intersectionTypes")
        
        RelacionadoOmnibusField.isKeyboardHidden = true
        RelacionadoOmnibusField.isDismissWhenSelected = true
        RelacionadoOmnibusField.isArrayWithObject = true
        RelacionadoOmnibusField.keyPath = "DescriptionES"
        RelacionadoOmnibusField.arrayList = webServicesObject.arrayOfDictionaries("schoolBusRelated")
        
        relacionField.isKeyboardHidden = true
        relacionField.isDismissWhenSelected = true
        relacionField.isArrayWithObject = true
        relacionField.keyPath = "DescriptionES"
        relacionField.arrayList = webServicesObject.arrayOfDictionaries("workzoneRelated")
        
        localizacionAccidenteField.isKeyboardHidden = true
        localizacionAccidenteField.isDismissWhenSelected = true
        localizacionAccidenteField.isArrayWithObject = true
        localizacionAccidenteField.keyPath = "DescriptionES"
        localizacionAccidenteField.arrayList = webServicesObject.arrayOfDictionaries("workzoneLocations")
        
        typezonaField.isKeyboardHidden = true
        typezonaField.isDismissWhenSelected = true
        typezonaField.isArrayWithObject = true
        typezonaField.keyPath = "DescriptionES"
        typezonaField.arrayList = webServicesObject.arrayOfDictionaries("workzoneTypes")
        
        trabajadoresPresentesField.isKeyboardHidden = true
        trabajadoresPresentesField.isDismissWhenSelected = true
        trabajadoresPresentesField.isArrayWithObject = true
        trabajadoresPresentesField.keyPath = "DescriptionES"
        trabajadoresPresentesField.arrayList = webServicesObject.arrayOfDictionaries("workersPresent")
        
        policiaPresenteField.isKeyboardHidden = true
        policiaPresenteField.isDismissWhenSelected = true
        policiaPresenteField.isArrayWithObject = true
        policiaPresenteField.keyPath = "DescriptionES"
        policiaPresenteField.arrayList = webServicesObject.arrayOfDictionaries("lawEnforcementPresent")
        
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        scrollview.contentSize.height = 1000
        //
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Guardar(sender: AnyObject) {
        print("--------------------")
        
        let webServicesObjectPOST = WebService.init()
        
        webServicesObjectPOST.addIData("CollisionTypeDescriptionES", value: typeColisionField.text)
        
        webServicesObjectPOST.addIData("EventDescriptionES", value: eventField.text)
        
        webServicesObjectPOST.addIData("EventLocationDescriptionES", value: eventLocationField.text)
        
        webServicesObjectPOST.addIData("MannerofColisionDescriptionES", value: mannerColisionField.text)
        
        webServicesObjectPOST.addIData("WeatherConditionUno", value: condition1Field.text)
        
        webServicesObjectPOST.addIData("WeatherConditionDos", value: condition2Field.text)
        
        webServicesObjectPOST.addIData("VisibilityCondition", value: visibilidadConditionField.text)
        
        webServicesObjectPOST.addIData("PavementCondition", value: pavimentCondition.text)
        
        webServicesObjectPOST.addIData("Environmental", value: circunstanciaAmbientalField.text)
        
        webServicesObjectPOST.addIData("RoadDescription", value: circunstanciaCarreteraField.text)
        
        webServicesObjectPOST.addIData("WithinInterchange", value: interseccionDesnivelField.text)
        
        webServicesObjectPOST.addIData("SpecifLocation", value: lugarEspecificoField.text)
        
        webServicesObjectPOST.addIData("InserctionType", value: tipoIntersecciónField.text)
        
        webServicesObjectPOST.addIData("SchoolBusRelated", value: RelacionadoOmnibusField.text)
        
        webServicesObjectPOST.addIData("NearConstruction", value: relacionField.text)
        
        webServicesObjectPOST.addIData("CrashLocation", value: localizacionAccidenteField.text)
        
        webServicesObjectPOST.addIData("WorkerZoneType", value: typezonaField.text)
        
        webServicesObjectPOST.addIData("WorkerPresent", value: trabajadoresPresentesField.text)
        
        webServicesObjectPOST.addIData("PolicePresent", value: policiaPresenteField.text)
        
        webServicesObjectPOST.sendPOSTs(2)
        
//                    let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            
//            let context: NSManagedObjectContext = appDel.managedObjectContext
//            
//            let newData = NSEntityDescription.insertNewObjectForEntityForName("PageTwo", inManagedObjectContext: context)
//            
//            
//            newData.setValue(typeColisionField.text,forKey: "tipoColision")
//            newData.setValue(eventField.text,forKey: "evento")
//            newData.setValue(eventLocationField.text,forKey: "localizacionEvento")
//            newData.setValue(mannerColisionField.text,forKey:"formaColision")
//            newData.setValue(condition1Field.text,forKey:"clima1")
//            newData.setValue(condition2Field.text,forKey:"clima2")
//            newData.setValue(visibilidadConditionField.text,forKey:"visibilidad")
//            newData.setValue(pavimentCondition.text,forKey:"pavimento")
//            newData.setValue(circunstanciaAmbientalField.text,forKey:"ambiente")
//            newData.setValue(circunstanciaCarreteraField.text,forKey:"carretera")
//            newData.setValue(interseccionDesnivelField.text,forKey:"interseccionDesnivel")
//            //newData.setValue ("direccionField.text",forKey:"fechaAccidente")
//            newData.setValue(lugarEspecificoField.text,forKey:"lugarEspecifico")
//            newData.setValue(tipoIntersecciónField.text,forKey:"tipoInterseccion")
//            newData.setValue(RelacionadoOmnibusField.text,forKey:"omnibus")
//            newData.setValue(relacionField.text,forKey:"areaConstruccionOMantenimiento")
//            newData.setValue(localizacionAccidenteField.text,forKey:"localizacionAcidente")
//            newData.setValue(typezonaField.text,forKey:"tipoZonaTrabajo")
//            // newData.setValue(propertyTypeField.text,forKey:"tipoPropiedad")
//            newData.setValue(trabajadoresPresentesField.text,forKey:"trabajadoresPresentes")
//            newData.setValue(policiaPresenteField.text,forKey:"policiaPresente")
//            
//            let request = NSFetchRequest(entityName: "PageTwo")
//        
//        request.returnsObjectsAsFaults = false
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
//                    print(result.valueForKey("clima1")!)
//                    print(result.valueForKey("clima2")!)
//                    print(result.valueForKey("evento")!)
//                    print(result.valueForKey("tipoColision")!)
//                    print(result.valueForKey("localizacionEvento")!)
//                    print(result.valueForKey("formaColision")!)
//                    print(result.valueForKey("visibilidad")!)
//                    print(result.valueForKey("pavimento")!)
//                    print(result.valueForKey("ambiente")!)
//                    print(result.valueForKey("carretera")!)
//                    print(result.valueForKey("interseccionDesnivel")!)
//                    print(result.valueForKey("lugarEspecifico")!)
//                    print(result.valueForKey("tipoInterseccion")!)
//                    print(result.valueForKey("omnibus")!)
//                    print(result.valueForKey("areaConstruccionOMantenimiento")!)
//                    print(result.valueForKey("localizacionAcidente")!)
//                    print(result.valueForKey("tipoZonaTrabajo")!)
//                    print(result.valueForKey("trabajadoresPresentes")!)
//                    print(result.valueForKey("policiaPresente")!)
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
//        
//            
//            
//        
//        
//        print ("******************")
//        
//        
//
        
    }
    
    
    
    @IBAction func clear(sender: AnyObject) {
        typeColisionField.text = ""
        eventField.text = ""
        eventLocationField.text = ""
        mannerColisionField.text = ""
        condition1Field.text = ""
        condition2Field.text = ""
        visibilidadConditionField.text = ""
        pavimentCondition.text = ""
        circunstanciaAmbientalField.text = ""
        circunstanciaCarreteraField.text = ""
        interseccionDesnivelField.text = ""
        lugarEspecificoField.text = ""
        tipoIntersecciónField.text = ""
        RelacionadoOmnibusField.text = ""
        relacionField.text = ""
        localizacionAccidenteField.text = ""
        typezonaField.text = ""
        trabajadoresPresentesField.text = ""
        policiaPresenteField.text = ""
        
    }
    
    
    
}
