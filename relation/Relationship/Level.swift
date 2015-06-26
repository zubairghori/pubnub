//
//  Level.swift
//  Relationship
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import Foundation
import CoreData

@objc (Level)
class  Level: NSManagedObject {

    @NSManaged var number: Int16
    @NSManaged var questions: NSOrderedSet
    @NSManaged var game: Game

}
