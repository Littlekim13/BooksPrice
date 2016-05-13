//
//  RegisterController.swift
//  BooksPrice
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
import SwiftyJSON
class RegisterController: UIViewController
{
    
    
// RegisterView
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConpass: UITextField!
    
    var someusername = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSignup_Onclick()
    {
        if (txtUser.text != "" && txtEmail.text != "" && txtPass.text != "" && txtConpass.text != "")
        {
//            print(txtUser.text)
//            print(txtEmail.text)
//            print(txtPass.text)
//            print(txtConpass.text)
            
            if (txtPass.text == txtConpass.text)
            {
                let kumulosAPI = Kumulos()
                kumulosAPI.createUserWithUsername(txtUser.text, andPassword: txtPass.text, andEmail: txtEmail.text)
                var alert = UIAlertView(title: "Success", message: "Register", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
                NSLog("SignIn Success");
                
                //let vc = self.storyboard?.instantiateViewControllerWithIdentifier("BookPrice") as! BookPrice
                let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                self.presentViewController(vc, animated: true, completion: nil)
            }
            else
            {
                let alertController = UIAlertController(title: "Error", message: "Invalid a Password or Confirm Password", preferredStyle: UIAlertControllerStyle.Alert);
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
        else
        {
            let alertController = UIAlertController(title: "Error", message: "Please Enter an All", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonClear_Onclick()
    {
        txtUser.text = ""
        txtEmail.text = ""
        txtPass.text = ""
        txtConpass.text = ""
    }
}