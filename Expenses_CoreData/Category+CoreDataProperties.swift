//
//  Category+CoreDataProperties.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawTransactionsCategory: NSOrderedSet?

}

// MARK: Generated accessors for rawTransactionsCategory
extension Category {

    @objc(insertObject:inRawTransactionsCategoryAtIndex:)
    @NSManaged public func insertIntoRawTransactionsCategory(_ value: Transaction, at idx: Int)

    @objc(removeObjectFromRawTransactionsCategoryAtIndex:)
    @NSManaged public func removeFromRawTransactionsCategory(at idx: Int)

    @objc(insertRawTransactionsCategory:atIndexes:)
    @NSManaged public func insertIntoRawTransactionsCategory(_ values: [Transaction], at indexes: NSIndexSet)

    @objc(removeRawTransactionsCategoryAtIndexes:)
    @NSManaged public func removeFromRawTransactionsCategory(at indexes: NSIndexSet)

    @objc(replaceObjectInRawTransactionsCategoryAtIndex:withObject:)
    @NSManaged public func replaceRawTransactionsCategory(at idx: Int, with value: Transaction)

    @objc(replaceRawTransactionsCategoryAtIndexes:withRawTransactionsCategory:)
    @NSManaged public func replaceRawTransactionsCategory(at indexes: NSIndexSet, with values: [Transaction])

    @objc(addRawTransactionsCategoryObject:)
    @NSManaged public func addToRawTransactionsCategory(_ value: Transaction)

    @objc(removeRawTransactionsCategoryObject:)
    @NSManaged public func removeFromRawTransactionsCategory(_ value: Transaction)

    @objc(addRawTransactionsCategory:)
    @NSManaged public func addToRawTransactionsCategory(_ values: NSOrderedSet)

    @objc(removeRawTransactionsCategory:)
    @NSManaged public func removeFromRawTransactionsCategory(_ values: NSOrderedSet)

}
