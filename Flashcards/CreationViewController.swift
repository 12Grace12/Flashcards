//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Grace Kayode on 2/29/20.
//  Copyright © 2020 Grace Kayode. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController{

    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var multiplechoice1: UITextField!

    @IBOutlet weak var multiplechoice3: UITextField!
    
    
    
    var flashcardsController: ViewController!
    var initialQuestion: String?
    var initialAnswer: String?
    var initialMC1: String?
    var initialMC3: String?
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        multiplechoice1.text = initialMC1
        multiplechoice3.text = initialMC3
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        
        let answerText = answerTextField.text
        
        let mc1text = multiplechoice1.text
        
        let mc3text = multiplechoice3.text
        
        // See if it is Existing
        var isExisting = false
        if initialQuestion != nil{
            isExisting = true
        }
        
    
        // check if text empty
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty || mc1text == nil || mc3text == nil || mc1text!.isEmpty || mc3text!.isEmpty)
        {
            // Gives an alert to user if they input blank field
            let alert = UIAlertController(title: "Missing Text!", message: "You need to enter both a question and an answer.", preferredStyle: .alert)
            present(alert, animated: true)
            
            // Allows user to dismiss alert with an Ok button
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
        }
             // Defaults to updated card if all text fields are filled in accordingly
            
        else{
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, mc1: mc1text!, mc3: mc3text!, isExisting: isExisting )
            dismiss(animated: true)
        }
        

    }
    
    
}
