import UIKit

class WeightViewController: UIViewController {
    
    
    @IBOutlet weak var gramsField: UITextField!
    @IBOutlet weak var kilogramsField: UITextField!
    @IBOutlet weak var poundsField: UITextField!
    @IBOutlet weak var ouncesField: UITextField!
    
    @IBAction func updateValue(_ sender: UITextField) {
        let value = Double(sender.text!)
        
        let converter = UnitConvert(strategy: WeightConversionStrategy())
        var grams: Double = 0
        var kilograms: Double = 0
        var pounds: Double = 0
        var ounces: Double = 0
        
        switch sender {
        case gramsField:
            grams = value!
            kilograms = converter.convert(unitFrom: Weight.Gram.rawValue, unitTo: Weight.Kilogram.rawValue, value: value!)
            pounds = converter.convert(unitFrom: Weight.Gram.rawValue, unitTo: Weight.Pound.rawValue, value: value!)
            ounces = converter.convert(unitFrom: Weight.Gram.rawValue, unitTo: Weight.Ounce.rawValue, value: value!)
            break
        case kilogramsField:
            grams = converter.convert(unitFrom: Weight.Kilogram.rawValue, unitTo: Weight.Gram.rawValue, value: value!)
            kilograms = value!
            pounds = converter.convert(unitFrom: Weight.Kilogram.rawValue, unitTo: Weight.Pound.rawValue, value: value!)
            ounces = converter.convert(unitFrom: Weight.Kilogram.rawValue, unitTo: Weight.Ounce.rawValue, value: value!)
            break
        case poundsField:
            grams = converter.convert(unitFrom: Weight.Pound.rawValue, unitTo: Weight.Gram.rawValue, value: value!)
            kilograms = converter.convert(unitFrom: Weight.Pound.rawValue, unitTo: Weight.Kilogram.rawValue, value: value!)
            pounds = value!
            ounces = converter.convert(unitFrom: Weight.Pound.rawValue, unitTo: Weight.Ounce.rawValue, value: value!)
            break
        case ouncesField:
            grams = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Gram.rawValue, value: value!)
            kilograms = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Kilogram.rawValue, value: value!)
            pounds = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Pound.rawValue, value: value!)
            ounces = value!
            break
        default:
            grams = 0
            kilograms = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Kilogram.rawValue, value: grams)
            pounds = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Pound.rawValue, value: grams)
            ounces = converter.convert(unitFrom: Weight.Ounce.rawValue, unitTo: Weight.Pound.rawValue, value: grams)
        }
        
        self.updateUI(grams, kilograms, pounds, ounces)
    }
    
    func updateUI(_ grams: Double, _ kilograms: Double, _ pounds: Double, _ ounces: Double) {
        gramsField.text = String(grams)
        kilogramsField.text = String(kilograms)
        poundsField.text = String(pounds)
        ouncesField.text = String(ounces)
    }
}

