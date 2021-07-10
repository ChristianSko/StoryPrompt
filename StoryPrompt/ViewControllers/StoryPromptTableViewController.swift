//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Christian Skorobogatow on 4/7/21.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    
    var storyPrompts = [StoryPromptEntry]()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updataStoryPromptList(notification:)), name: .StoryPromptSaved, object:   nil)

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
    
    
    @IBAction func saveStoryPrompt(unwind: UIStoryboardSegue) {
//        guard let storyPromptVC = unwind.source as? StoryPromptViewController,
//              let storyPrompt = storyPromptVC.storyPrompt else {
//            return
//        }
//        storyPrompts.append(storyPrompt)
//        tableView.reloadData()
    }
    
    @IBAction func cancelStoryPrompt(unwind: UIStoryboardSegue) {
        
    }
    @IBAction func cancelStoryPrompt(_ sender: Any) {
        
    }
    

    @objc func updataStoryPromptList(notification: Notification) {
        guard let storyPrompt = notification.object as? StoryPromptEntry else {
            return
        }
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }

}
