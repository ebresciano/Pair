//
//  GroupListTableViewController.swift
//  Pair
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit
import CoreData

class GroupListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         GroupController.sharedController.fetchedResultsController.delegate = self

    }

 // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let sections = GroupController.sharedController.fetchedResultsController.sections else {return 0}
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = GroupController.sharedController.fetchedResultsController.sections else {return 0}
        return sections[section].numberOfObjects
    }
    
    
    // MARK: - Actions

   
    @IBAction func addButtonTapped(sender: AnyObject) {
        presentAlertController()
    }
    
    
    
    //MARK: - Alert Controller
    
    func presentAlertController() {
        
         var nameTextField: UITextField?
    
        let alertController = UIAlertController(title: "Add Person", message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name..."
            nameTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let createAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let name = nameTextField?.text where name.characters.count > 0  else { return }
            GroupController.sharedController.addPersonToGroup(name)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("GroupTableViewCell", forIndexPath: indexPath) as? GroupTableViewCell,
            person = GroupController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Person else {
                return UITableViewCell()
        }
        cell.updateWithPerson(person)

        return cell
    
    }
}
    extension GroupListTableViewController: NSFetchedResultsControllerDelegate {
        
        func controllerWillChangeContent(controller: NSFetchedResultsController) {
            tableView.beginUpdates()
        }
        
        func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
            switch type {
            case .Delete:
                tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
            case .Insert:
                tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Automatic)
            default:
                break
            }
        }
        
        func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
            switch type {
            case .Delete:
                guard let indexPath = indexPath else {return}
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            case .Insert:
                guard let newIndexPath = newIndexPath else {return}
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            case.Update:
                guard let indexPath = indexPath else {return}
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            case .Move:
                guard let indexPath = indexPath, newIndexPath = newIndexPath else {return}
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            }
        }
        
        func controllerDidChangeContent(controller: NSFetchedResultsController) {
            tableView.endUpdates()
        }
    }
    
    
    


