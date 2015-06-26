//
//  Game.swift
//  Relationship
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import Foundation
import CoreData

@objc (Game)
class  Game: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var levels: NSOrderedSet

    
    func addlevel (level: Level) {
        var Levels = levels.array as [Level]
        Levels.append(level)
        levels = NSOrderedSet(array: Levels)
        
    }
    
}
