//
//  Transactions_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit

class Transactions_ViewController: UIViewController {
    
    @IBOutlet weak var transactionTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var account : Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionTableView.rowHeight = 70
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transactionTableView.reloadData()
        
    }
    
    @IBAction func Btn_AddNewTransaction(_ sender: Any) {
        performSegue(withIdentifier: "toNewTransaction", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewTransaction_ViewController else {
            return
        }
        
        destination.account = account
    }
    
    func DeleteEntry(indexPath: IndexPath) {
        guard let transaction = account?.transactionAccount?[indexPath.row], let managedContext = transaction.managedObjectContext else {
            return
        }
        
        managedContext.delete(transaction)
        
        do {
            try managedContext.save()
            transactionTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Cannot delete Transaction")
            transactionTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension Transactions_ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account?.transactionAccount?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsCell", for: indexPath) as! Transaction_TableViewCell
        if let transaction = account?.transactionAccount?[indexPath.row] {
            
            let title = transaction.name!
            let amount = transaction.amount
            let date = dateFormatter.string(from: transaction.rawDate!)
            let category = transaction.category?.title!
            
            cell.label_title.text = title
            cell.label_amount.text = String(format: "%.2f", amount)
            cell.label_category.text = category
            cell.label_date.text = date
            
            if amount >= 0 {
                cell.label_amount.textColor = UIColor(red: 0.01, green: 0.59, blue: 0.03, alpha: 1.00)
            } else {
                cell.label_amount.textColor = .red
            }
        }
        
        return cell
    }
}

extension Transactions_ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         DeleteEntry(indexPath: indexPath)
        }
    }
}


