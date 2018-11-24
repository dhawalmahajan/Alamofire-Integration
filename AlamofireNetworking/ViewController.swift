//
//  ViewController.swift
//  AlamofireNetworking
//
//  Created by Dhawal Mahajan on 01/10/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let networking = Networking()
    
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        networking.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
            
        }
    }
    @IBAction func button2Pressed(_ sender: UIButton) {
        textView.text = ""
    }
    
    
}

