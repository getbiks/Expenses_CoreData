//
//  Account+CoreDataClass.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

@objc(Account)
public class Account: NSManagedObject {

    var transactionAccount : [Transaction]? {
        return self.rawTransactionsAccount?.array as? [Transaction]
    }
    
    convenience init?(name: String, amount: Double){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Account.entity(), insertInto: context)
        
        self.name = name
        self.amount = amount
    }
    
}
