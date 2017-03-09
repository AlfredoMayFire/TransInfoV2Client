//
//  ViewController.swift
//  transinfoFinal
//
//  Created by Jessica Cotrina Revilla on 7/26/16.
//  Copyright © 2016 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
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
        
        let  webServicesObjectPOST = WebService.init()
        //            webServicesObjectPOST.addIData("username", value: userTextField.text)
        //            webServicesObjectPOST.addIData("password", value: passwordTextField.text)
        //            webServicesObjectPOST.sendPOSTs(8)
        
        print ("------outtt------")
        
        let url = "http://localhost:9000/login"
        var loginPostResults = WebService.post(url, parameters: ["username":userTextField.text!,"password":passwordTextField.text!] )
        print ("que devuelves")
        print(loginPostResults["error_code"])
        //...................................
        
        
        
        let error = loginPostResults["error_code"] as! String
        if( error != ""){
            let alert = UIAlertController(title: "Alert", message: "Username or password invalid", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
}

