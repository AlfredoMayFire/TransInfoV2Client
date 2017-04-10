//
//  PersonExtendedViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 8/8/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class PersonExtendedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
//    @IBOutlet weak var categoriaPerson: SwiftDropDownList!
//    @IBOutlet weak var personType: SwiftDropDownList!
    
    
    @IBOutlet weak var rowField: SwiftDropDownList!
    @IBOutlet weak var seatField: SwiftDropDownList!
    @IBOutlet weak var otherLocationField: SwiftDropDownList!
    @IBOutlet weak var restraintSystemField: SwiftDropDownList!
    @IBOutlet weak var usoCascoMotocicleta: SwiftDropDownList! // No lo uso, en el prototipo no se muestra.
    @IBOutlet weak var airbagsActiviationField: SwiftDropDownList!
    @IBOutlet weak var expulsionField: SwiftDropDownList!
    @IBOutlet weak var relacionadoVelocidaField: SwiftDropDownList!
    @IBOutlet weak var extractionField: SwiftDropDownList!
    @IBOutlet weak var circunstanciasConductorField: SwiftDropDownList!
    @IBOutlet weak var conductorDistraidoBy: SwiftDropDownList!
    @IBOutlet weak var condicionMomentoAccidente: SwiftDropDownList!
    @IBOutlet weak var equipoSeguridadUsado: SwiftDropDownList!
    @IBOutlet weak var estadoPrueba: SwiftDropDownList!
    @IBOutlet weak var tipoPrueba: SwiftDropDownList!
    @IBOutlet weak var resultado: SwiftDropDownList!
    @IBOutlet weak var usoSustanciasControladas: SwiftDropDownList!
    @IBOutlet weak var actionPriorToCrash: SwiftDropDownList!
    @IBOutlet weak var walkScholl: SwiftDropDownList!
    @IBOutlet weak var accionesMomentoAccident: SwiftDropDownList!
    @IBOutlet weak var localizacionMomentoAccident: SwiftDropDownList!
    @IBOutlet weak var usoAlcoholField: SwiftDropDownList!
    @IBOutlet weak var resultadoPruebaField: SwiftDropDownList!
    
    
    @IBOutlet weak var personTransport: SwiftDropDownList!
    @IBOutlet weak var transportedBy: SwiftDropDownList!
    @IBOutlet weak var TransportedTo: UITextField!
    @IBOutlet weak var MedicalEmergenciesNumber: UITextField!
    @IBOutlet weak var AmbulanceCSPNumber: UITextField!
    
    
    
    @IBOutlet weak var categoriaPersonField: SwiftDropDownList!
    @IBOutlet weak var typePersonField: SwiftDropDownList!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var genderField: UITextField!
 
    var fetchedResultsController: NSFetchedResultsController!
    var fetchedResultsControllerI: NSFetchedResultsController!
    
    @IBOutlet weak var estadoPruebaDosField: UITextField!
    @IBOutlet weak var tipoPruebaDosField: UITextField!
  //  @IBOutlet weak var resultadoPruebaField: UITextField!
  
    
    @IBOutlet weak var listVehiculos: UITableView!
    
    
    var vehiculos = [NSManagedObject]()
    var modifierVehiculos = 0
    var object = [NSManagedObject]()
    var infracciones = [NSManagedObject]()
    var modifierInfracciones = 0

    @IBOutlet weak var listaInfracciones: UITableView!
    
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
    
    
    
    
    
    var objectNum = Int()
    var isUpdating = false
    
    //Actualizacion de webservice y diccionarios
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "PageThirteen")
//        
//        do {
//            
//            
//            let results = try context.executeFetchRequest(request)
//            //print(results.count)
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    
//                    if let waySchool = result.valueForKey("waySchool") as? String {
//                        
//                    }
//                    
//                }
//            }
//        }catch{
//            print("Error")
//        }
        

//        
//        listaInfracciones.delegate = self
//        listaInfracciones.dataSource = self
        
//        listaInfracciones.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
//        listVehiculos.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        let webServicesObject1 = WebService.init()
        webServicesObject1.initiate(3)
        
        categoriaPersonField.isKeyboardHidden = true
        categoriaPersonField.isDismissWhenSelected = true
        categoriaPersonField.isArrayWithObject = true
        categoriaPersonField.keyPath = "DescriptionES"
        categoriaPersonField.arrayList = webServicesObject1.arrayOfDictionaries("personTypeCategories")
        typePersonField.isKeyboardHidden = true
        typePersonField.isDismissWhenSelected = true
        typePersonField.isArrayWithObject = true
        typePersonField.keyPath = "DescriptionES"
        typePersonField.arrayList = webServicesObject1.arrayOfDictionaries("personTypes")
        transportedBy.isKeyboardHidden = true
        transportedBy.isDismissWhenSelected = true
        transportedBy.isArrayWithObject = true
        transportedBy.keyPath = "DescriptionES"
        transportedBy.arrayList = webServicesObject1.arrayOfDictionaries("organDonor")
        
    

        
        
        let webServicesObject = WebService.init()
        webServicesObject.initiate(4)
        
        print(dictionaryA["name"])
        
        nameField.text = dictionaryA["name"]
        categoriaPersonField.text = dictionaryA["categoriaPersona"]
        typePersonField.text = dictionaryA["tipoPersona"]
        genderField.text = dictionaryA["genero"]
        
        rowField.isKeyboardHidden = true
        rowField.isDismissWhenSelected = true
        rowField.isArrayWithObject = true
        rowField.keyPath = "DescriptionES"
        rowField.arrayList = webServicesObject.arrayOfDictionaries("rows")
        
        seatField.isKeyboardHidden = true
        seatField.isDismissWhenSelected = true
        seatField.isArrayWithObject = true
        seatField.keyPath = "DescriptionES"
        seatField.arrayList = webServicesObject.arrayOfDictionaries("seats")
        
        otherLocationField.isKeyboardHidden = true
        otherLocationField.isDismissWhenSelected = true
        otherLocationField.isArrayWithObject = true
        otherLocationField.keyPath = "DescriptionES"
        otherLocationField.arrayList = webServicesObject.arrayOfDictionaries("seatingOthers")
        
        restraintSystemField.isKeyboardHidden = true
        restraintSystemField.isDismissWhenSelected = true
        restraintSystemField.isArrayWithObject = true
        restraintSystemField.keyPath = "DescriptionES"
        restraintSystemField.arrayList = webServicesObject.arrayOfDictionaries("restraintSystems")
        
        airbagsActiviationField.isKeyboardHidden = true
        airbagsActiviationField.isDismissWhenSelected = true
        airbagsActiviationField.isArrayWithObject = true
        airbagsActiviationField.keyPath = "DescriptionES"
        airbagsActiviationField.arrayList = webServicesObject.arrayOfDictionaries("airbagDeployed")
        
        expulsionField.isKeyboardHidden = true
        expulsionField.isDismissWhenSelected = true
        expulsionField.isArrayWithObject = true
        expulsionField.keyPath = "DescriptionES"
        expulsionField.arrayList = webServicesObject.arrayOfDictionaries("ejections")
        
        relacionadoVelocidaField.isKeyboardHidden = true
        relacionadoVelocidaField.isDismissWhenSelected = true
        relacionadoVelocidaField.isArrayWithObject = true
        relacionadoVelocidaField.keyPath = "DescriptionES"
        relacionadoVelocidaField.arrayList = webServicesObject.arrayOfDictionaries("speedingSuspected")
        
        circunstanciasConductorField.isKeyboardHidden = true
        circunstanciasConductorField.isDismissWhenSelected = true
        circunstanciasConductorField.isArrayWithObject = true
        circunstanciasConductorField.keyPath = "DescriptionES"
        circunstanciasConductorField.arrayList = webServicesObject.arrayOfDictionaries("contribActionsCircumstances")
        
        conductorDistraidoBy.isKeyboardHidden = true
        conductorDistraidoBy.isDismissWhenSelected = true
        conductorDistraidoBy.isArrayWithObject = true
        conductorDistraidoBy.keyPath = "DescriptionES"
        conductorDistraidoBy.arrayList = webServicesObject.arrayOfDictionaries("distractedBy")
        
        condicionMomentoAccidente.isKeyboardHidden = true
        condicionMomentoAccidente.isDismissWhenSelected = true
        condicionMomentoAccidente.isArrayWithObject = true
        condicionMomentoAccidente.keyPath = "DescriptionES"
        condicionMomentoAccidente.arrayList = webServicesObject.arrayOfDictionaries("conditions")
        
        equipoSeguridadUsado.isKeyboardHidden = true
        equipoSeguridadUsado.isDismissWhenSelected = true
        equipoSeguridadUsado.isArrayWithObject = true
        equipoSeguridadUsado.keyPath = "DescriptionES"
        equipoSeguridadUsado.arrayList = webServicesObject.arrayOfDictionaries("safetyEquipments")
        
        estadoPrueba.isKeyboardHidden = true
        estadoPrueba.isDismissWhenSelected = true
        estadoPrueba.isArrayWithObject = true
        estadoPrueba.keyPath = "DescriptionES"
        estadoPrueba.arrayList = webServicesObject.arrayOfDictionaries("testStatuses")
        
        tipoPrueba.isKeyboardHidden = true
        tipoPrueba.isDismissWhenSelected = true
        tipoPrueba.isArrayWithObject = true
        tipoPrueba.keyPath = "DescriptionES"
        tipoPrueba.arrayList = webServicesObject.arrayOfDictionaries("drugTestTypes")

        
        resultado.isKeyboardHidden = true
        resultado.isDismissWhenSelected = true
        resultado.isArrayWithObject = true
        resultado.keyPath = "DescriptionES"
        resultado.arrayList = webServicesObject.arrayOfDictionaries("alcoholTestResults")
        
        usoSustanciasControladas.isKeyboardHidden = true
        usoSustanciasControladas.isDismissWhenSelected = true
        usoSustanciasControladas.isArrayWithObject = true
        usoSustanciasControladas.keyPath = "DescriptionES"
        usoSustanciasControladas.arrayList = webServicesObject.arrayOfDictionaries("substancesSuspected")
        
        actionPriorToCrash.isKeyboardHidden = true
        actionPriorToCrash.isDismissWhenSelected = true
        actionPriorToCrash.isArrayWithObject = true
        actionPriorToCrash.keyPath = "DescriptionES"
        actionPriorToCrash.arrayList = webServicesObject.arrayOfDictionaries("actionsPriorToCrash")
        

        walkScholl.isKeyboardHidden = true
        walkScholl.isDismissWhenSelected = true
        walkScholl.isArrayWithObject = true
        walkScholl.keyPath = "DescriptionES"
        walkScholl.arrayList = webServicesObject.arrayOfDictionaries("toFromSchool") // si np desconoce
        
        accionesMomentoAccident.isKeyboardHidden = true
        accionesMomentoAccident.isDismissWhenSelected = true
        accionesMomentoAccident.isArrayWithObject = true
        accionesMomentoAccident.keyPath = "DescriptionES"
        accionesMomentoAccident.arrayList = webServicesObject.arrayOfDictionaries("actionsAtTimeOfCrash")
        
        localizacionMomentoAccident.isKeyboardHidden = true
        localizacionMomentoAccident.isDismissWhenSelected = true
        localizacionMomentoAccident.isArrayWithObject = true
        localizacionMomentoAccident.keyPath = "DescriptionES"
        localizacionMomentoAccident.arrayList = webServicesObject.arrayOfDictionaries("nonMotoristLocations")
        
        extractionField.isKeyboardHidden = true
        extractionField.isDismissWhenSelected = true
        extractionField.isArrayWithObject = true
        extractionField.keyPath = "DescriptionES"
        extractionField.arrayList = webServicesObject.arrayOfDictionaries("extrications")
        
        extractionField.isKeyboardHidden = true
        extractionField.isDismissWhenSelected = true
        extractionField.isArrayWithObject = true
        extractionField.keyPath = "DescriptionES"
        extractionField.arrayList = webServicesObject.arrayOfDictionaries("extrications")
        
        usoAlcoholField.isKeyboardHidden = true
        usoAlcoholField.isDismissWhenSelected = true
        usoAlcoholField.isArrayWithObject = true
        usoAlcoholField.keyPath = "DescriptionES"
        usoAlcoholField.arrayList = webServicesObject.arrayOfDictionaries("substancesSuspected")
        
        resultadoPruebaField.isKeyboardHidden = true
        resultadoPruebaField.isDismissWhenSelected = true
        resultadoPruebaField.isArrayWithObject = true
        resultadoPruebaField.keyPath = "DescriptionES"
        resultadoPruebaField.arrayList = webServicesObject.arrayOfDictionaries("drugTestResults")
        //
        
        //nameField.text = dictionary["name"]
       //categoriaPersonField.text = dictionary["categoriaPersona"]
        //typePersonField.text = dictionary["tipoPersona"]
        //genderField.text = dictionary["genero"]
        rowField.text =  dictionary["row"]
        seatField.text = dictionary["seat"]
        otherLocationField.text = dictionary["otherLocation"]
        restraintSystemField.text = dictionary["restraintSystem"]
        airbagsActiviationField.text = dictionary["airbagActivation"]
        expulsionField.text = dictionary["expulsion"]
        extractionField.text = dictionary["extractionDescription"]
        relacionadoVelocidaField.text = dictionary["speedRelatedDescription"]
        conductorDistraidoBy.text = dictionary["distractedDriver"]
        equipoSeguridadUsado.text = dictionary["safetyEquipment"]
        usoAlcoholField.text = dictionary["suspectAlcohol"]
        usoSustanciasControladas.text = dictionary["suspectSubst"]
        estadoPrueba.text = dictionary["testStatusAl"]
        tipoPrueba.text = dictionary["testTypeAl"]
        resultado.text =  dictionary["testResultAl"]
        resultadoPruebaField.text = dictionary["testResultSubst"]
        estadoPruebaDosField.text = dictionary["testStatusSubst"]
        tipoPruebaDosField.text = dictionary["testTypeSubst"]
        walkScholl.text = dictionary["waySchool"]
        localizacionMomentoAccident.text = dictionary["locationWhenCollision"]
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "PageTen")
//        
//        do {
//            
//            
//            let results = try context.executeFetchRequest(request)
//            if results.count > 0 {
//                
//                for result in results as! [NSManagedObject] {
//                    //1)
//                    if let idHolder = objectNum as? Int{
//                        if idHolder == result.valueForKey("objectNum") as? Int{
//                            
//                            print("is updating")
//                            isUpdating = true
//                        }
//                    }
//                    
//                    //2)
//                    
//                }
//            }
//        }catch{
//            print("Error")
//        }
//
//        //, , , ""
        scrollView.contentSize.height = 5000
//        
//        
//        //tableLoads
//        
//        let requested = NSFetchRequest(entityName: "PageFour")
//        
//        //let departmentSort = NSSortDescriptor(key: "numDeTablilla", ascending: true)
//        requested.sortDescriptors = []
//        //let moc = dataController.managedObjectContext
//        fetchedResultsController = NSFetchedResultsController(fetchRequest: requested, managedObjectContext: context,sectionNameKeyPath: "numDeTablilla", cacheName: "rootCache")
//        fetchedResultsController.delegate = self as? NSFetchedResultsControllerDelegate
//        
//        do {
//            try fetchedResultsController.performFetch()
//        } catch {
//            fatalError("Failed to initialize FetchedResultsController: \(error)")
//        }
//        
//        let requestedI = NSFetchRequest(entityName: "PageTwelve")
//        
//        //let departmentSort = NSSortDescriptor(key: "numDeTablilla", ascending: true)
//        requestedI.sortDescriptors = []
//        //let moc = dataController.managedObjectContext
//        fetchedResultsControllerI = NSFetchedResultsController(fetchRequest: requestedI, managedObjectContext: context,sectionNameKeyPath: "articleNumber", cacheName: "rootCache")
//        fetchedResultsControllerI.delegate = self as? NSFetchedResultsControllerDelegate
//        
//        do {
//            try fetchedResultsControllerI.performFetch()
//        } catch {
//            fatalError("Failed to initialize FetchedResultsController: \(error)")
//        }
//
//        
//        listVehiculos.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cellIdentifier")
//        listaInfracciones.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //todo lo de guardar y post
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        // usoCascoMotocicleta.text // No lo uso, en el prototipo no se muestra.
        
        
        
        
        //circunstanciasConductorField.text
        
        //condicionMomentoAccidente.text
        
        
        
        
        //seleccion multiple. every time table touched save object
        // actionPriorToCrash.text
        
        //accionesMomentoAccident.text
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        
//        //HACE UPDATES AL CORE DATA SI YA EXISTE OBJETO CON ESE NUMERO, SI NO CREA NUEVO ASOCIADO A LA PERSONA
//        if isUpdating{
//            do {
//                let request1 = NSFetchRequest(entityName: "PageTen")
//                let results1 = try context.executeFetchRequest(request1)
//                
//                if results1.count > 0 {
//                    
//                    for result in results1 as! [NSManagedObject] {
//                        if result.valueForKey("objectNum") as? Int == objectNum {
//                            result.setValue(rowField.text,forKey: "row")
//                            result.setValue(seatField.text,forKey: "seat")
//                            result.setValue(otherLocationField.text,forKey: "otherLocation")
//                            result.setValue(restraintSystemField.text,forKey:"restraintSystem")
//                            result.setValue(airbagsActiviationField.text,forKey:"airbagActivation")
//                            result.setValue(expulsionField.text,forKey:"expulsion")
//                            result.setValue(extractionField.text,forKey:"extractionDescription")
//                            result.setValue(relacionadoVelocidaField.text, forKey: "speedRelatedDescription")
//                            result.setValue(conductorDistraidoBy.text,forKey: "distractedDriver")
//                            result.setValue(equipoSeguridadUsado.text,forKey: "safetyEquipment")
//
//                        if result.valueForKey("objectNum") as? Int == 0 {
//                                context.deleteObject(result)
//                                do{
//                                    try context.save()
//                                }catch{
//                                    print("couldn't do it")
//                                }
//                            }
//                        }
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
//            //entity two
//            do {
//                let request2 = NSFetchRequest(entityName: "PageEleven")
//                
//                let results2 = try context.executeFetchRequest(request2)
//                
//                if results2.count > 0 {
//                    
//                    for result in results2 as! [NSManagedObject] {
//                        if result.valueForKey("objectNum") as? Int == objectNum {
//                            
//                            result.setValue(usoAlcoholField.text,forKey: "suspectAlcohol")
//                            result.setValue(usoSustanciasControladas.text,forKey: "suspectSubst")
//                            result.setValue(estadoPrueba.text,forKey: "testStatusAl")
//                            result.setValue(tipoPrueba.text,forKey: "testTypeAl")
//                            result.setValue(resultado.text,forKey: "testResultAl")
//                            result.setValue(resultadoPruebaField.text, forKey:"testResultSubst")
//                            result.setValue(estadoPruebaDosField.text, forKey: "testStatusSubst")
//                            result.setValue(tipoPruebaDosField.text, forKey: "testTypeSubst")
//
//                            //falta uno?
//                            
//                            if result.valueForKey("objectNum") as? Int == 0 {
//                                context.deleteObject(result)
//                                do{
//                                    try context.save()
//                                }catch{
//                                    print("couldn't do it")
//                                }
//                            }
//                        }
//                    }
//                }
//                do {
//                    try context.save()
//                } catch {
//                    print("There was a problem!")
//                }
//                
//            }catch{
//                print("Error")
//            }
//            //entity three
//            do {
//                let request3 = NSFetchRequest(entityName: "PageThirteen")
//                
//                
//                let results3 = try context.executeFetchRequest(request3)
//                if results3.count > 0 {
//                    
//                    for result in results3 as! [NSManagedObject] {
//                        if result.valueForKey("objectNum") as? Int == objectNum {
//                            
//                           
//                                                        result.setValue(walkScholl.text, forKey: "waySchool")
//                            result.setValue(localizacionMomentoAccident.text, forKey: "locationWhenCollision")
//            
//                            if result.valueForKey("objectNum") as? Int == 0 {
//                                context.deleteObject(result)
//                                do{
//                                    try context.save()
//                                }catch{
//                                    print("couldn't do it")
//                                }
//                            }
//                        }
//                    }
//                }
//                do {
//                    try context.save()
//                } catch {
//                    print("There was a problem!")
//                }
//                
//            }catch{
//                print("Error")
//            }
//        }
//        else{
//            let newData = NSEntityDescription.insertNewObjectForEntityForName("PageTen", inManagedObjectContext: context)
//            
//            print(objectNum)
//            print(dictionary["testResultAl"])
//            newData.setValue(rowField.text,forKey: "row")
//            newData.setValue(seatField.text,forKey: "seat")
//            newData.setValue(otherLocationField.text,forKey: "otherLocation")
//            newData.setValue(restraintSystemField.text,forKey:"restraintSystem")
//            newData.setValue(airbagsActiviationField.text,forKey:"airbagActivation")
//            newData.setValue(expulsionField.text,forKey:"expulsion")
//            newData.setValue(extractionField.text,forKey:"extractionDescription")
//            newData.setValue(relacionadoVelocidaField.text, forKey: "speedRelatedDescription")//unsure
//            newData.setValue(conductorDistraidoBy.text, forKey: "distractedDriver")
//            newData.setValue(equipoSeguridadUsado.text, forKey: "safetyEquipment")//kind of unsure?
//            newData.setValue(objectNum, forKey: "objectNum")
//            
//            let secondNewData = NSEntityDescription.insertNewObjectForEntityForName("PageEleven", inManagedObjectContext: context)
//            secondNewData.setValue(usoAlcoholField.text, forKey: "suspectAlcohol")//unsure
//            secondNewData.setValue(usoSustanciasControladas.text, forKey: "suspectSubst")
//            secondNewData.setValue(estadoPrueba.text, forKey: "testStatusAl")
//            secondNewData.setValue(tipoPrueba.text, forKey: "testTypeAl")
//            secondNewData.setValue(resultado.text, forKey: "testResultAl")//unsure if this one or other one
//            secondNewData.setValue(resultadoPruebaField.text, forKey: "testResultSubst")
//            secondNewData.setValue(estadoPruebaDosField.text, forKey: "testStatusSubst")
//            secondNewData.setValue(tipoPruebaDosField.text, forKey: "testTypeSubst")
//            secondNewData.setValue(objectNum, forKey: "objectNum")
//            
//            let thirdNewData = NSEntityDescription.insertNewObjectForEntityForName("PageThirteen", inManagedObjectContext: context)
//            
//            thirdNewData.setValue(walkScholl.text, forKey: "waySchool")
//            thirdNewData.setValue(localizacionMomentoAccident.text, forKey: "locationWhenCollision")
//            thirdNewData.setValue(objectNum, forKey: "objectNum")
//    
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
        print ("------------")
        
        //  print (typeAccident.text)
        
        let  webServicesObjectPOST = WebService.init()
        
        //InformationforVehicleOcuppants
        
        webServicesObjectPOST.addIData("Row", value: rowField.text)
        
        webServicesObjectPOST.addIData("Seat", value: seatField.text)
        
        webServicesObjectPOST.addIData("OtherLocation", value: otherLocationField.text)
        
        webServicesObjectPOST.addIData("RestraintSystem", value: restraintSystemField.text)
        
        webServicesObjectPOST.addIData("AirbagActivation", value: airbagsActiviationField.text)
        
        webServicesObjectPOST.addIData("Expulsion", value: expulsionField.text)
        
        webServicesObjectPOST.addIData("SpeedRelatedDescription", value: relacionadoVelocidaField.text)
        
        webServicesObjectPOST.addIData("ExtractionDescription", value: extractionField.text)
        
        // Selection Driver Cirncusntance. ContribActionsCirncustanceS
        
        // ContribActionsCirmstanceFK
        
        //IdPersonInformationVehicleOccupantFK
        
        //idNewPersonFK
        
        //idNewVehicleFK
        
        //webServicesObjectPOST.addIData("contribActionsCircumstances", value: circunstanciasConductorField.text)
        
        
        
        webServicesObjectPOST.addIData("DistractedDriver", value: conductorDistraidoBy.text)
        
        webServicesObjectPOST.addIData("conditions", value: condicionMomentoAccidente.text)
        
        webServicesObjectPOST.addIData("SafetyEquipment", value: equipoSeguridadUsado.text)
        
        //Existe un SafetyEquipment Selection, SafetyEquipmentIDFK, idPersonVehicleOccupantFK, idNewVehicleFK, idNewPersonFK
        
        //Captura idNewPersonFK
        
        //Captura idNewVehicleFK
        
        //InformationAllPerson
        
        webServicesObjectPOST.addIData("SuspectAlcohol", value: usoAlcoholField.text)
        
        webServicesObjectPOST.addIData("TestStatusAl", value: estadoPrueba.text)
        
        webServicesObjectPOST.addIData("TestTypeAl", value: tipoPrueba.text)
        
        webServicesObjectPOST.addIData("TestResultAl", value: resultado.text)
        
        webServicesObjectPOST.addIData("SuspectSubst", value: usoSustanciasControladas.text)
        
        webServicesObjectPOST.addIData("TestStatusSubst", value: estadoPruebaDosField.text)
        
        webServicesObjectPOST.addIData("TestTypeSubst", value: tipoPruebaDosField.text)
        
        webServicesObjectPOST.addIData("TestResultSubst", value: resultadoPruebaField.text)
        
        //captura idLawInfractionFK, idNewVehicleFK, idNewPersonFK
        
        
        
        //INFORMATION PCV
        
        //Selection Action Prior to Crash. ActionTimeSelection
        
        // actionPriorToCrashIDFK
        
        //idInformationPCVFK
        
        //idNewVehicleFK
        
        //idNewPersonFK
        
        //webServicesObjectPOST.addIData("actionPrior", value: actionPriorToCrash.text)
        
        webServicesObjectPOST.addIData("WaySchool", value: walkScholl.text)
        
        //Selection Time. ActionCollisionTime
        
        //contribActionsCircumstanceIDFK
        
        //idInformationPCFK
        
        //idNewVehicleFK
        
        //idNewPersonFK
        
        //webServicesObjectPOST.addIData("accionesMomentoAccident.text", value: accionesMomentoAccident.text)
        
        webServicesObjectPOST.addIData("locationWhenCollision", value: localizacionMomentoAccident.text)
        
        
        
        
        let webServicesObjectPOST1 = WebService.init()
        
        webServicesObjectPOST1.addIData("TransportedByMedicalEmergencies", value: personTransport.text)
        
        webServicesObjectPOST1.addIData("TransportedTo", value: TransportedTo.text)
        
        webServicesObjectPOST1.addIData("TransportedBy", value: transportedBy.text)
        
        webServicesObjectPOST1.addIData("MedicalEmergenciesNumber", value: MedicalEmergenciesNumber.text)
        
        webServicesObjectPOST1.addIData("AmbulanceCSPNumber", value: AmbulanceCSPNumber.text)
        webServicesObjectPOST1.addIData("PersonaCategory", value: categoriaPersonField.text)
        
        webServicesObjectPOST1.addIData("PersonaType", value: typePersonField.text)
        
        webServicesObjectPOST1.sendPOSTs(5)
        
        performSegueWithIdentifier("PersonReturnToTable", sender: self)
        
    }

    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        
//        
//        let fetchRequest = NSFetchRequest(entityName: "PageTwelve")
//        
//        //3
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            infracciones = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
        //listaInfracciones.reloadData()

    }
    
//    override func viewDidAppear(animated: Bool) {
//        //1
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        
//        
//        let fetchRequest = NSFetchRequest(entityName: "PageTwelve")
//        
//        //3
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            object = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//        listaInfracciones.reloadData()
//   
//    }
    
    @IBAction func unwindToPersonExtended(segue: UIStoryboardSegue) {
    }

    @IBAction func submit(sender: AnyObject) {
        print ("------------")
        
        //  print (typeAccident.text)
        
        let  webServicesObjectPOST = WebService.init()
        
        //InformationforVehicleOcuppants
        
        webServicesObjectPOST.addIData("Row", value: rowField.text)
        
        webServicesObjectPOST.addIData("Seat", value: seatField.text)
        
        webServicesObjectPOST.addIData("OtherLocation", value: otherLocationField.text)
        
        webServicesObjectPOST.addIData("RestraintSystem", value: restraintSystemField.text)
        
        webServicesObjectPOST.addIData("AirbagActivation", value: airbagsActiviationField.text)
        
        webServicesObjectPOST.addIData("Expulsion", value: expulsionField.text)
        
        webServicesObjectPOST.addIData("SpeedRelatedDescription", value: relacionadoVelocidaField.text)
        
        webServicesObjectPOST.addIData("ExtractionDescription", value: extractionField.text)
        
        // Selection Driver Cirncusntance. ContribActionsCirncustanceS
        
        // ContribActionsCirmstanceFK
        
        //IdPersonInformationVehicleOccupantFK
        
        //idNewPersonFK
        
        //idNewVehicleFK
        
        //webServicesObjectPOST.addIData("contribActionsCircumstances", value: circunstanciasConductorField.text)
        
        
        
        webServicesObjectPOST.addIData("DistractedDriver", value: conductorDistraidoBy.text)
        
        webServicesObjectPOST.addIData("conditions", value: condicionMomentoAccidente.text)
        
        webServicesObjectPOST.addIData("SafetyEquipment", value: equipoSeguridadUsado.text)
        
        //Existe un SafetyEquipment Selection, SafetyEquipmentIDFK, idPersonVehicleOccupantFK, idNewVehicleFK, idNewPersonFK
        
        //Captura idNewPersonFK
        
        //Captura idNewVehicleFK
        
        //InformationAllPerson
        
        webServicesObjectPOST.addIData("SuspectAlcohol", value: usoAlcoholField.text)
        
        webServicesObjectPOST.addIData("TestStatusAl", value: estadoPrueba.text)
        
        webServicesObjectPOST.addIData("TestTypeAl", value: tipoPrueba.text)
        
        webServicesObjectPOST.addIData("TestResultAl", value: resultado.text)
        
        webServicesObjectPOST.addIData("SuspectSubst", value: usoSustanciasControladas.text)
        
        webServicesObjectPOST.addIData("TestStatusSubst", value: estadoPruebaDosField.text)
        
        webServicesObjectPOST.addIData("TestTypeSubst", value: tipoPruebaDosField.text)
        
        webServicesObjectPOST.addIData("TestResultSubst", value: resultadoPruebaField.text)
        
        //captura idLawInfractionFK, idNewVehicleFK, idNewPersonFK
        
        
        
        //INFORMATION PCV
        
        //Selection Action Prior to Crash. ActionTimeSelection
        
        // actionPriorToCrashIDFK
        
        //idInformationPCVFK
        
        //idNewVehicleFK
        
        //idNewPersonFK
        
        //webServicesObjectPOST.addIData("actionPrior", value: actionPriorToCrash.text)
        
        webServicesObjectPOST.addIData("WaySchool", value: walkScholl.text)
        
        //Selection Time. ActionCollisionTime
        
        //contribActionsCircumstanceIDFK
        
        //idInformationPCFK
        
        //idNewVehicleFK
        
        //idNewPersonFK
        
        //webServicesObjectPOST.addIData("accionesMomentoAccident.text", value: accionesMomentoAccident.text)
        
        webServicesObjectPOST.addIData("locationWhenCollision", value: localizacionMomentoAccident.text)
        
        //captura idNewVehiclesFK, idNewPersonFK
        
        webServicesObjectPOST.sendPOSTs(7)
    }
    
    //TABLE LOADING
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {

//            guard let selectedObject = fetchedResultsControllerI.objectAtIndexPath(indexPath) as? NSManagedObject else { fatalError("Unexpected Object in FetchedResultsController")
//            }
//            // Populate cell from the NSManagedObject instance
//            print("Object for configuration: \(selectedObject)")
//
        }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = listaInfracciones.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            // Set up the cell
//            configureCell(cell, indexPath: indexPath)
//            let object = infracciones[indexPath.row + modifierVehiculos]
//            if modifierVehiculos<infracciones.count{
//                modifierVehiculos += 1
//            }
//            cell.textLabel?.text = object.valueForKey("articleNumber") as? String
            return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 0//fetchedResultsControllerI.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//            guard let sections = fetchedResultsControllerI.sections else {
//                fatalError("No sections in fetchedResultsController")
//            }
//            let sectionInfo = sections[section]
            return 0//sectionInfo.numberOfObjects
    }
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        listaInfracciones.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            listaInfracciones.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            listaInfracciones.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Move:
            break
        case .Update:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            listaInfracciones.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            listaInfracciones.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Update:
            configureCell(listaInfracciones.cellForRowAtIndexPath(indexPath!)!, indexPath: indexPath!)
        case .Move:
            listaInfracciones.moveRowAtIndexPath(indexPath!, toIndexPath: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        listaInfracciones.endUpdates()
    }

    
    
    
}
