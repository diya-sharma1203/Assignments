//
//  EmojiTableTableViewController.swift
//  Table_Prac
//
//  Created by Student on 25/08/25.
//

import UIKit

class EmojiTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        if let savedEmojis = Emoji.loadFromFile() {
               emojis = savedEmojis
           } else {
               emojis = Emoji.sampleEmojis()
           }
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    var emojis : [Emoji] = []
    func saveEmojis() {
        Emoji.saveToFile(emojis : emojis)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
          content.text = "\(emojis[indexPath.row].symbol)-\(emojis[indexPath.row].name)"
          content.secondaryText = "\(emojis[indexPath.row].description)"
          
          cell.contentConfiguration = content
          return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        saveEmojis()
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedEmoji, at: to.row)
        saveEmojis()

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "nextPage", sender: indexPath)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    
    @IBSegueAction func addEdit(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
            guard let sender = sender as? IndexPath else {
                return AddEditTableViewController(coder: coder, emoji: nil)
            }
            
        return AddEditTableViewController(coder: coder, emoji :emojis[sender.row])
    }
    
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        guard  segue.identifier == "saveSegue" ,let addEditTVC = segue.source as? AddEditTableViewController, let emoji = addEditTVC.emoji  else {return}
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            emojis.append(emoji)
            let indexPath = IndexPath(row: emojis.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .fade)
            return }
        
        emojis[selectedIndexPath.row] = emoji
        tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        saveEmojis()
        
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
