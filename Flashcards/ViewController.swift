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
    func updateFlashcard(question: String, answer: String, mc1: String, mc3: String){
        frontLabel.text = question
        backLabel.text = answer
        btnOption1.setTitle(mc1, for : .normal)
        btnOption2.setTitle(answer, for : .normal)
        btnOption3.setTitle(mc3, for : .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to  self
        creationController.flashcardsController = self
        
        
        //Checks if user clicked on correct segue (the pencil icon)
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            
            creationController.initialMC1 = btnOption1.titleLabel!.text
            creationController.initialMC3 = btnOption3.titleLabel!.text
            
        }
    }

    // Checks which button was pressed
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


