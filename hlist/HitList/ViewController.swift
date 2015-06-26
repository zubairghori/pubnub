//
//  ViewController.swift
//  HitList
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate

let managedContext = appDelegate.managedObjectContext!

class ViewController: UIViewController,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
  
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        let x = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
       

        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,error: &error) as? [Person]
        
        if let results = fetchedResults {
            for result in results {
                println(result.name)
            }
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = people[indexPath.row]
        cell.textLabel?.text = person.valueForKey("name") as? String
        
        return cell
    }
    
    @IBAction func AddName(sender: AnyObject) {
        
        var alert = UIAlertController(title: "newName", message: "AddNewName", preferredStyle: UIAlertControllerStyle.Alert)
      
        let saveAction = UIAlertAction(title: "Save",style: .Default) { (action: UIAlertAction!) -> Void in
                
            let textField = alert.textFields![0] as UITextField
            self.saveName("zubair")
            self.tableview.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .Default)
        {
                (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,animated: true,completion: nil)
    }
    
    func saveName(name: String) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Person",inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!,insertIntoManagedObjectContext:managedContext) as Person
        
        //3
        person.name = name

        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        //5
        people.append(person)
    }

}

