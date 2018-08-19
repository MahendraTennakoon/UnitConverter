import UIKit

class DistanceViewController: UIViewController {
    
    @IBOutlet weak var metresField: UITextField!
    @IBOutlet weak var footField: UITextField!
    @IBOutlet weak var yardsField: UITextField!
    @IBOutlet weak var kilometresField: UITextField!
    @IBOutlet weak var milesField: UITextField!
    
    
    @IBAction func updateValue(_ sender: UITextField) {
        guard let value = Double(sender.text!) else {
            return
        }
        
        let converter = UnitConvert(strategy: DistanceConversionStrategy())
        var metres: Double = 0
        var feet: Double = 0
        var yards: Double = 0
        var kilometres: Double = 0
        var miles: Double = 0
        
        switch sender {
        case metresField:
            metres = value
            feet = converter.convert(unitFrom: Distance.Metre.rawValue, unitTo: Distance.Foot.rawValue, value: value)
            yards = converter.convert(unitFrom: Distance.Metre.rawValue, unitTo: Distance.Yard.rawValue, value: value)
            kilometres = converter.convert(unitFrom: Distance.Metre.rawValue, unitTo: Distance.Kilometre.rawValue, value: value)
            miles = converter.convert(unitFrom: Distance.Metre.rawValue, unitTo: Distance.Mile.rawValue, value: value)
            break
        case footField:
            metres = converter.convert(unitFrom: Distance.Foot.rawValue, unitTo: Distance.Metre.rawValue, value: value)
            feet = value
            yards = converter.convert(unitFrom: Distance.Foot.rawValue, unitTo: Distance.Yard.rawValue, value: value)
            kilometres = converter.convert(unitFrom: Distance.Foot.rawValue, unitTo: Distance.Kilometre.rawValue, value: value)
            miles = converter.convert(unitFrom: Distance.Foot.rawValue, unitTo: Distance.Mile.rawValue, value: value)
            break
        case yardsField:
            metres = converter.convert(unitFrom: Distance.Yard.rawValue, unitTo: Distance.Metre.rawValue, value: value)
            feet = converter.convert(unitFrom: Distance.Yard.rawValue, unitTo: Distance.Foot.rawValue, value: value)
            yards = value
            kilometres = converter.convert(unitFrom: Distance.Yard.rawValue, unitTo: Distance.Kilometre.rawValue, value: value)
            miles = converter.convert(unitFrom: Distance.Yard.rawValue, unitTo: Distance.Mile.rawValue, value: value)
            break
        case kilometresField:
            metres = converter.convert(unitFrom: Distance.Kilometre.rawValue, unitTo: Distance.Metre.rawValue, value: value)
            feet = converter.convert(unitFrom: Distance.Kilometre.rawValue, unitTo: Distance.Foot.rawValue, value: value)
            yards = converter.convert(unitFrom: Distance.Kilometre.rawValue, unitTo: Distance.Yard.rawValue, value: value)
            kilometres = value
            miles = converter.convert(unitFrom: Distance.Kilometre.rawValue, unitTo: Distance.Mile.rawValue, value: value)
            break
        case milesField:
            metres = converter.convert(unitFrom: Distance.Mile.rawValue, unitTo: Distance.Metre.rawValue, value: value)
            feet = converter.convert(unitFrom: Distance.Mile.rawValue, unitTo: Distance.Foot.rawValue, value: value)
            yards = converter.convert(unitFrom: Distance.Mile.rawValue, unitTo: Distance.Yard.rawValue, value: value)
            kilometres = converter.convert(unitFrom: Distance.Mile.rawValue, unitTo: Distance.Kilometre.rawValue, value: value)
            miles = value
            break
        default:
            metres = 0
            feet = 0
            yards = 0
            kilometres = 0
            miles = 0
        }
        
        self.updateUI(metres, feet, yards, kilometres, miles)
    }
    
    func updateUI(_ metres: Double, _ feet: Double, _ yards: Double, _ kilometres: Double, _ miles: Double) {
        metresField.text = String(metres)
        footField.text = String(feet)
        yardsField.text = String(yards)
        kilometresField.text = String(kilometres)
        milesField.text = String(miles)
    }
}


