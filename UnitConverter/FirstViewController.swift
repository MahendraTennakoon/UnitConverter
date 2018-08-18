import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var gramsField: UITextField!
    @IBOutlet weak var kilogramsField: UITextField!
    @IBOutlet weak var poundsField: UITextField!
    @IBOutlet weak var ouncesField: UITextField!
    
    // weight in grams
    var weight = 0.0
    
    let gramsInKilogram:Double = 1000.0
    let gramsInPound:Double = 453.592
    let gramsInOunce:Double = 28.3495
    
    @IBAction func updateWeight(_ sender: UITextField) {
        let value = Double(sender.text!)
        
        switch sender {
        case gramsField:
            weight = value!
            break
        case kilogramsField:
            weight = value! * gramsInKilogram
            break
        case poundsField:
            weight = value! * gramsInPound
            break
        case ouncesField:
            weight = value! * gramsInOunce
            break
        default:
            weight = 0
        }
        
        self.updateUI()
    }
    
    func updateUI() {
        gramsField.text = String(weight)
        kilogramsField.text = String(weight / gramsInKilogram)
        poundsField.text = String(weight / gramsInPound)
        ouncesField.text = String(weight / gramsInOunce)
    }
}

