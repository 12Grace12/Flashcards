//
//  ViewController.swift
//  Flashcards
//
//  Created by Grace Kayode on 2/14/20.
//  Copyright © 2020 Grace Kayode. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
    var mc1: String
    var mc3: String
    
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // Array to hold out flashcards
    var flashcards = [Flashcard]()
    
    // Current flashcard index
    var currentIndex = 0
    
    
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
        
        //Read from saved data
        readSavedFlashcards()
        
        // Adding our initial flashcard if needed
        if flashcards.count == 0{
            updateFlashcard(question: "What commonly round fruit can also be grown as a square?", answer: "Watermelon", mc1: "Mango", mc3: "Kiwi", isExisting: false)
        }
        else{
            updateLabels()
            updateNextPrevButtons()
        }
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
    @IBAction func didTapOnPrev(_ sender: Any) {
        // Increase current index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabels()
        
        
        //update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        // Increase current index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        
        //update buttons
        updateNextPrevButtons()
    }
    
    func updateLabels(){
        // get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        // update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        frontLabel.isHidden = false;
        
        // update multiple choice options
        btnOption1.setTitle(currentFlashcard.mc1, for: .normal)
        btnOption2.setTitle(currentFlashcard.answer, for: .normal)
        btnOption3.setTitle(currentFlashcard.mc3, for: .normal)
        btnOption1.isHidden = false
        btnOption3.isHidden = false
        
        
    }
    func updateFlashcard(question: String, answer: String, mc1: String, mc3: String, isExisting: Bool ){
        
        let flashcard = Flashcard(question: question, answer: answer, mc1: mc1, mc3: mc3)
        
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        
        
        if isExisting{
            flashcards[currentIndex] = flashcard
        }
        else{
            
            //adding flashcard in flashcards array
            flashcards.append(flashcard)
            
            //logging to the console
            
            print("😎 Added new flashcard")
            print("😎 We now have \(flashcards.count) flashcards")
            
            // Update curreent index
            currentIndex = flashcards.count - 1
            print("😎 Our current index is \(currentIndex)")
        }
        // Update buttons
        updateNextPrevButtons()
        
        // Update labels
        updateLabels()
        
        // Saving array data on disk using UserDefaults
        saveAllFlashcardsToDisk()
        
        
        
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
    func updateNextPrevButtons(){
        
        // disable next button if at end
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }
        else{
             nextButton.isEnabled = true
        }
       
        // prevent user from clicking on prev button when only have 1 card
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
       
    }
    
    func saveAllFlashcardsToDisk(){
        // from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "mc1": card.mc1, "mc3": card.mc3]
        }
        
        // Save array on diskusing UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Log it
        print("🎉 Flashcardssaved to UserDefaults")
    }
    
    func readSavedFlashcards(){
        // Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            // in here we know for sure we have a dictionary Array
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, mc1: dictionary["mc1"]!, mc3: dictionary["mc3"]!)
            }
            
            //Put all these cards in our flashcards array
            
            flashcards.append(contentsOf: savedCards)
            
        }
    }
    
    
    @IBAction func didTapOnDelete(_ sender: Any){
        //show confirmation
        let alert = UIAlertController(title: "Deleted flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ action in self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    func deleteCurrentFlashcard(){
        flashcards.remove(at: currentIndex)
        
        if currentIndex > flashcards.count-1{
            currentIndex = flashcards.count-1
        }
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
        
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



