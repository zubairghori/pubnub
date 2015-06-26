//
//  Person.swift
//  HitList
//
//  Created by Panacloud on 26/06/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc (Person)
class  Person: NSManagedObject {

    @NSManaged var name: String

}
