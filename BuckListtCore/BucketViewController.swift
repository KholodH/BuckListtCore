//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 29/12/2021.
//

import UIKit
import CoreData

class BucketViewController: UITableViewController , BarButtonsDelegate {
var lists = [BucketListItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let save = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row].goals
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItem", sender: indexPath)

    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(lists[indexPath.row])
        save()
        tableView.reloadData()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addItem" {
//        let navController = segue.destination as! UINavigationController
//        let addItem = navController.topViewController as! AddToTableViewController
//            addItem.delegate = self
//
//        }
//       else if segue.identifier == "editItem" {
//            let navController = segue.destination as! UINavigationController
//            let addItem = navController.topViewController as! AddToTableViewController
//                addItem.delegate = self
//            let indexPath = sender as! NSIndexPath
//            let item = lists[indexPath.row]
//        addItem.item = item.goals
//           addItem.indexPath = indexPath
//    }
//   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destination = segue.destination as! UINavigationController
         let newViewController = destination.topViewController as! AddToTableViewController
         newViewController.delegate = self
         if let indexPath = sender as? NSIndexPath {
             //let indexPath = sender as! NSIndexPath
            newViewController.item = lists[indexPath.row].goals
             newViewController.indexPath = indexPath
         }
     }
    func fetchAllItems() {
          let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
          do {
              let result = try context.fetch(itemRequest)
              lists = result as! [BucketListItem]
          }catch {
              print(error)
          }
      }
    
    func cancelButtonPressed(by controller: AddToTableViewController) {
        print("pressed")
        dismiss(animated: true, completion: nil)
    }
    func saveButtonPressed(by controller: AddToTableViewController , with text: String , at indexPath: NSIndexPath?){
        if let ip = indexPath {
            lists[ip.row].goals = text
        }
        else {
            
            let itemInList = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: context) as! BucketListItem
                 itemInList.goals = text
                 lists.append(itemInList)
            
        }
        save()
        tableView.reloadData()
        print("saved \(text)")
        dismiss(animated: true, completion: nil)

    }

}



