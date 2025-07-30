//
//  ViewController.swift
//  viewcontrollers
//
//  Created by Student on 22/07/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view is loaded")
        
        
    }
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

}

