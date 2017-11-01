//
//  ViewController.swift
//  JSON
//
//  Created by Ammy Pandey on 24/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // declaring url of json
        let url = URL(string: "http://date.jsontest.com")!
        
        //declaring request of url
        let request = NSMutableURLRequest(url: url as URL)
        
        //exexcuting request
        URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            //error
            if error != nil {
                print ("Error: \(error)")
            }
            
            // get json data
            do {
                
                // store json data in new constant
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                
                //secured way to declare new constant that will store json data
                
                guard let parssedJSON = json else{
                    print("Error while parsing json data")
                    return
                }
                
                print(parssedJSON["date"])
                
                
            }catch{
                print("error caught: \(error)")
            }
        }.resume()
        
    }


}

