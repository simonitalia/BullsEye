//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Simon Italia on 4/22/18.
//  Copyright © 2018 SDI Group Inc. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {

    @IBOutlet weak var authorWebView: UIWebView!
    
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "Credits", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                authorWebView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
