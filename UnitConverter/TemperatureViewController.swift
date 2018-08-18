import UIKit

class TemperatureViewController: UIViewController {

    
    @IBOutlet weak var celciusField: UITextField!
    @IBOutlet weak var fahrenheitField: UITextField!
    @IBOutlet weak var kelvinField: UITextField!
    
    @IBAction func updateValue(_ sender: UITextField) {
        let value = Double(sender.text!)
        
        let converter = UnitConvert(strategy: TemperatureConversionStrategy())
        var kelvin: Double = 0
        var celcius: Double = 0
        var fahrenheit: Double = 0
        
        switch sender {
        case celciusField:
            kelvin = converter.convert(unitFrom: Temperature.Celcius.rawValue, unitTo: Temperature.Kelvin.rawValue, value: value!)
            celcius = value!
            fahrenheit = converter.convert(unitFrom: Temperature.Celcius.rawValue, unitTo: Temperature.Fahrenheit.rawValue, value: value!)
            break
        case fahrenheitField:
            kelvin = converter.convert(unitFrom: Temperature.Fahrenheit.rawValue, unitTo: Temperature.Kelvin.rawValue, value: value!)
            celcius = converter.convert(unitFrom: Temperature.Fahrenheit.rawValue, unitTo: Temperature.Celcius.rawValue, value: value!)
            fahrenheit = value!
            break
        case kelvinField:
            kelvin = value!
            celcius = converter.convert(unitFrom: Temperature.Kelvin.rawValue, unitTo: Temperature.Celcius.rawValue, value: value!)
            fahrenheit = converter.convert(unitFrom: Temperature.Kelvin.rawValue, unitTo: Temperature.Fahrenheit.rawValue, value: value!)
            break
        default:
            // 0 kelvin
            kelvin = 0.0
            celcius = converter.convert(unitFrom: Temperature.Kelvin.rawValue, unitTo: Temperature.Celcius.rawValue, value: kelvin)
            fahrenheit = converter.convert(unitFrom: Temperature.Kelvin.rawValue, unitTo: Temperature.Fahrenheit.rawValue, value: kelvin)
        }
        
        self.updateUI(kelvin, celcius, fahrenheit)
    }
    
    func updateUI(_ kelvin: Double,_ celcius: Double,_ fahrenheit: Double) {
        kelvinField.text = String(kelvin)
        celciusField.text = String(celcius)
        fahrenheitField.text = String(fahrenheit)
    }
}

