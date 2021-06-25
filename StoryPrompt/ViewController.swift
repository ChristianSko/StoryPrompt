//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 25/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyPrompt = StoryPromptEntry()
        
        storyPrompt.noun = "toast"
        storyPrompt.adjective = "smelly"
        storyPrompt.verb = "burbs"
        storyPrompt.number = 10
        
        print(storyPrompt)
        
        
    }


}

