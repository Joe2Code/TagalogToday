//
//  ViewController.swift
//  TagalogToday
//
//  Created by Joseph Mennemeier on 7/31/16.
//  Copyright © 2016 Joseph Mennemeier. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var words = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard()
        
        if let savedWords = defaults.object(forKey: "Words") as? [String] {
            words = savedWords
        } else {
            saveInitialValues(to: defaults)
        }
        
        let titleAttributes = [NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 22)!]
        
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        title = "TAGALOG TODAY"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func saveInitialValues(to defaults: UserDefaults) {
        words.append("one::isa")
        words.append("two::dalawa")
        words.append("three::tatlo")
        words.append("four::apat")
        words.append("good morning::magandang umaga")
        words.append("hello::mabuhay")
        words.append("How are you?::kamusta ka")
        words.append("good evening::magandang gabi")
        
        defaults.set(words, forKey: "Words")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        
        let word = words[indexPath.row]
        let split = word.components(separatedBy: "::")
        
        cell.textLabel?.text = split[0]
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.detailTextLabel?.text == "" {
                let word = words[indexPath.row]
                let split = word.components(separatedBy: "::")
                cell.detailTextLabel?.text = split[1]
            } else {
                cell.detailTextLabel?.text = ""
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














