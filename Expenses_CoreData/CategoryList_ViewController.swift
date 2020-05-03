//
//  CategoryList_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

class CategoryList_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var category : [Category] = []
    var categoryTotalAmount : [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        categoryTotalAmount.removeAll()
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            category = try managedContext.fetch(fetchRequest)
            
            for cat in category {
                let transactions = cat.transactionCategory!
                var amount = 0.0
                for tran in transactions {
                    amount = amount + tran.amount
                }
                
                if amount < 0 {
                    amount = amount * -1
                }
                categoryTotalAmount.append(amount)
            }
            
            categoryTableView.reloadData()
        } catch {
            print("Cannot fetch Accounts")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CategoryTransactions_ViewController,
            let selectedRow = self.categoryTableView.indexPathForSelectedRow?.row else {
                return
        }
        
        destination.navigationItem.title = category[selectedRow].title
        destination.category = category[selectedRow]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row].title
        cell.detailTextLabel?.text = String(format: "%.2f", categoryTotalAmount[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCategoryTransaction", sender: self)
    }
}
