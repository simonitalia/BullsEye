//
//  InfoViewController.swift
//  BullsEye
//
//  Created by Simon Italia on 4/22/18.
//  Copyright © 2018 SDI Group Inc. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoWebView: UIWebView!
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)
    }
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                infoWebView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    
    }
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
