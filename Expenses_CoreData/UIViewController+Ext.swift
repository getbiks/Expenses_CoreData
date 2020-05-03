//
//  Helper.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 04/05/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//

import UIKit

extension UIViewController {
    func ShowAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = .label
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
