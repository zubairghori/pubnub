//
//  ViewController.swift
//  Relationship
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        let level = NSEntityDescription.entityForName("Level", inManagedObjectContext: context)
        let level1 = NSManagedObject(entity: level!, insertIntoManagedObjectContext: context) as Level
        level1.number = Int16(2)
        
        
        let game = NSEntityDescription.entityForName("Game", inManagedObjectContext: context)
        let game1 = NSManagedObject(entity: game!, insertIntoManagedObjectContext: context) as Game
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

