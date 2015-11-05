//
//  ViewController.swift
//  MSM2015-Sample
//
//  Created by Tomohiro Kumagai on H27/11/03.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet var booksTableView:UITableView!
    @IBOutlet var totalPriceLabel:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    @IBAction func sortSelectorSegmentedControlValueChanged(sender:UISegmentedControl) {
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        fatalError("Not Implemented yet")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

