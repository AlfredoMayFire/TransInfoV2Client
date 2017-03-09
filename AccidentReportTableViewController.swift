//
//  AccidentReportTableViewController.swift
//  transinfoFinal
//
//  Created by Pedro Santiago on 2/10/17.
//  Copyright © 2017 Universidad de puerto rico-Mayaguez. All rights reserved.
//

import UIKit
import CoreData

class AccidentReportTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    var object = [NSManagedObject]()
    @IBOutlet var Reportes: UITableView!
    var objectNum = Int()
    
    override func viewDidLoad() {
        Reportes.delegate = self
        Reportes.dataSource = self
        super.viewDidLoad()

        navigationController!.navigationBar.barTintColor = UIColor (red:28.0/255.0, green:69.0/255.0, blue:135.0/255.0, alpha:1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            //menuButton.action = "revealToggle:"
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }

        
//        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let context: NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "PageOne")
//        
//        do {
//            
//            
//            let results = try context.executeFetchRequest(request)
//    
//            if results.count > 0 {
//                for result in results as! [NSManagedObject] {
//                }
//            }
//        }catch{
//            print("Error")
//        }
//        
        
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        Reportes.reloadData()
        self.tableView.reloadData()
        
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
//        let fetchRequest = NSFetchRequest(entityName: "PageOne")
//        
//        //3
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            object = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0//object.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
//        let person = object[indexPath.row]
//        
//        cell!.textLabel!.text = ((person.valueForKey("fechaAccidente") as? String)! + " " + (person.valueForKey("hora") as? String)!)
        return cell!
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow // index path of selected cell
        
        let cellIndex = indexPath!.row // index of selected cell
        
        objectNum = cellIndex + 1
//        print(objectNum)
//        let newObject = objectNumManager.init()
//        newObject.setNum(objectNum)
//        print(newObject.getNum())
        performSegueWithIdentifier("firstStep", sender: self)
//        let myViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("yes") as! ReportFirstStepViewController
//        self.navigationController?.pushViewController(myViewController, animated: true)

  
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsVC = segue.destinationViewController as? ReportFirstStepViewController{
            detailsVC.objectNum = self.objectNum
//            let myViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("yes") as! ReportFirstStepViewController
//            self.navigationController?.pushViewController(myViewController, animated: true)
        }
    }
    
    
    
}
