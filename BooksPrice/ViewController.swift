//
//  ViewController.swift
//  BooksPrice
//
//  Created by DE DPU on 4/22/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController , KumulosDelegate
{
    var kumuAPI = Kumulos()

// SigninView
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var someusername = [String]()
    var somepassword = [String]()
    
    var usernamee = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        kumuAPI = Kumulos()
        kumuAPI.delegate = self
        kumuAPI.selectUserWithUsername("")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    override func  viewDidAppear(animated: Bool)
    //    {
    //        self.performSegueWithIdentifier("signinView", sender: self)
    //    }

    
    @IBAction func buttonSignin_Onclick(sender: AnyObject)
    {
        for item in someusername
        {
            if (item.isEqual(txtUsername.text))
            {
                for items in somepassword
                {
                    print("---------------")
                    print(items)
                    print("---------------")
                    
                    if(items.isEqual(txtPassword.text))
                    {
                        NSLog("SignIn Success");
                        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("BookPrice") as! BookPrice
                        self.presentViewController(vc, animated: true, completion: nil)
                    }
                    else
                    {
                        let alertController = UIAlertController(title: "Error", message: "Password", preferredStyle: UIAlertControllerStyle.Alert);
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                }
            }
            else
            {
                let alertController = UIAlertController(title: "Error", message: "Username", preferredStyle: UIAlertControllerStyle.Alert);
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
      
    func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectDataDidCompleteWithResult theResults: [AnyObject]!)
    {
        print("*************************************")
        print(theResults)
        print("*************************************")
        
        let json = JSON(theResults)
        //      print("+++++++++++++++++++")
        
        for (var i = 0; i<json.count;i=i+1)
        {
            var usernames = json[i]["username"].stringValue
            var passwords = json[i]["password"].stringValue
            // วนในเจสันหมด แล้วเอามาเก็บไว้ในตัวแปร
                someusername.append(usernames)
                somepassword.append(passwords)
                    print("+++++++++++++++++++")
            
            print(json[i]["password"].stringValue)
            
                    print("+++++++++++++++++++")
        }
    
    }
    
}

