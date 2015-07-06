//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Thiago Santos on 08/06/15.
//  Copyright (c) 2015 Thiago Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var items = [Item(name: "Eggplant Brownie", calories: 10),
                Item(name: "Zucchine Muffin", calories: 10),
                Item(name: "Cookie", calories: 10),
                Item(name: "Coconut oil", calories: 10),
                Item(name: "Chocolate frosting", calories: 10),
                Item(name: "Chocolate chip", calories: 10)
            ]
    

    
    @IBOutlet weak var nameField: UITextField?

    @IBOutlet weak var happinessField: UITextField?
    
    var delegate:addAMealDelegate?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let item = items[indexPath.row]
        cell.textLabel!.text = item.name
        return cell
        
    }
    
    @IBAction func add(sender: AnyObject) {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text
        let happiness = happinessField!.text.toInt()
        if happiness == nil {
            return
        }
        let meal = Meal(name: name, happiness: happiness!)
        
        if delegate == nil {
            return
        }
        
        delegate?.add(meal)
        println("eaten: \(meal.name) happiness:  \(meal.happiness)")
        if let nav = self.navigationController {
            nav.popViewControllerAnimated(true)
        }
    }
    
}

