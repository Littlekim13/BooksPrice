//
//  ViewController.swift
//  BooksPrice
//
//  Created by DE DPU on 4/22/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController ,KumulosDelegate
{
    var kumuAPI = Kumulos()

// SigninView
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var someusername = [String]()
    var somepassword = [String]()
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        kumuAPI.delegate = self
        kumuAPI.selectUserWithUsername("")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        kumuAPI.selectUserWithUsername("")
    }
    
    @IBAction func buttonSignin_Onclick(sender: AnyObject)
    {
        var countusername = 0
        var countpassword = 0
        
        if(txtUsername.text != nil)
        {
            for item in someusername
            {
//                print("/////////////////////////")
//                print(item)
//                print("/////////////////////////")
            
                if (item == txtUsername.text)
                {
                    countusername = 1
                
                    for items in somepassword
                    {
//                        print("---------------")
//                        print(items)
//                        print("---------------")
                
                        if(items.isEqual(txtPassword.text))
                        {
                            NSLog("SignIn Success");
                            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("BookPrice") as! BookPrice
                            self.presentViewController(vc, animated: true, completion: nil)
                        
                            countpassword = 1
                        }
                        else
                        {
                            countpassword = 2
                        }
                    }
                }
                
                    countusername = 2
            }
        }
        
        if(txtUsername.text == "" || txtPassword.text == "")
        {
            let alertController = UIAlertController(title: "Error", message: "Please Enter a Username or Password", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        if(countusername == 1 || countpassword == 2)
        {
            let alertController = UIAlertController(title: "Error", message: "Invalid a Password", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        if(countusername == 0 || countpassword == 0)
        {
            let alertController = UIAlertController(title: "Error", message: "Invalid a Username or Password", preferredStyle: UIAlertControllerStyle.Alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }


        
    }

    func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectUserDidCompleteWithResult theResults: [AnyObject]!)
    {
//        print("*************************************")
//        print(theResults)
//        print("*************************************")
        
        let json = JSON(theResults)
        //      print("+++++++++++++++++++")
        
        for (var i = 0; i<json.count;i=i+1)
        {
            var usernames = json[i]["username"].stringValue
            var passwords = json[i]["password"].stringValue
            // วนในเจสันหมด แล้วเอามาเก็บไว้ในตัวแปร
            someusername.append(usernames)
            somepassword.append(passwords)
            
            print(" ")
            print(json[i]["username"].stringValue)
            print(json[i]["password"].stringValue)
            print("+++++++++++++++++++")
        }
    }
    
    @IBAction func buttonCancel_Onclick()
    {
        txtUsername.text = ""
        txtPassword.text = ""
    }
    
}