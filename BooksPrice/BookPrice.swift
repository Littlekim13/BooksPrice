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
    
    var someid = [String]()
    var somename = [String]()
    var someauthors = [String]()
    var someprice = [String]()
    
//BookPriceView
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var authors: UILabel!
    @IBOutlet weak var price: UILabel!
    var pricein: Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        kumuAPI.selectDataWithName_Books(name.text, andAuthors_Books: authors.text, andPrice_Books: pricein, andID_Books: id.text)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        kumuAPI.selectDataWithName_Books(name.text, andAuthors_Books: authors.text, andPrice_Books: pricein, andID_Books: id.text)
        
        
    }
    
    
    @IBAction func books() {

        
    }
    
    
    
    func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectDataDidCompleteWithResult theResults: [AnyObject]!)
    {
        //            print("*************************************")
        //            print(theResults)
        //            print("*************************************")
        
        let json = JSON(theResults)
        //      print("+++++++++++++++++++")
        
        
        for (var x = 0; x<json.count;x=x+1)
        {
            var ids = json[x]["id"].stringValue
            var names = json[x]["name"].stringValue
            var authorss = json[x]["authors"].stringValue
            var prices = json[x]["price"].stringValue
            // วนในเจสันหมด แล้วเอามาเก็บไว้ในตัวแปร
            //   print("+++++++++++++++++++")
            
            someid.append(ids)
            somename.append(names)
            someauthors.append(authorss)
            someprice.append(prices)
            
            print(" ")
            print(json[x]["id"].stringValue)
            print(json[x]["name"].stringValue)
            print(json[x]["authors"].stringValue)
            print(json[x]["price"].stringValue)
            print("+++++++++++++++++++")
        }
    }

    
    
    
    


}