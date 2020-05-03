//
//  Transaction+CoreDataClass.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    
    convenience init?(name: String, amount: Double, rawDate: Date?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Transaction.entity(), insertInto: context)
        
        self.name = name
        self.amount = amount
        self.rawDate = rawDate
    }
}
