//
//  ViewController.swift
//  Flashcards
//
//  Created by Grace Kayode on 2/14/20.
//  Copyright © 2020 Grace Kayode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        self.frontLabel.isHidden = true
    }
    
    
}

