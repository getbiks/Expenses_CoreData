//
//  Transaction+CoreDataProperties.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var name: String?
    @NSManaged public var rawDate: Date?
    @NSManaged public var amount: Double
    @NSManaged public var category: Category?
    @NSManaged public var account: Account?

}
