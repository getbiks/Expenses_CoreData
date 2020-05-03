//
//  NewCategory_ViewController.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 02/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit

class NewCategory_ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveCategory(_ sender: Any) {
        if titleTextField.text!.isEmpty {
            ShowAlert(message: "Please enter Category title")
            return
        }
        
        let category = Category(title: titleTextField.text ?? "")
        
        do {
            try category?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save Category")
        }
    }
}

extension NewCategory_ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
