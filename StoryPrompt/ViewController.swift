//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 25/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nounTextfield: UITextField!
    @IBOutlet weak var adjectiveTextfield: UITextField!
    @IBOutlet weak var verbTextfield: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    
    let storyPrompt = StoryPromptEntry()
    
    @IBAction func changedNumber(_ sender: UISlider) {
        
        numberLabel.text = "Number \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    
    @IBAction func changedStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
        
        print(storyPrompt.genre)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        numberSlider.value = 7.5
        
        storyPrompt.noun = "toasts"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burbs"
        storyPrompt.number = 10
        
        print(storyPrompt)
        
        
    }


}

