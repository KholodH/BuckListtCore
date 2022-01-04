//
//  BarButtonsDelegate.swift
//  BuckListtCore
//
//  Created by administrator on 04/01/2022.
//

import UIKit
protocol BarButtonsDelegate: class {
    func cancelButtonPressed(by controller: AddToTableViewController)
    
    func saveButtonPressed(by controller: AddToTableViewController , with text : String , at indexPath: NSIndexPath?)

}
