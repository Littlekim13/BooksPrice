//
//  BookPrice.swift
//  BooksPrice
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
import SwiftyJSON
class BookPrice: UIViewController , KumulosDelegate
{
    var kumuAPI = Kumulos()
    
//BookPriceView
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var authors: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
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
    
    @IBAction func books()
    {
        func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectUserDidCompleteWithResult theResults: [AnyObject]!)
        {
            print("*************************************")
            print(theResults)
            print("*************************************")
            
            let json = JSON(theResults)
        //      print("+++++++++++++++++++")
        
            for (var i = 0; i<json.count;i=i+1)
            {
                var ids = json[i]["id"].stringValue
                var names = json[i]["name"].stringValue
                var authorss = json[i]["authors"].stringValue
                var prices = json[i]["price"].stringValue
            // วนในเจสันหมด แล้วเอามาเก็บไว้ในตัวแปร
                print("+++++++++++++++++++")
            
                print(json[i]["id"].stringValue)
                print(json[i]["name"].stringValue)
                print(json[i]["authors"].stringValue)
                print(json[i]["price"].stringValue)
            
                print("+++++++++++++++++++")
            }
        }
    }

    

}