import UIKit

class ViewController: UIViewController {
        
    @IBOutlet var booksTableView: UITableView!
    @IBOutlet var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
    }

    @IBAction func sortSelectorSegmentedControlValueChanged(sender: UISegmentedControl) {
        
        
    }
}

extension ViewController : UITableViewDataSource {
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        fatalError("Not Implemented yet")
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
}

