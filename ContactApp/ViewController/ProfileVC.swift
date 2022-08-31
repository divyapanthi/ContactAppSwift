//
//  ProfileVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 23/08/2022.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    
    @IBOutlet weak var lblAddEmail: UILabel!
    
    @IBOutlet weak var lblAddAddress: UILabel!
    
    @IBOutlet weak var imgProfilePic: UIImageView!

    
    var contactItems : ContactItem?

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.txtFirstName.text = self.contactItems?.firstName
        
        self.txtLastName.text = self.contactItems?.lastName
        
        self.txtNumber.text = self.contactItems?.number
        
        self.txtEmail.text = self.contactItems?.email
        
        self.txtAddress.text = self.contactItems?.address
        
        self.imgProfilePic.image = self.contactItems?.profileImage
        
        
        if contactItems?.email == ""{
            
            lblAddEmail.isHidden = false
            
        }else{
            
            lblAddEmail.isHidden = true
            
        }
        
        if contactItems?.address == ""{
            
            lblAddAddress.isHidden = false
            
        }else{
            
            lblAddAddress.isHidden = true
            
        }
        
        
    }
    
    @IBAction func btnEditProfileAction(_ sender: Any) {
        
        self.txtFirstName.isEnabled = true
        
        self.txtLastName.isEnabled = true

        self.txtEmail.isEnabled = true

        self.txtAddress.isEnabled = true

        self.txtNumber.isEnabled = true
        
    }
    

}
