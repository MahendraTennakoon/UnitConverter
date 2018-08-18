import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var gramsField: UITextField!
    @IBOutlet weak var kilogramsField: UITextField!
    // weight in grams
    var weight = 0.0
    
    
    @IBAction func updateWeight(_ sender: UITextField) {
        let value = Double(sender.text!)
        
        switch sender {
        case gramsField:
            weight = value!
            break
        case kilogramsField:
            weight = value! * 1000
            break
        default:
            weight = 0
        }
        
        self.updateUI()
    }
        
    func updateUI() {
        gramsField.text = String(weight)
        kilogramsField.text = String(weight / 1000)
    }
}

