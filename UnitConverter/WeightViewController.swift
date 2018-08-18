import UIKit

class WeightViewController: UIViewController {
    
    
    @IBOutlet weak var gramsField: UITextField!
    @IBOutlet weak var kilogramsField: UITextField!
    @IBOutlet weak var poundsField: UITextField!
    @IBOutlet weak var ouncesField: UITextField!
    
    // weight in grams
    var weightInGrams = 0.0
    
    @IBAction func updateWeight(_ sender: UITextField) {
        let value = Double(sender.text!)
        
        switch sender {
        case gramsField:
            weightInGrams = value!
            break
        case kilogramsField:
            weightInGrams = value! * Weight.gramsInKilogram.rawValue
            break
        case poundsField:
            weightInGrams = value! * Weight.gramsInPound.rawValue
            break
        case ouncesField:
            weightInGrams = value! * Weight.gramsInOunce.rawValue
            break
        default:
            weightInGrams = 0
        }
        
        self.updateUI()
    }
    
    func updateUI() {
        gramsField.text = String(weightInGrams)
        kilogramsField.text = String(weightInGrams / Weight.gramsInKilogram.rawValue)
        poundsField.text = String(weightInGrams / Weight.gramsInPound.rawValue)
        ouncesField.text = String(weightInGrams / Weight.gramsInOunce.rawValue)
    }
}

