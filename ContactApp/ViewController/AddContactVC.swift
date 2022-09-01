//
//  AddContactVC.swift
//  ContactApp
//
//  Created by Divya Panthi on 22/08/2022.
//

import UIKit



protocol ContactProtocol: AnyObject{
    
    func passData(firstName: String, lastName: String, address: String?, email: String?, number: String, profilePic: UIImage)
}


class AddContactVC: UIViewController, ProfileImageProtocol {
    
    func passProfile(profileImage: UIImage) {
        
        self.profileImage.image = profileImage
        
    }
    
    //UITextField and Buttons
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnAddContact: UIButton!
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    //Errors Label Field
    
    @IBOutlet weak var firstNameError: UILabel!
    
    @IBOutlet weak var lastNameError: UILabel!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var contactError: UILabel!
    
    weak var delegate: ContactProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        profileImage.image = UIImage(systemName: "person.circle.fill")
        
        resetForm()
        
    }
    
    
    func resetForm(){
        
        self.txtNumber.isHidden = true
        
        btnDone.isEnabled = false
        
        firstNameError.isHidden = false
        lastNameError.isHidden = false
        emailError.isHidden = true
        contactError.isHidden = true
        
        txtFirstName.text = ""
        txtLastName.text = ""
        txtEmail.text = ""
        txtAddress.text = ""
        txtNumber.text = ""
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
            }
            else if email.isEmpty{
                
                emailError.isHidden = true
            }
            else
            {
                emailError.isHidden = true
            }
        }
        
        checkForValidForm()
    }

    
    
    @IBAction func phoneNumberChanged(_ sender: Any) {
        
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
    
    
    
    
    @IBAction func btnAddContactAction(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 1, delay: .zero) {
            
            self.checkContact()
            
        }
        
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        checkContact()
        
    }
    
    func checkContact(){
        
        if txtNumber.text!.isEmpty{
            
            self.txtNumber.isHidden = false
            
            self.contactError.isHidden = false
            
            self.btnAddContact.isEnabled = false
            
        }
        else{
            delegate?.passData(firstName: txtFirstName.text!, lastName: txtLastName.text!, address: txtAddress.text ?? "", email: txtEmail.text ?? "" ,number: txtNumber.text!, profilePic: profileImage.image!)
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
    func checkForValidForm() {
        
        if firstNameError.isHidden && lastNameError.isHidden && contactError.isHidden
        {
            btnDone.isEnabled = true
        }
        else
        {
            btnDone.isEnabled = false
        }
    }
    
    
    
    @IBAction func btnAddImageAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ImageCollection", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "ImageCollectionVC") as! ImageCollectionVC
        
        controller.delegate = self
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}


extension UIImageView {
    
    var isEmpty: Bool { image == nil }
    
}
