//
//  BookPrice.swift
//  BooksPrice
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 DE DPU. All rights reserved.
//

import UIKit
class BookPrice: UIViewController , KumulosDelegate
{
    var kumuAPI = Kumulos()
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
    
    //    @IBAction func books()
    //    {
    //        let x : Int = 1
    //
    //
    //        let data = kumuAPI.selectDataWithName_Books( name.text, andAuthors_Books: authors.text, andPrice_Books: x, andID_Books: id.text)
    //        //let myString = String(x)
    //    }
    

}