//
//  NewAccount_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit

class NewAccount_ViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveAccount(_ sender: Any) {
        if titleTextField.text!.isEmpty {
            ShowAlert(message: "Please enter Account name")
            return
        }
        
        let account = Account(name: titleTextField.text ?? "", amount: 0)
        
        do {
            try account?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save Account")
        }
    }
}

extension NewAccount_ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
