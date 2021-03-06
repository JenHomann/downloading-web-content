//
//  ViewController.swift
//  downloading-web-content
//
//  Created by Jen Homann on 12/6/17.
//  Copyright © 2017 Jen Homann. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    
    @IBOutlet var webKitView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webKitView = WKWebView(frame: .zero, configuration: webConfiguration)
        webKitView.uiDelegate = self
        view = webKitView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        webKitView.load(request)
        webKitView.loadHTMLString("<h1> Hello there!</h1>", baseURL: )
        */
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString!)
                        
                        DispatchQueue.main.sync(execute: {
                            // Update UI as needed
                        })
                    }
                }
            }
            task.resume()
        }
        
        print("Hi there!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

