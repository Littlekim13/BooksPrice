//
//  RegisterController.swift
//  BooksPrice
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
class RegisterController: UIViewController , KumulosDelegate
{
    var kumuAPI = Kumulos()
    
// RegisterView
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConpass: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        kumuAPI.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerSignup_Onclick()
    {
        if txtPass.text == txtConpass.text
        {
            let kumuAPI = Kumulos()
            kumuAPI.createUserWithUsername(txtUser.text, andPassword: txtPass.text, andEmail: txtEmail.text)
        }
        
    }

    
    
}