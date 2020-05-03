//
//  CategoryTransactions_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

class CategoryTransactions_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var transactionsTableView: UITableView!
        
    let dateFormatter = DateFormatter()
    
    var category : Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsTableView.rowHeight = 70
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
    }
    
    override func viewDidAppear(_ animated: Bool) {
        transactionsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.transactionCategory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTransactions", for: indexPath) as! Transaction_TableViewCell
        
        if let transaction = category?.transactionCategory?[indexPath.row] {
            
            let title = transaction.name!
            let amount = transaction.amount
            let date = dateFormatter.string(from: transaction.rawDate!)
            let account = transaction.account?.name
            
            cell.label_title.text = title
            cell.label_amount.text = String(format: "%.2f", amount)
            cell.label_category.text = account
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
