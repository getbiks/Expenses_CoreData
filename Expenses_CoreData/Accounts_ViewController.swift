//
//  Accounts_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

class Accounts_ViewController: UIViewController {
    
    @IBOutlet weak var accountTableView: UITableView!
    
    var accounts : [Account] = []
    var balance : [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        balance.removeAll()
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Account> = Account.fetchRequest()
        
        do {
            accounts = try managedContext.fetch(fetchRequest)
                        
            for account in accounts {
                let transactions = account.transactionAccount!
                var amount = 0.0
                for tran in transactions {
                    amount = amount + tran.amount
                }
                
                balance.append(amount)
            }
            
            accountTableView.reloadData()
        } catch {
            print("Cannot fetch Accounts")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? Transactions_ViewController,
            let selectedRow = self.accountTableView.indexPathForSelectedRow?.row else {
                return
        }
        
        destination.navigationItem.title = accounts[selectedRow].name
        destination.account = accounts[selectedRow]
    }
    
    func DeleteEntry(indexPath: IndexPath){
        let account = accounts[indexPath.row]
        
        guard let managedContext = account.managedObjectContext else {
            return
        }
        
        managedContext.delete(account)
        
        do {
            try managedContext.save()
            accounts.remove(at: indexPath.row)
            accountTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Unable to deleted Account")
            accountTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension Accounts_ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountTableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath)
        cell.textLabel?.text = accounts[indexPath.row].name
        cell.detailTextLabel?.text = String(format: "%.2f", balance[indexPath.row])
        
        if balance[indexPath.row] >= 0 {
            cell.detailTextLabel?.textColor = .systemGreen
        } else {
            cell.detailTextLabel?.textColor = .systemRed
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DeleteEntry(indexPath: indexPath)
        }
    }
}
