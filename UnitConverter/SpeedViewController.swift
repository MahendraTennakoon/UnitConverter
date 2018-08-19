import UIKit

class SpeedViewController: UIViewController {
    
    
    @IBOutlet weak var metresPerSecField: UITextField!
    @IBOutlet weak var feetPerMinField: UITextField!
    @IBOutlet weak var kilometresPerHourField: UITextField!
    @IBOutlet weak var milesPerHourField: UITextField!
    
    
    @IBAction func updateValue(_ sender: UITextField) {
        guard let value = Double(sender.text!) else {
            return
        }
        
        let converter = UnitConvert(strategy: SpeedConversionStrategy())
        var metresPerSec: Double = 0
        var feetPerMin: Double = 0
        var kilometresPerHour: Double = 0
        var milesPerSec: Double = 0
        
        switch sender {
        case metresPerSecField:
            metresPerSec = value
            feetPerMin = converter.convert(unitFrom: Speed.MetrePerSec.rawValue, unitTo: Speed.FeetPerMinute.rawValue, value: value)
            kilometresPerHour = converter.convert(unitFrom: Speed.MetrePerSec.rawValue, unitTo: Speed.KilometrePerHour.rawValue, value: value)
            milesPerSec = converter.convert(unitFrom: Speed.MetrePerSec.rawValue, unitTo: Speed.MilesPerHour.rawValue, value: value)
            break
        case feetPerMinField:
            metresPerSec = converter.convert(unitFrom: Speed.FeetPerMinute.rawValue, unitTo: Speed.MetrePerSec.rawValue, value: value)
            feetPerMin = value
            kilometresPerHour = converter.convert(unitFrom: Speed.FeetPerMinute.rawValue, unitTo: Speed.KilometrePerHour.rawValue, value: value)
            milesPerSec = converter.convert(unitFrom: Speed.FeetPerMinute.rawValue, unitTo: Speed.MilesPerHour.rawValue, value: value)
            break
        case kilometresPerHourField:
            metresPerSec = converter.convert(unitFrom: Speed.KilometrePerHour.rawValue, unitTo: Speed.MetrePerSec.rawValue, value: value)
            feetPerMin = converter.convert(unitFrom: Speed.KilometrePerHour.rawValue, unitTo: Speed.FeetPerMinute.rawValue, value: value)
            kilometresPerHour = value
            milesPerSec = converter.convert(unitFrom: Speed.KilometrePerHour.rawValue, unitTo: Speed.MilesPerHour.rawValue, value: value)
            break
        case milesPerHourField:
            metresPerSec = converter.convert(unitFrom: Speed.MilesPerHour.rawValue, unitTo: Speed.MetrePerSec.rawValue, value: value)
            feetPerMin = converter.convert(unitFrom: Speed.MilesPerHour.rawValue, unitTo: Speed.FeetPerMinute.rawValue, value: value)
            kilometresPerHour = converter.convert(unitFrom: Speed.MilesPerHour.rawValue, unitTo: Speed.KilometrePerHour.rawValue, value: value)
            milesPerSec = value
            break
        default:
            metresPerSec = 0
            feetPerMin = 0
            kilometresPerHour = 0
            milesPerSec = 0
        }
        
        self.updateUI(metresPerSec, feetPerMin, kilometresPerHour, milesPerSec)
    }
    
    func updateUI(_ metresPerSec: Double, _ feetPerMin: Double, _ kilometresPerHour: Double, _ milesPerSec: Double) {
        metresPerSecField.text = String(metresPerSec)
        feetPerMinField.text = String(feetPerMin)
        kilometresPerHourField.text = String(kilometresPerHour)
        milesPerHourField.text = String(milesPerSec)
    }
}



