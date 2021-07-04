//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 4/7/21.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    
    var storyPrompts = [StoryPromptEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyprompt1 = StoryPromptEntry()
        let storyprompt2 = StoryPromptEntry()
        let storyprompt3 = StoryPromptEntry()
        
        
        storyprompt1.noun = "toaster"
        storyprompt1.adjective = "smelly"
        storyprompt1.verb = "attacks"
        storyprompt1.number = 5
        
        
        storyprompt2.noun = "toaster"
        storyprompt2.adjective = "smelly"
        storyprompt2.verb = "attacks"
        storyprompt2.number = 5
        
        
        storyprompt3.noun = "toaster"
        storyprompt3.adjective = "smelly"
        storyprompt3.verb = "attacks"
        storyprompt3.number = 5
        
        
        storyPrompts =  [storyprompt1, storyprompt2 , storyprompt3]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storyPrompts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        
        cell.textLabel?.text =  "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        
        performSegue(withIdentifier: "ShowStoryPompt", sender: storyPrompt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPompt" {
            guard let storyPromptVC = segue.destination as? StoryPromptViewController,
                  let storyPrompt = sender as? StoryPromptEntry else {
                return
            }
            storyPromptVC.storyPrompt = storyPrompt
        }
    }


}
