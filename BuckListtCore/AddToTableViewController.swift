//
//  AddToTableViewController.swift
//  BuckListtCore
//
//  Created by administrator on 04/01/2022.
//

import UIKit

class AddToTableViewController: UITableViewController {
    weak var delegate: BarButtonsDelegate?
    var item : String?
    var indexPath : NSIndexPath?
    @IBOutlet weak var saveTextFeild: UITextField!
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let text = saveTextFeild.text!
        delegate?.saveButtonPressed(by: self , with :text , at: indexPath)

    }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("cancel")
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveTextFeild.text = item
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


}
