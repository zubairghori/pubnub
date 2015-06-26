//
//  Question.swift
//  Relationship
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import Foundation
import CoreData

@objc (Question)
class  Question: NSManagedObject {

    @NSManaged var question: String
    @NSManaged var level: Level

}
