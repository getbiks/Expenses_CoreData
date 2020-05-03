//
//  Transaction_TableViewCell.swift
//  Expenses_CoreData
//
//  Created by Bikash Agarwal on 03/05/20.
//  Copyright © Bikash Agarwal. All rights reserved.
//

import UIKit

class Transaction_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_amount: UILabel!
    @IBOutlet weak var label_category: UILabel!
    @IBOutlet weak var label_date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
