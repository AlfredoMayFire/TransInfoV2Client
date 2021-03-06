//
//  NarrativeViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/28/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class NarrativeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    //
    @IBOutlet weak var notifiedTimePoliceField: UITextField!
    @IBOutlet weak var timeArrivalPoliceField: UITextField!
    @IBOutlet weak var notifiedTimeEmergenceField: UITextField!
    @IBOutlet weak var timeArrivalEmergenceField: UITextField!
    @IBOutlet weak var detailField: UITextView!
    
    var crashID = Dictionary<String,AnyObject>()
    var narrFK = String()
    var values: [String:AnyObject] = [
        "accidentfk":"",
        "narrfk":""
    ]

    
    @IBAction func horaNotificadaField(sender: UITextField) {
        let timePicker:UIDatePicker = UIDatePicker()
        
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(NarrativeViewController.timePickerValueChangedhoraNotificadaPolice(_:)),forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func timePickerValueChangedhoraNotificadaPolice(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        notifiedTimePoliceField.text = dateformatter.stringFromDate(sender.date)

    }
    
    func timePickerValueChangedhoraLLegadaPolice(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        timeArrivalPoliceField.text = dateformatter.stringFromDate(sender.date)
        
    }

    @IBAction func horraLlegadaField(sender: UITextField) {
        
        let timePicker:UIDatePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(NarrativeViewController.timePickerValueChangedhoraLLegadaPolice(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func timePickerValueChangedhoraNotificaEmergencia(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        notifiedTimeEmergenceField.text = dateformatter.stringFromDate(sender.date)
        
    }
   
    @IBAction func horaNotificadEmergencia(sender: UITextField) {
        
        let timePicker:UIDatePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(NarrativeViewController.timePickerValueChangedhoraNotificaEmergencia(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func timePickerValueChangedhoraLLegadaEmergencia(sender:UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateformatter.dateFormat = "hh:mm a"
        timeArrivalEmergenceField.text = dateformatter.stringFromDate(sender.date)
        
    }
    @IBAction func horaLLegadaEmergencia(sender: UITextField) {
        let timePicker:UIDatePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.Time
        sender.inputView = timePicker
        timePicker.addTarget(self, action: #selector(NarrativeViewController.timePickerValueChangedhoraLLegadaEmergencia(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleton = Global.sharedGlobal
        
        singleton.foreignKeys[0].crashBasicInformation = 112
        //colornavigation
        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //hora
       
        
        //cargar hora automaticamente
        notifiedTimePoliceField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        timeArrivalPoliceField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        timeArrivalEmergenceField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        notifiedTimeEmergenceField.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
        
        // Do any additional setup after loading the view, typically from a nib.
         scrollView.contentSize.height = 1000
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
           // menuButton.action = "revealToggle:"
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendData(sender: AnyObject) {
        
        let singleton = Global.sharedGlobal
        
        let webServicesObject = WebService.init()
        webServicesObject.addIData("NotifiedTimePolice", value: notifiedTimePoliceField.text)
        webServicesObject.addIData("TimeOfArrivalPolice", value: timeArrivalPoliceField.text)
        webServicesObject.addIData("NotifiedTimeEmergencie", value: notifiedTimeEmergenceField.text)
        webServicesObject.addIData("TimeOfArrivalEmergencie", value: timeArrivalEmergenceField.text)
        webServicesObject.addIData("Details", value: "TempValue0")
        
        
        crashID = webServicesObject.sendPOSTs(13)
        print(crashID)
        let myID = crashID.first!.1
        let results = myID as? Dictionary<String,AnyObject>
        
            values["narrfk"] = (results!["CrashId"]?.integerValue)!
        
        if(crashID.first!.0 == "error_code" || crashID.first!.0 == "error"){
            
            
        }else{
            singleton.foreignKeys[0].narrative = (values["narrfk"]?.integerValue)!
        }
        
        values["accidentfk"] = singleton.foreignKeys[0].crashBasicInformation
        
        print(singleton.foreignKeys)
        print(values)
        let webServicesObject2 = WebService.init()
        webServicesObject2.addIData("AccidenteFK", value: values["accidentfk"]?.stringValue)
        webServicesObject2.addIData("NarrativaFK", value: values["narrfk"]?.stringValue)
        print(webServicesObject2.PostData)
        webServicesObject2.sendPOSTs(12)

    }
    
    
    
    

}
