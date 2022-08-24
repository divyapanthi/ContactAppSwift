//
//  CellContacts.swift
//  ContactApp
//
//  Created by Divya Panthi on 23/08/2022.
//

import UIKit

class CellContacts: UITableViewCell {
    
    @IBOutlet weak var imgPerson: UIImageView!
    
    @IBOutlet weak var lblFullName: UILabel!
    
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
