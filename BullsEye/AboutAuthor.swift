//
//  AboutAuthor.swift
//  BullsEye
//
//  Created by Kevin on 18/10/2018.
//  Copyright © 2018 Kevin. All rights reserved.
//

import UIKit
import WebKit

class AboutAuthor: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hafur_url = URL(string: "https://www.hafur.com")
        let url_request = URLRequest(url: hafur_url!)
        webView.load(url_request)
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
