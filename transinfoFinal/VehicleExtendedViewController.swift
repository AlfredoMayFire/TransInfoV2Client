//
//  VehicleExtendedViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/31/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class VehicleExtendedViewController: UIViewController{
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var typeVehicleField: SwiftDropDownList!
    @IBOutlet weak var direccionViajeField: SwiftDropDownList!
    @IBOutlet weak var funcionEspecialField: SwiftDropDownList!
    @IBOutlet weak var usoVehiculoField: SwiftDropDownList!
    @IBOutlet weak var maniobraField: SwiftDropDownList!
    @IBOutlet weak var roadDescriptionField: SwiftDropDownList!
    @IBOutlet weak var alineamientoField: SwiftDropDownList!
    @IBOutlet weak var inclinacionField: SwiftDropDownList!
    @IBOutlet weak var categoriaField: SwiftDropDownList!
    @IBOutlet weak var typeCarrilField: SwiftDropDownList!
    @IBOutlet weak var tipoControlesField: SwiftDropDownList!
    @IBOutlet weak var operacionField: SwiftDropDownList!
    @IBOutlet weak var primerCategoria: SwiftDropDownList!
    @IBOutlet weak var segundaCategoria: SwiftDropDownList!
    @IBOutlet weak var terceraCategoria: SwiftDropDownList!
    @IBOutlet weak var cuartaCategoria: SwiftDropDownList!
    @IBOutlet weak var primerEvento: SwiftDropDownList!
    @IBOutlet weak var segundoEvento: SwiftDropDownList!
    @IBOutlet weak var tercerEvento: SwiftDropDownList!
    @IBOutlet weak var cuartoEvento: SwiftDropDownList!
    @IBOutlet weak var usoBusField: SwiftDropDownList!
    @IBOutlet weak var abandonoLugarField: SwiftDropDownList!
    @IBOutlet weak var remolcadoField: SwiftDropDownList!
    @IBOutlet weak var primerDefecto: SwiftDropDownList!
    @IBOutlet weak var segundoDefecto: SwiftDropDownList!
    @IBOutlet weak var PuntoInicialField: SwiftDropDownList!
    @IBOutlet weak var areaAfectadaField: SwiftDropDownList!
    @IBOutlet weak var gradoDanioField: SwiftDropDownList!
    @IBOutlet weak var usoVehiculoComercialField: SwiftDropDownList!
    @IBOutlet weak var vehiculoMovimientoField: SwiftDropDownList!
    @IBOutlet weak var conductorAutorizadoField: SwiftDropDownList!
    @IBOutlet weak var inspeccionDiaField: SwiftDropDownList!
    @IBOutlet weak var permisoEspecialField: SwiftDropDownList!
    @IBOutlet weak var pesoBrutoField: SwiftDropDownList!
    

    @IBOutlet weak var confVehiculo: SwiftDropDownList!
    @IBOutlet weak var tipoVehiculoCargaField: SwiftDropDownList!
    @IBOutlet weak var vehiculoContieneMPField: SwiftDropDownList!
    @IBOutlet weak var numeroIdentificacionField: SwiftDropDownList!
    @IBOutlet weak var huboDerrameMPField: SwiftDropDownList!
    
    
    
    @IBOutlet weak var cantidadEjesField: UITextField!
    @IBOutlet weak var numberTablillaField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var marcaField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var mphField: UITextField!
    @IBOutlet weak var mphdosField: UITextField!
    @IBOutlet weak var cantidadField: UITextField!

   var ID = [NSManagedObjectID]()
    
    var seleccionMultiple = [Int]()
    
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
        "initialContactPoint": "",
        ]
    
    var objectNum = Int()
    var isUpdating = false
    

    
    
    @IBAction func guardarCondicionAccident(sender: AnyObject) {
        print ("------------")
        
        //  Vehicle Information
        for count in seleccionMultiple{
            print(seleccionMultiple[count])
        }
        

        
        let  webServicesObjectPOST = WebService.init()
        
        webServicesObjectPOST.addIData("MotorVehicle", value: typeVehicleField.text)
        
        webServicesObjectPOST.addIData("TripDirection", value: direccionViajeField.text)
        
        webServicesObjectPOST.addIData("SpecialFunctionMotor", value: funcionEspecialField.text)
        
        webServicesObjectPOST.addIData("EmergencyUse", value: usoVehiculoField.text)
        
        webServicesObjectPOST.addIData("MPH", value: mphField.text)
        
        webServicesObjectPOST.addIData("PostedSpeedLimit", value: mphdosField.text)
        
        webServicesObjectPOST.addIData("MotorVehicleManeuver", value: maniobraField.text)
        
        //capturar el  idNewVehicleFK
        
        //Information of the road whre the vehicle was passing
        
        webServicesObjectPOST.addIData("RoadDescription", value: roadDescriptionField.text)
        
        webServicesObjectPOST.addIData("Alignment", value: alineamientoField.text)
        
        webServicesObjectPOST.addIData("Slope", value: inclinacionField.text)
        
        webServicesObjectPOST.addIData("Cantidad", value: cantidadField.text)
        
        webServicesObjectPOST.addIData("CategoriaCarril", value: categoriaField.text)
        
        //Selection Tipo Controles de Transito. TCDTypeSlection
        
        //TCDTypeID
        
        //idInformationRoadVehiclePasssing
        
        //idNewVehicleFK
        
        // webServicesObjectPOST.addIData("", value: tipoControlesField.text)
        
        
        
        webServicesObjectPOST.addIData("TipoCarril", value: typeCarrilField.text)
        
        webServicesObjectPOST.addIData("OperationOrLost", value: operacionField.text)
        
        //capturar el  idNewVehicleFK
        
        //Information Event Vehicle
        
        webServicesObjectPOST.addIData("PrimeraCategoria", value: primerCategoria.text)
        
        webServicesObjectPOST.addIData("SegundaCategoria", value: segundaCategoria.text)
        
        webServicesObjectPOST.addIData("TerceraCategoria", value: terceraCategoria.text)
        
        webServicesObjectPOST.addIData("CuartaCategoria", value: cuartaCategoria.text)
        
        webServicesObjectPOST.addIData("PrimerEvento", value: primerEvento.text)
        
        webServicesObjectPOST.addIData("SegundoEvento", value: segundoEvento.text)
        
        webServicesObjectPOST.addIData("TercerEvento", value: tercerEvento.text)
        
        webServicesObjectPOST.addIData("CuartoEvento", value: cuartoEvento.text)
        
        webServicesObjectPOST.addIData("BusUse", value: usoBusField.text)
        
        webServicesObjectPOST.addIData("LeftPlace", value: abandonoLugarField.text)
        
        webServicesObjectPOST.addIData("TowedDamage", value: remolcadoField.text)
        
        webServicesObjectPOST.addIData("PrimerDefectoMecanico", value: primerDefecto.text)
        
        webServicesObjectPOST.addIData("SegundoDefectoMecanico", value: segundoDefecto.text)
        
        //capturar el  idNewVehicleFK
        
        //CommercialVehicleHazardousMaterial
        
        webServicesObjectPOST.addIData("InitialContactPoint", value: PuntoInicialField.text)
        
        //slection Areas Afectasdas AffectAreasSelection.
        
        // capturar IdCommercialVehicleHazardousMaterialFK
        
        //damageAreaIDFK
        
        //idNewVehicleFK
        
        //webServicesObjectPOST.addIData("", value: areaAfectadaField.text)
        
        
        
        webServicesObjectPOST.addIData("ExtendDamage", value: gradoDanioField.text)
        
        webServicesObjectPOST.addIData("CommercialVehicleUse", value: usoVehiculoComercialField.text)
        
        webServicesObjectPOST.addIData("MovingVehicle", value: vehiculoMovimientoField.text)
        
        webServicesObjectPOST.addIData("AuthorizedDriver", value: conductorAutorizadoField.text)
        
        webServicesObjectPOST.addIData("InspectionDate", value: inspeccionDiaField.text)
        
        webServicesObjectPOST.addIData("SpecialPermit", value: permisoEspecialField.text)
        
        webServicesObjectPOST.addIData("GrosWeight", value: pesoBrutoField.text)
        
        webServicesObjectPOST.addIData("TotalAxis", value: cantidadEjesField.text)
        
        webServicesObjectPOST.addIData("VehicleConfiguration", value: confVehiculo.text)
        
        webServicesObjectPOST.addIData("HeavyVehicleType", value: tipoVehiculoCargaField.text)
        
        webServicesObjectPOST.addIData("HazardousMaterial", value: vehiculoContieneMPField.text)
        
        webServicesObjectPOST.addIData("DiamondIdNumber", value: numeroIdentificacionField.text)
        
        webServicesObjectPOST.addIData("DueCollision", value: huboDerrameMPField.text)
        
        //captura el fk vehicle
        
        webServicesObjectPOST.sendPOSTs(6)
        
    }
    
    @IBAction func seleccionMultipleTipoControlesTransito(sender: AnyObject) {
        print("gotIn")
        seleccionMultiple.append(tipoControlesField.selectedIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 2500
        //ws
        
        
        let webServicesObject = WebService.init()
        webServicesObject.initiate(6)
        
        
        
        typeVehicleField.isKeyboardHidden = true
        typeVehicleField.isDismissWhenSelected = true
        typeVehicleField.isArrayWithObject = true
        typeVehicleField.keyPath = "DescriptionES"
        typeVehicleField.arrayList = webServicesObject.arrayOfDictionaries("bodytype")
        
        direccionViajeField.isKeyboardHidden = true
        direccionViajeField.isDismissWhenSelected = true
        direccionViajeField.isArrayWithObject = true
        direccionViajeField.keyPath = "DescriptionES"
        direccionViajeField.arrayList = webServicesObject.arrayOfDictionaries("directionOfTravel")
        
        funcionEspecialField.isKeyboardHidden = true
        funcionEspecialField.isDismissWhenSelected = true
        funcionEspecialField.isArrayWithObject = true
        funcionEspecialField.keyPath = "DescriptionES"
        funcionEspecialField.arrayList = webServicesObject.arrayOfDictionaries("specialFunctions")
        
        usoVehiculoField.isKeyboardHidden = true
        usoVehiculoField.isDismissWhenSelected = true
        usoVehiculoField.isArrayWithObject = true
        usoVehiculoField.keyPath = "DescriptionES"
        usoVehiculoField.arrayList = webServicesObject.arrayOfDictionaries("emergencyUses")
        
        maniobraField.isKeyboardHidden = true
        maniobraField.isDismissWhenSelected = true
        maniobraField.isArrayWithObject = true
        maniobraField.keyPath = "DescriptionES"
        maniobraField.arrayList = webServicesObject.arrayOfDictionaries("actions")
        
        roadDescriptionField.isKeyboardHidden = true
        roadDescriptionField.isDismissWhenSelected = true
        roadDescriptionField.isArrayWithObject = true
        roadDescriptionField.keyPath = "DescriptionES"
        roadDescriptionField.arrayList = webServicesObject.arrayOfDictionaries("trafficwayDescriptions")
        
        alineamientoField.isKeyboardHidden = true
        alineamientoField.isDismissWhenSelected = true
        alineamientoField.isArrayWithObject = true
        alineamientoField.keyPath = "DescriptionES"
        alineamientoField.arrayList = webServicesObject.arrayOfDictionaries("roadwayHorizontalAlignments")
        
        inclinacionField.isKeyboardHidden = true
        inclinacionField.isDismissWhenSelected = true
        inclinacionField.isArrayWithObject = true
        inclinacionField.keyPath = "DescriptionES"
        inclinacionField.arrayList = webServicesObject.arrayOfDictionaries("roadwayGrades")
        
        categoriaField.isKeyboardHidden = true
        categoriaField.isDismissWhenSelected = true
        categoriaField.isArrayWithObject = true
        categoriaField.keyPath = "DescriptionES"
        categoriaField.arrayList = webServicesObject.arrayOfDictionaries("totalLanesCategories")
        
        typeCarrilField.isKeyboardHidden = true
        typeCarrilField.isDismissWhenSelected = true
        typeCarrilField.isArrayWithObject = true
        typeCarrilField.keyPath = "DescriptionES"
        typeCarrilField.arrayList = webServicesObject.arrayOfDictionaries("totalLanes")
        
        tipoControlesField.isKeyboardHidden = true
        tipoControlesField.isDismissWhenSelected = true
        tipoControlesField.isArrayWithObject = true
        tipoControlesField.keyPath = "DescriptionES"
        tipoControlesField.arrayList = webServicesObject.arrayOfDictionaries("TCDTypes")
        
        operacionField.isKeyboardHidden = true
        operacionField.isDismissWhenSelected = true
        operacionField.isArrayWithObject = true
        operacionField.keyPath = "DescriptionES"
        operacionField.arrayList = webServicesObject.arrayOfDictionaries("TCDWorking")
        
        primerCategoria.isKeyboardHidden = true
        primerCategoria.isDismissWhenSelected = true
        primerCategoria.isArrayWithObject = true
        primerCategoria.keyPath = "DescriptionES"
        primerCategoria.arrayList = webServicesObject.arrayOfDictionaries("harmfulEventCategories")
        
        segundaCategoria.isKeyboardHidden = true
        segundaCategoria.isDismissWhenSelected = true
        segundaCategoria.isArrayWithObject = true
        segundaCategoria.keyPath = "DescriptionES"
        segundaCategoria.arrayList = webServicesObject.arrayOfDictionaries("harmfulEventCategories")
        
        terceraCategoria.isKeyboardHidden = true
        terceraCategoria.isDismissWhenSelected = true
        terceraCategoria.isArrayWithObject = true
        terceraCategoria.keyPath = "DescriptionES"
        terceraCategoria.arrayList = webServicesObject.arrayOfDictionaries("harmfulEventCategories")
        
        cuartaCategoria.isKeyboardHidden = true
        cuartaCategoria.isDismissWhenSelected = true
        cuartaCategoria.isArrayWithObject = true
        cuartaCategoria.keyPath = "DescriptionES"
        cuartaCategoria.arrayList = webServicesObject.arrayOfDictionaries("harmfulEventCategories")
        
        primerEvento.isKeyboardHidden = true
        primerEvento.isDismissWhenSelected = true
        primerEvento.isArrayWithObject = true
        primerEvento.keyPath = "DescriptionES"
        primerEvento.arrayList = webServicesObject.arrayOfDictionaries("harmfulEvents")
        
        segundoEvento.isKeyboardHidden = true
        segundoEvento.isDismissWhenSelected = true
        segundoEvento.isArrayWithObject = true
        segundoEvento.keyPath = "DescriptionES"
        segundoEvento.arrayList = webServicesObject.arrayOfDictionaries("harmfulEvents")
        
        tercerEvento.isKeyboardHidden = true
        tercerEvento.isDismissWhenSelected = true
        tercerEvento.isArrayWithObject = true
        tercerEvento.keyPath = "DescriptionES"
        tercerEvento.arrayList = webServicesObject.arrayOfDictionaries("harmfulEvents")
        
        cuartoEvento.isKeyboardHidden = true
        cuartoEvento.isDismissWhenSelected = true
        cuartoEvento.isArrayWithObject = true
        cuartoEvento.keyPath = "DescriptionES"
        cuartoEvento.arrayList = webServicesObject.arrayOfDictionaries("harmfulEvents")
        
        usoBusField.isKeyboardHidden = true
        usoBusField.isDismissWhenSelected = true
        usoBusField.isArrayWithObject = true
        usoBusField.keyPath = "DescriptionES"
        usoBusField.arrayList = webServicesObject.arrayOfDictionaries("schoolBusRelated")
        
        abandonoLugarField.isKeyboardHidden = true
        abandonoLugarField.isDismissWhenSelected = true
        abandonoLugarField.isArrayWithObject = true
        abandonoLugarField.keyPath = "DescriptionES"
        abandonoLugarField.arrayList = webServicesObject.arrayOfDictionaries("hitAndRun")
        
        remolcadoField.isKeyboardHidden = true
        remolcadoField.isDismissWhenSelected = true
        remolcadoField.isArrayWithObject = true
        remolcadoField.keyPath = "DescriptionES"
        remolcadoField.arrayList = webServicesObject.arrayOfDictionaries("towedBy")
        
        primerDefecto.isKeyboardHidden = true
        primerDefecto.isDismissWhenSelected = true
        primerDefecto.isArrayWithObject = true
        primerDefecto.keyPath = "DescriptionES"
        primerDefecto.arrayList = webServicesObject.arrayOfDictionaries("vehicleCircumstances")
        
        segundoDefecto.isKeyboardHidden = true
        segundoDefecto.isDismissWhenSelected = true
        segundoDefecto.isArrayWithObject = true
        segundoDefecto.keyPath = "DescriptionES"
        segundoDefecto.arrayList = webServicesObject.arrayOfDictionaries("vehicleCircumstances")
        
        PuntoInicialField.isKeyboardHidden = true
        PuntoInicialField.isDismissWhenSelected = true
        PuntoInicialField.isArrayWithObject = true
        PuntoInicialField.keyPath = "DescriptionES"
        PuntoInicialField.arrayList = webServicesObject.arrayOfDictionaries("initialContactPoints")
        
        areaAfectadaField.isKeyboardHidden = true
        areaAfectadaField.isDismissWhenSelected = true
        areaAfectadaField.isArrayWithObject = true
        areaAfectadaField.keyPath = "DescriptionES"
        areaAfectadaField.arrayList = webServicesObject.arrayOfDictionaries("damagedAreas")
        
        gradoDanioField.isKeyboardHidden = true
        gradoDanioField.isDismissWhenSelected = true
        gradoDanioField.isArrayWithObject = true
        gradoDanioField.keyPath = "DescriptionES"
        gradoDanioField.arrayList = webServicesObject.arrayOfDictionaries("extentOfDamages")
        
        usoVehiculoComercialField.isKeyboardHidden = true
        usoVehiculoComercialField.isDismissWhenSelected = true
        usoVehiculoComercialField.isArrayWithObject = true
        usoVehiculoComercialField.keyPath = "DescriptionES"
        usoVehiculoComercialField.arrayList = webServicesObject.arrayOfDictionaries("motorCarrierTypes")
        
        vehiculoMovimientoField.isKeyboardHidden = true
        vehiculoMovimientoField.isDismissWhenSelected = true
        vehiculoMovimientoField.isArrayWithObject = true
        vehiculoMovimientoField.keyPath = "DescriptionES"
        vehiculoMovimientoField.arrayList = webServicesObject.arrayOfDictionaries("vehicleMovements")
        
        conductorAutorizadoField.isKeyboardHidden = true
        conductorAutorizadoField.isDismissWhenSelected = true
        conductorAutorizadoField.isArrayWithObject = true
        conductorAutorizadoField.keyPath = "DescriptionES"
        conductorAutorizadoField.arrayList = webServicesObject.arrayOfDictionaries("driverIsAuthorized")
        
        inspeccionDiaField.isKeyboardHidden = true
        inspeccionDiaField.isDismissWhenSelected = true
        inspeccionDiaField.isArrayWithObject = true
        inspeccionDiaField.keyPath = "DescriptionES"
        inspeccionDiaField.arrayList = webServicesObject.arrayOfDictionaries("driverIsAuthorized")
        
        permisoEspecialField.isKeyboardHidden = true
        permisoEspecialField.isDismissWhenSelected = true
        permisoEspecialField.isArrayWithObject = true
        permisoEspecialField.keyPath = "DescriptionES"
        permisoEspecialField.arrayList = webServicesObject.arrayOfDictionaries("driverIsAuthorized")
        
        pesoBrutoField.isKeyboardHidden = true
        pesoBrutoField.isDismissWhenSelected = true
        pesoBrutoField.isArrayWithObject = true
        pesoBrutoField.keyPath = "DescriptionES"
        pesoBrutoField.arrayList = webServicesObject.arrayOfDictionaries("GVWRGCWR")
        
        confVehiculo.isKeyboardHidden = true
        confVehiculo.isDismissWhenSelected = true
        confVehiculo.isArrayWithObject = true
        confVehiculo.keyPath = "DescriptionES"
        confVehiculo.arrayList = webServicesObject.arrayOfDictionaries("configurations")
        
        tipoVehiculoCargaField.isKeyboardHidden = true
        tipoVehiculoCargaField.isDismissWhenSelected = true
        tipoVehiculoCargaField.isArrayWithObject = true
        tipoVehiculoCargaField.keyPath = "DescriptionES"
        tipoVehiculoCargaField.arrayList = webServicesObject.arrayOfDictionaries("cargoBodyTypes")
        
        vehiculoContieneMPField.isKeyboardHidden = true
        vehiculoContieneMPField.isDismissWhenSelected = true
        vehiculoContieneMPField.isArrayWithObject = true
        vehiculoContieneMPField.keyPath = "DescriptionES"
        vehiculoContieneMPField.arrayList = webServicesObject.arrayOfDictionaries("hazMatInvolved") //si no y no aplica
        
        numeroIdentificacionField.isKeyboardHidden = true
        numeroIdentificacionField.isDismissWhenSelected = true
        numeroIdentificacionField.isArrayWithObject = true
        numeroIdentificacionField.keyPath = "DescriptionES"
        numeroIdentificacionField.arrayList = webServicesObject.arrayOfDictionaries("hazMatReleased")
        
        huboDerrameMPField.isKeyboardHidden = true
        huboDerrameMPField.isDismissWhenSelected = true
        huboDerrameMPField.isArrayWithObject = true
        huboDerrameMPField.keyPath = "DescriptionES"
        huboDerrameMPField.arrayList = webServicesObject.arrayOfDictionaries("hazMatInvolved")
        

        
        
        
       numberTablillaField.text = dictionary["numDeTablilla"]
        yearField.text = dictionary["year"]
        marcaField.text = dictionary["marca"]
        modelField.text = dictionary["modelo"]
        
         typeVehicleField.text = dictionary["tipoVehiculoMotor"]
         direccionViajeField.text = dictionary["direccionDeViaje"]
         funcionEspecialField.text = dictionary["funcionEspecial"]
         usoVehiculoField.text = dictionary["usoDeVehiculo"]
         maniobraField.text = dictionary["maniobra"]
         roadDescriptionField.text = dictionary["descripcionCarretera"]
         alineamientoField.text = dictionary["alineamiento"]
         inclinacionField.text = dictionary["inclinacion"]
         categoriaField.text = dictionary["categoriaCarril"]
         typeCarrilField.text = dictionary["tipoCarril"]
        // tipoControlesField.text = dictionary["numDeTablilla"]
         operacionField.text = dictionary["operationOrLost"]
         primerCategoria.text = dictionary["primeraCategoria"]
         segundaCategoria.text = dictionary["segundaCategoria"]
         terceraCategoria.text = dictionary["terceraCategoria"]
         cuartaCategoria.text = dictionary["cuartaCategoria"]
         primerEvento.text = dictionary["primerEvento"]
         segundoEvento.text = dictionary["segundoEvento"]
         tercerEvento.text = dictionary["tercerEvento"]
         cuartoEvento.text = dictionary["cuartoEvento"]
         usoBusField.text = dictionary["busUse"]
         abandonoLugarField.text = dictionary["leftPlace"]
         remolcadoField.text = dictionary["towedDamage"]
         primerDefecto.text = dictionary["primerDefectoMec"]
         segundoDefecto.text = dictionary["segundoDefectoMec"]
         PuntoInicialField.text = dictionary["initialContactPoint"]
         //areaAfectadaField.text = dictionary["numDeTablilla"]
         gradoDanioField.text = dictionary["extendDamage"]
         usoVehiculoComercialField.text = dictionary["commercialVehicle"]
         vehiculoMovimientoField.text = dictionary["movingVehicle"]
         conductorAutorizadoField.text = dictionary["authorizedDriver"]
         inspeccionDiaField.text = dictionary["inspectionDate"]
         permisoEspecialField.text = dictionary["specialPermit"]
         pesoBrutoField.text = dictionary["grossWeight"]
        
        
         confVehiculo.text = dictionary["vehicleConfiguration"]
         tipoVehiculoCargaField.text = dictionary["heavyVehicleType"]
         vehiculoContieneMPField.text = dictionary["hazardousMaterial"]
         numeroIdentificacionField.text = dictionary["diamondIDNumber"]
         //huboDerrameMPField.text = dictionary["numDeTablilla"]
        
        
        
         cantidadEjesField.text = dictionary["totalAxis"]
        mphField.text = dictionary["mph"]
         mphdosField.text = dictionary["limiteDeVelocidad"]
         cantidadField.text = dictionary["cantidadCarril"]
        
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "PageSix")
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // areaAfectadaField.text
        //huboDerrameMPField.text
        // tipoControlesField.text
        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        
//        
//        //Will update each entity individually.
//        if isUpdating{
//            //entity one
//            do {
//            let request1 = NSFetchRequest(entityName: "PageSix")
//            let results1 = try context.executeFetchRequest(request1)
//            
//            if results1.count > 0 {
//                
//                for result in results1 as! [NSManagedObject] {
//                        if result.valueForKey("objectNum") as? Int == objectNum {
//                                                result.setValue(typeVehicleField.text,forKey: "tipoVehiculoMotor")
//                        result.setValue(direccionViajeField.text,forKey: "direccionDeViaje")
//                        result.setValue(funcionEspecialField.text,forKey: "funcionEspecial")
//                        result.setValue(usoVehiculoField.text,forKey:"usoDeVehiculo")
//                        result.setValue(maniobraField.text,forKey:"maniobra")
//                        result.setValue(mphField.text,forKey:"mph")
//                        result.setValue(mphdosField.text,forKey:"limiteDeVelocidad")
//                        result.setValue(objectNum, forKey: "objectNum")
//                        result.setValue(objectNum, forKey: "objectNum")
//                    
//                        if result.valueForKey("objectNum") as? Int == 0 {
//                            context.deleteObject(result)
//                            do{
//                                try context.save()
//                                                            }catch{
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
//            }
//            //entity two
//            do {
//                let request2 = NSFetchRequest(entityName: "PageSeven")
//                
//                let results2 = try context.executeFetchRequest(request2)
//            
//                if results2.count > 0 {
//                    
//                    for result in results2 as! [NSManagedObject] {
//                            if result.valueForKey("objectNum") as? Int == objectNum {
//                                result.setValue(alineamientoField.text, forKey: "alineamiento")
//                                result.setValue(categoriaField.text, forKey: "categoriaCarril")
//                                result.setValue(roadDescriptionField.text, forKey: "descripcionCarretera")
//                                result.setValue(inclinacionField.text, forKey: "inclinacion")
//                                result.setValue(operacionField.text, forKey: "operationOrLost")
//                                result.setValue(typeCarrilField.text, forKey: "tipoCarril")
//                                result.setValue(cantidadField.text, forKey: "cantidadCarril")
//                                result.setValue(objectNum, forKey: "objectNum")
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
//                let request3 = NSFetchRequest(entityName: "PageEight")
//                
//                
//                let results3 = try context.executeFetchRequest(request3)
//                    if results3.count > 0 {
//                    
//                    for result in results3 as! [NSManagedObject] {
//                            if result.valueForKey("objectNum") as? Int == objectNum {
//                        
//                                result.setValue(primerCategoria.text, forKey: "primeraCategoria")
//                                result.setValue(segundaCategoria.text, forKey: "segundaCategoria")
//                                result.setValue(terceraCategoria.text, forKey: "terceraCategoria")
//                                result.setValue(cuartaCategoria.text, forKey: "cuartaCategoria")
//                                result.setValue(primerEvento.text, forKey: "primerEvento")
//                                result.setValue(segundoEvento.text, forKey: "segundoEvento")
//                                result.setValue(tercerEvento.text, forKey: "tercerEvento")
//                                result.setValue(cuartoEvento.text, forKey: "cuartoEvento")
//                                result.setValue(usoBusField.text, forKey: "busUse")
//                                result.setValue(abandonoLugarField.text, forKey: "leftPlace")
//                                result.setValue(remolcadoField.text, forKey: "towedDamage")
//                                result.setValue(primerDefecto.text, forKey: "primerDefectoMec")
//                                result.setValue(segundoDefecto.text, forKey: "segundoDefectoMec")
//                                result.setValue(objectNum, forKey: "objectNum")
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
//            //entity four
//            do {
//                let request4 = NSFetchRequest(entityName: "PageNine")
//                
//                let results4 = try context.executeFetchRequest(request4)
//                
//                    if results4.count > 0 {
//                    
//                    for result in results4 as! [NSManagedObject] {
//                            if result.valueForKey("objectNum") as? Int == objectNum {
//                                
//                            result.setValue(numeroIdentificacionField.text, forKey: "diamondIDNumber")
//                            result.setValue(usoVehiculoComercialField.text, forKey: "commercialVehicle")
//                            result.setValue(vehiculoMovimientoField.text, forKey: "movingVehicle")
//                            result.setValue(inspeccionDiaField.text, forKey: "inspectionDate")
//                            result.setValue(gradoDanioField.text, forKey: "extendDamage")//unsure
//                            result.setValue(conductorAutorizadoField.text, forKey: "authorizedDriver")
//                            result.setValue(confVehiculo.text, forKey: "vehicleConfiguration")
//                            result.setValue(vehiculoContieneMPField.text, forKey: "hazardousMaterial")//unsure
//                            result.setValue(cantidadEjesField.text, forKey: "totalAxis")
//                            result.setValue(permisoEspecialField.text, forKey: "specialPermit")
//                            result.setValue(tipoVehiculoCargaField.text, forKey: "heavyVehicleType")
//                            result.setValue(pesoBrutoField.text, forKey: "grossWeight")
//                            result.setValue(PuntoInicialField.text, forKey: "initialContactPoint")
//                            result.setValue(objectNum, forKey: "objectNum")
//
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
//            
//        }else{
//            
//            let newData = NSEntityDescription.insertNewObjectForEntityForName("PageSix", inManagedObjectContext: context)
//
//            
//            newData.setValue(typeVehicleField.text,forKey: "tipoVehiculoMotor")
//            newData.setValue(direccionViajeField.text,forKey: "direccionDeViaje")
//            newData.setValue(funcionEspecialField.text,forKey: "funcionEspecial")
//            newData.setValue(usoVehiculoField.text,forKey:"usoDeVehiculo")
//            newData.setValue(maniobraField.text,forKey:"maniobra")
//            newData.setValue(mphField.text,forKey:"mph")
//            newData.setValue(mphdosField.text,forKey:"limiteDeVelocidad")
//            newData.setValue(objectNum, forKey: "objectNum")
//            
//            let secondNewData = NSEntityDescription.insertNewObjectForEntityForName("PageSeven", inManagedObjectContext: context)
//            
//            
//            //still have to verify tipo controles in database
//            secondNewData.setValue(alineamientoField.text, forKey: "alineamiento")
//            secondNewData.setValue(categoriaField.text, forKey: "categoriaCarril")
//            secondNewData.setValue(roadDescriptionField.text, forKey: "descripcionCarretera")
//            secondNewData.setValue(inclinacionField.text, forKey: "inclinacion")
//            secondNewData.setValue(operacionField.text, forKey: "operationOrLost")
//            secondNewData.setValue(typeCarrilField.text, forKey: "tipoCarril")
//            secondNewData.setValue(cantidadField.text, forKey: "cantidadCarril")
//            secondNewData.setValue(objectNum, forKey: "objectNum")
//            
//            let thirdNewData = NSEntityDescription.insertNewObjectForEntityForName("PageEight", inManagedObjectContext: context)
//            
//            thirdNewData.setValue(primerCategoria.text, forKey: "primeraCategoria")
//            thirdNewData.setValue(segundaCategoria.text, forKey: "segundaCategoria")
//            thirdNewData.setValue(terceraCategoria.text, forKey: "terceraCategoria")
//            thirdNewData.setValue(cuartaCategoria.text, forKey: "cuartaCategoria")
//            thirdNewData.setValue(primerEvento.text, forKey: "primerEvento")
//            thirdNewData.setValue(segundoEvento.text, forKey: "segundoEvento")
//            thirdNewData.setValue(tercerEvento.text, forKey: "tercerEvento")
//            thirdNewData.setValue(cuartoEvento.text, forKey: "cuartoEvento")
//            thirdNewData.setValue(usoBusField.text, forKey: "busUse")
//            thirdNewData.setValue(abandonoLugarField.text, forKey: "leftPlace")
//            thirdNewData.setValue(remolcadoField.text, forKey: "towedDamage")
//            thirdNewData.setValue(primerDefecto.text, forKey: "primerDefectoMec")
//            thirdNewData.setValue(segundoDefecto.text, forKey: "segundoDefectoMec")
//            thirdNewData.setValue(objectNum, forKey: "objectNum")
//            
//            let fourthNewData = NSEntityDescription.insertNewObjectForEntityForName("PageNine", inManagedObjectContext: context)
//            
//            fourthNewData.setValue(PuntoInicialField.text, forKey: "initialContactPoint")
//            fourthNewData.setValue(numeroIdentificacionField.text, forKey: "diamondIDNumber")
//            fourthNewData.setValue(usoVehiculoComercialField.text, forKey: "commercialVehicle")
//            fourthNewData.setValue(vehiculoMovimientoField.text, forKey: "movingVehicle")
//            fourthNewData.setValue(inspeccionDiaField.text, forKey: "inspectionDate")
//            fourthNewData.setValue(gradoDanioField.text, forKey: "extendDamage")//unsure
//            fourthNewData.setValue(conductorAutorizadoField.text, forKey: "authorizedDriver")
//            fourthNewData.setValue(confVehiculo.text, forKey: "vehicleConfiguration")
//            fourthNewData.setValue(vehiculoContieneMPField.text, forKey: "hazardousMaterial")//unsure
//            fourthNewData.setValue(cantidadEjesField.text, forKey: "totalAxis")
//            fourthNewData.setValue(permisoEspecialField.text, forKey: "specialPermit")
//            fourthNewData.setValue(tipoVehiculoCargaField.text, forKey: "heavyVehicleType")
//            fourthNewData.setValue(pesoBrutoField.text, forKey: "grossWeight")
//            fourthNewData.setValue(objectNum, forKey: "objectNum")
//            //print("done")
//            
//           
//            do {
//                
//                try context.save()
//                print("Vehicle Saved")
//            } catch {
//                
//                print("There was a problem!")
//            }
//        }
//        
//        let request1 = NSFetchRequest(entityName: "PageSix")
//        request1.returnsObjectsAsFaults = false
//        let request2 = NSFetchRequest(entityName: "PageSeven")
//        request2.returnsObjectsAsFaults = false
//        let request3 = NSFetchRequest(entityName: "PageEight")
//        request3.returnsObjectsAsFaults = false
//        let request4 = NSFetchRequest(entityName: "PageNine")
//        request4.returnsObjectsAsFaults = false
//        
//        
//        //cleanup of invisible objects
//        do {
//            let results1 = try context.executeFetchRequest(request1)
//            let results2 = try context.executeFetchRequest(request2)
//            let results3 = try context.executeFetchRequest(request3)
//            let results4 = try context.executeFetchRequest(request4)
//            
//            
//            
//            if results1.count > 0 {
//                
//                for result in results1 as! [NSManagedObject] {
//                    //print("For object #",result.valueForKey("objectNum")!)
//                   
//                    if (result.valueForKey("objectNum") as? Int == 0){
//                        context.deleteObject(result)
//                        do{
//                            try context.save()
//                            print("did it")
//                        }catch{
//                            print("couldn't do it")
//                        }//close catch
//                    }//close nested if
//                    
//                }//close for
//                
//            }//close if
//            
//            
//            if results2.count > 0 {
//                
//                for result in results2 as! [NSManagedObject] {
//                    //print("For object #",result.valueForKey("objectNum")!)
//                    
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
//            
//            
//            
//            if results3.count > 0 {
//                
//                for result in results3 as! [NSManagedObject] {
//                    //print("For object #",result.valueForKey("objectNum")!)
//                    
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
//            
//            
//            
//            if results4.count > 0 {
//                
//                for result in results4 as! [NSManagedObject] {
//                    //print("For object #",result.valueForKey("objectNum")!)
//                    
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
//            
//        }catch {
//            
//            print("Fetch Failed")
//        }
        
        
        
        
        //        if segue.identifier == "exitToDataEntry"{
        if let detailsVC = segue.destinationViewController as? VehiclesTableViewController{
            detailsVC.tableView.reloadData()
            //print("Leaving VC")
            objectNum = 0
            isUpdating = false

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

            if let detailsVC = segue.destinationViewController as? VehiclesTableViewController{
                detailsVC.dictionary = self.dictionary
            }
        
            print(areaAfectadaField.selectedIndex)
            print ("------------")
            
            //  Vehicle Information
            
            let  webServicesObjectPOST = WebService.init()
            
            webServicesObjectPOST.addIData("MotorVehicle", value: typeVehicleField.text)
            
            webServicesObjectPOST.addIData("TripDirection", value: direccionViajeField.text)
            
            webServicesObjectPOST.addIData("SpecialFunctionMotor", value: funcionEspecialField.text)
            
            webServicesObjectPOST.addIData("EmergencyUse", value: usoVehiculoField.text)
            
            webServicesObjectPOST.addIData("MPH", value: mphField.text)
            
            webServicesObjectPOST.addIData("PostedSpeedLimit", value: mphdosField.text)
            
            webServicesObjectPOST.addIData("MotorVehicleManeuver", value: maniobraField.text)
            
            //capturar el  idNewVehicleFK
            
            //Information of the road whre the vehicle was passing
            
            webServicesObjectPOST.addIData("RoadDescription", value: roadDescriptionField.text)
            
            webServicesObjectPOST.addIData("Alignment", value: alineamientoField.text)
            
            webServicesObjectPOST.addIData("Slope", value: inclinacionField.text)
            
            webServicesObjectPOST.addIData("Cantidad", value: cantidadField.text)
            
            webServicesObjectPOST.addIData("CategoriaCarril", value: categoriaField.text)
            
            //Selection Tipo Controles de Transito. TCDTypeSlection
            
            //TCDTypeID
            
            //idInformationRoadVehiclePasssing
            
            //idNewVehicleFK
            
            // webServicesObjectPOST.addIData("", value: tipoControlesField.text)
            
            
            
            webServicesObjectPOST.addIData("TipoCarril", value: typeCarrilField.text)
            
            webServicesObjectPOST.addIData("OperationOrLost", value: operacionField.text)
            
            //capturar el  idNewVehicleFK
            
            //Information Event Vehicle
            
            webServicesObjectPOST.addIData("PrimeraCategoria", value: primerCategoria.text)
            
            webServicesObjectPOST.addIData("SegundaCategoria", value: segundaCategoria.text)
            
            webServicesObjectPOST.addIData("TerceraCategoria", value: terceraCategoria.text)
            
            webServicesObjectPOST.addIData("CuartaCategoria", value: cuartaCategoria.text)
            
            webServicesObjectPOST.addIData("PrimerEvento", value: primerEvento.text)
            
            webServicesObjectPOST.addIData("SegundoEvento", value: segundoEvento.text)
            
            webServicesObjectPOST.addIData("TercerEvento", value: tercerEvento.text)
            
            webServicesObjectPOST.addIData("CuartoEvento", value: cuartoEvento.text)
            
            webServicesObjectPOST.addIData("BusUse", value: usoBusField.text)
            
            webServicesObjectPOST.addIData("LeftPlace", value: abandonoLugarField.text)
            
            webServicesObjectPOST.addIData("TowedDamage", value: remolcadoField.text)
            
            webServicesObjectPOST.addIData("PrimerDefectoMecanico", value: primerDefecto.text)
            
            webServicesObjectPOST.addIData("SegundoDefectoMecanico", value: segundoDefecto.text)
            
            //capturar el  idNewVehicleFK
            
            //CommercialVehicleHazardousMaterial
            
            webServicesObjectPOST.addIData("InitialContactPoint", value: PuntoInicialField.text)
            
            //slection Areas Afectasdas AffectAreasSelection.
            
            // capturar IdCommercialVehicleHazardousMaterialFK
            
            //damageAreaIDFK
            
            //idNewVehicleFK
            
            //webServicesObjectPOST.addIData("", value: areaAfectadaField.text)
            
            
            
            webServicesObjectPOST.addIData("ExtendDamage", value: gradoDanioField.text)
            
            webServicesObjectPOST.addIData("CommercialVehicleUse", value: usoVehiculoComercialField.text)
            
            webServicesObjectPOST.addIData("MovingVehicle", value: vehiculoMovimientoField.text)
            
            webServicesObjectPOST.addIData("AuthorizedDriver", value: conductorAutorizadoField.text)
            
            webServicesObjectPOST.addIData("InspectionDate", value: inspeccionDiaField.text)
            
            webServicesObjectPOST.addIData("SpecialPermit", value: permisoEspecialField.text)
            
            webServicesObjectPOST.addIData("GrosWeight", value: pesoBrutoField.text)
            
            webServicesObjectPOST.addIData("TotalAxis", value: cantidadEjesField.text)
            
            webServicesObjectPOST.addIData("VehicleConfiguration", value: confVehiculo.text)
            
            webServicesObjectPOST.addIData("HeavyVehicleType", value: tipoVehiculoCargaField.text)
            
            webServicesObjectPOST.addIData("HazardousMaterial", value: vehiculoContieneMPField.text)
            
            webServicesObjectPOST.addIData("DiamondIdNumber", value: numeroIdentificacionField.text)
            
            webServicesObjectPOST.addIData("DueCollision", value: huboDerrameMPField.text)
            
            //captura el fk vehicle
            
            webServicesObjectPOST.sendPOSTs(6)
    }
 
    }


}
