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
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    override func viewDidLoad() {
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        btnOption1.layer.cornerRadius = 20.0
        btnOption2.layer.cornerRadius = 20.0
        btnOption3.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 20.0
        card.layer.shadowOpacity = 0.4
        btnOption1.layer.borderWidth = 3.0
        btnOption1.layer.borderColor = #colorLiteral(red: 0.4655880317, green: 0.7803921569, blue: 0.4645375346, alpha: 1)
        btnOption2.layer.borderWidth = 3.0
        btnOption2.layer.borderColor = #colorLiteral(red: 0.4655880317, green: 0.7803921569, blue: 0.4645375346, alpha: 1)
        btnOption3.layer.borderWidth = 3.0
        btnOption3.layer.borderColor = #colorLiteral(red: 0.4655880317, green: 0.7803921569, blue: 0.4645375346, alpha: 1)
    
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if self.frontLabel.isHidden == true
        {
            self.frontLabel.isHidden = false
        }
        else{
            self.frontLabel.isHidden = true
        }
    
    }
    
    
    @IBAction func didTapOnBtn1(_ sender: Any) {
        self.btnOption1.isHidden = true
    }
    
    @IBAction func didTapOnBtn2(_ sender: Any) {
        self.frontLabel.isHidden = true
        
    }
    @IBAction func didTapOnBtn3(_ sender: Any) {
        self.btnOption3.isHidden = true
    }
    
    
    
}

