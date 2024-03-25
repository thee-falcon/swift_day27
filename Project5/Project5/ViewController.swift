//
//  ViewController.swift
//  Project5
//
//  Created by Omar Makran on 3/24/24.
//  Copyright © 2024 Omar Makran. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // to hold all the words in the input file.
    var allWords = [String]()
    // will hold all the words the player.
    var useWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         => Bundle.main: Accesses the main bundle of the application,
                      which contains all the resources bundled with the app.
         
         => try?: This is a Swift error-handling mechanism. It tries to perform an operation that might throw an error.
                If an error is thrown, try? returns nil; otherwise, it returns the result of the operation.
         */

        // for searching of the filw 'start.txt' in the Bundle.
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let startWord = try? String(contentsOf: startWordsURL) {
                // splits the string into an array of substrings using the newline.
                allWords = startWord.components(separatedBy: "\n")
            }
        }

        // for protection.
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }

    func startGame() {
        title = allWords.randomElement()
        useWords.removeAll(keepingCapacity: true)
        // telling the table view to refresh its data and update its display.
        tableView.reloadData()
    }
    
    // returns an Int. It specifies the number of rows in a given section of the table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        useWords.count
    }
    
    // returns a UITableViewCell.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = useWords[indexPath.row]
        return cell
    }

}
