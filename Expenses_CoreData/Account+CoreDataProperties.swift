//
//  Account+CoreDataProperties.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var amount: Double
    @NSManaged public var name: String?
    @NSManaged public var rawTransactionsAccount: NSOrderedSet?

}

// MARK: Generated accessors for rawTransactionsAccount
extension Account {

    @objc(insertObject:inRawTransactionsAccountAtIndex:)
    @NSManaged public func insertIntoRawTransactionsAccount(_ value: Transaction, at idx: Int)

    @objc(removeObjectFromRawTransactionsAccountAtIndex:)
    @NSManaged public func removeFromRawTransactionsAccount(at idx: Int)

    @objc(insertRawTransactionsAccount:atIndexes:)
    @NSManaged public func insertIntoRawTransactionsAccount(_ values: [Transaction], at indexes: NSIndexSet)

    @objc(removeRawTransactionsAccountAtIndexes:)
    @NSManaged public func removeFromRawTransactionsAccount(at indexes: NSIndexSet)

    @objc(replaceObjectInRawTransactionsAccountAtIndex:withObject:)
    @NSManaged public func replaceRawTransactionsAccount(at idx: Int, with value: Transaction)

    @objc(replaceRawTransactionsAccountAtIndexes:withRawTransactionsAccount:)
    @NSManaged public func replaceRawTransactionsAccount(at indexes: NSIndexSet, with values: [Transaction])

    @objc(addRawTransactionsAccountObject:)
    @NSManaged public func addToRawTransactionsAccount(_ value: Transaction)

    @objc(removeRawTransactionsAccountObject:)
    @NSManaged public func removeFromRawTransactionsAccount(_ value: Transaction)

    @objc(addRawTransactionsAccount:)
    @NSManaged public func addToRawTransactionsAccount(_ values: NSOrderedSet)

    @objc(removeRawTransactionsAccount:)
    @NSManaged public func removeFromRawTransactionsAccount(_ values: NSOrderedSet)

}
