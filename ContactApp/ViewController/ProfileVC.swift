//
//  ProfileVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 23/08/2022.
//

import UIKit

protocol EditedDelegate: AnyObject{
    
    func passEditedData(firstName: String, lastNme: String, email: String, number: String, address: String, profilePic: UIImage!)
    
}

class ProfileVC: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    //Errors Label Field
    
    @IBOutlet weak var firstNameError: UILabel!
    
    @IBOutlet weak var lastNameError: UILabel!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var contactError: UILabel!
    
    var contactItems : ContactItem?
    
    var delegate: EditedDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewForm()
        
        
    }
    
    func viewForm(){
        
        firstNameError.isHidden = true
        lastNameError.isHidden = true
        emailError.isHidden = true
        contactError.isHidden = true
        
        firstNameError.text = "Required"
        lastNameError.text = "Required"
        contactError.text = "Required"
        
        
        self.txtFirstName.text = self.contactItems?.firstName
        
        self.txtLastName.text = self.contactItems?.lastName
        
        self.txtNumber.text = self.contactItems?.number
        
        self.txtEmail.text = self.contactItems?.email
        
        self.txtAddress.text = self.contactItems?.address
        
        self.imgProfilePic.image = self.contactItems?.profileImage
        
        disableAllTextField()
        
        btnSave.isHidden = true
        btnCancel.isHidden = true
        
        
    }
    
    
    @IBAction func firstNameChanged(_ sender: Any) {
        
        if let firstName = txtFirstName.text
        {
            if let errorMessage = Utilities.invalidFirstName(firstName)
            {
                firstNameError.text = errorMessage
                firstNameError.isHidden = false
            }
            else
            {
                firstNameError.isHidden = true
            }
        }
        
        checkForValidForm()
        
    }
    
    @IBAction func lastNameChanged(_ sender: Any) {
        
        if let lastName = txtLastName.text
        {
            if let errorMessage = Utilities.invalidLastName(lastName)
            {
                lastNameError.text = errorMessage
                lastNameError.isHidden = false
            }
            else
            {
                lastNameError.isHidden = true
            }
        }
        
        checkForValidForm()
        
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        
        if let email = txtEmail.text
        {
            if let errorMessage = Utilities.invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }else{
                emailError.isHidden = true
            }
            
        }
        
        checkForValidForm()
        
    }
    
    @IBAction func phonenumChanged(_ sender: Any) {
        
        if let phoneNumber = txtNumber.text
        {
            if let errorMessage = Utilities.invalidPhoneNumber(phoneNumber)
            {
                contactError.text = errorMessage
                contactError.isHidden = false
            }
            else
            {
                contactError.isHidden = true
            }
        }
        
        checkForValidForm()
        
    }
    
    
    
    @IBAction func btnSaveAction(_ sender: Any) {
        
        delegate?.passEditedData(firstName: txtFirstName.text!, lastNme: txtLastName.text!, email: txtEmail.text!, number: txtNumber.text!, address: txtAddress.text!,  profilePic: self.contactItems?.profileImage)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
        
        hideButton()
        
        disableAllTextField()
        
        hideBorder()
        
        
        
    }
    
    
    
    
    @IBAction func btnEditProfileAction(_ sender: Any) {
        
        enableAllTextField()
        
        showBorder()
        
        showButton()
        
    }
    
    func showBorder(){
        
        self.txtFirstName.addBorder()
        self.txtLastName.addBorder()
        self.txtEmail.addBorder()
        
        self.txtNumber.addBorder()
        self.txtAddress.addBorder()
        self.txtEmail.addBorder()
        
    }
    
    func hideBorder(){
        
        self.txtFirstName.removeBorder()
        self.txtLastName.removeBorder()
        self.txtEmail.removeBorder()
        
        self.txtNumber.removeBorder()
        self.txtAddress.removeBorder()
        self.txtEmail.removeBorder()
        
    }
    
    func showButton(){
        
        self.btnSave.isHidden = false
        self.btnCancel.isHidden = false
        
    }
    
    func hideButton(){
        
        self.btnSave.isHidden = true
        self.btnCancel.isHidden = true
        
    }
    
    func checkForValidForm() {
        
        if firstNameError.isHidden && lastNameError.isHidden && contactError.isHidden && emailError.isHidden {
            btnSave.isEnabled = true
            
        }
        else{
            btnSave.isEnabled = false
        }
    }
    
    func enableAllTextField(){
        
        self.txtFirstName.isEnabled = true
        self.txtLastName.isEnabled = true
        self.txtEmail.isEnabled = true
        self.txtAddress.isEnabled = true
        self.txtNumber.isEnabled = true
        
        
    }
    
    func disableAllTextField(){
        
        self.txtFirstName.isEnabled = false
        self.txtLastName.isEnabled = false
        self.txtEmail.isEnabled = false
        self.txtAddress.isEnabled = false
        self.txtNumber.isEnabled = false
        
        
    }
    
    
}

extension UITextField {
    
    func addBorder(){
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5
        
    }
    
    func removeBorder(){
        
        self.layer.borderWidth = 0
        self.layer.borderColor = .none
        self.layer.cornerRadius = 0
        
    }
    
}
