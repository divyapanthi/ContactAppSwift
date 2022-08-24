//
//  AddContactVC.swift
//  ContactApp
//
//  Created by Sushil Dhital on 22/08/2022.
//

import UIKit

protocol ContactProtocol: AnyObject{
    
    func passData(firstName: String, lastName: String, address: String, email: String, number: String?)
}


class AddContactVC: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtEmail : UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var btnAddContact: UIButton!
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    @IBOutlet weak var contactStackView: UIStackView!
    
    weak var delegate: ContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtNumber.isHidden = true
        
    }
    
    @IBAction func btnAddContactAction(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 1, delay: .zero) {
            
            self.txtNumber.isHidden = false
            
            self.btnAddContact.isEnabled = false
        
        }
        
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        
        delegate?.passData(firstName: txtFirstName.text!, lastName: txtLastName.text!, address: txtAddress.text!, email: txtEmail.text! ,number: txtNumber.text!)
        
        if txtFirstName.text!.isEmpty || txtLastName.text!.isEmpty || txtNumber.text!.isEmpty {
            
            txtFirstName.layer.borderColor = UIColor.red.cgColor
            
            txtFirstName.layer.borderWidth = 0.5
            
            txtLastName.layer.borderColor = UIColor.red.cgColor
            
            txtLastName.layer.borderWidth = 0.5
            
            txtNumber.layer.borderColor = UIColor.red.cgColor
            
            txtNumber.layer.borderWidth = 0.5
            
        }
        
        else{
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
}
