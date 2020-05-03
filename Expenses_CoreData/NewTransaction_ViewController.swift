//
//  NewTransaction_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit

class NewTransaction_ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    
    var transactionType = "expenses"
    var categoryText = ""
    
    var account : Account?
    var category : Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        amountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
    }
    
    @IBAction func saveTransaction(_ sender: Any) {
        if nameTextField.text!.isEmpty || amountTextField.text!.isEmpty || categoryText.count == 0 {
            ShowAlert(message: "Please Enter all details")
            return
        }
        
        let name = nameTextField.text!
        let amountText = amountTextField.text ?? ""
        var amount = Double(amountText) ?? 0.0
        if transactionType == "expenses" {
            amount = amount * -1
        }
        let date = datePicker.date
        
        if let transaction = Transaction(name: name, amount: amount, rawDate: date) {
            account?.addToRawTransactionsAccount(transaction)
            category?.addToRawTransactionsCategory(transaction)
            
            do {
                try transaction.managedObjectContext?.save()
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Could not save transaction")
            }
        }
    }
    
    @IBAction func Btn_Type(_ sender: Any) {
        switch typeSegment.selectedSegmentIndex {
        case 0:
            transactionType = "expenses"
        case 1:
            transactionType = "income"
        default:
            transactionType = "expense"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? Categories_ViewController else {
            return
        }
        
        destination.delegate = self
    }
}

extension NewTransaction_ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension NewTransaction_ViewController: Categories_Delegate {
    func SetCategory(selectedCategory: Category) {
        category = selectedCategory
        categoryText = selectedCategory.title!
        categoryButton.setTitle(selectedCategory.title, for: .normal)
        
    }
}
