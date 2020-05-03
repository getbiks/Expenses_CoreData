//
//  Categories_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit
import CoreData

protocol Categories_Delegate {
    func SetCategory(selectedCategory: Category)
}

class Categories_ViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var delegate : Categories_Delegate?
    
    var category : [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            category = try managedContext.fetch(fetchRequest)
            categoryTableView.reloadData()
        } catch {
            print("Cannot fetch Accounts")
        }
    }
    
}

extension Categories_ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.SetCategory(selectedCategory: category[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
}
