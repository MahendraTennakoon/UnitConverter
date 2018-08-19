class WeightConversionStrategy:MetricConversionStrategy {
    // Base unit is Gram
    
    func convert(unitFrom: String, unitTo: String, value: Double) -> Double {
        let valueInBaseUnit = convertToBaseUnit(unitFrom: unitFrom, value: value)
        return convertfromBaseUnit(unitTo: unitTo, value: valueInBaseUnit)
    }
    
    func convertfromBaseUnit(unitTo: String, value: Double) -> Double {
        switch unitTo {
        case Weight.Gram.rawValue:
            return value
        case Weight.Kilogram.rawValue:
            return value / 1000
        case Weight.Pound.rawValue:
            return value / 453.592
        case Weight.Ounce.rawValue:
            return value / 28.3495
        default:
            return -1
        }
    }
    
    func convertToBaseUnit(unitFrom: String, value: Double) -> Double {
        switch unitFrom {
        case Weight.Gram.rawValue:
            return value
        case Weight.Kilogram.rawValue:
            return value * 1000
        case Weight.Pound.rawValue:
            return value * 453.592
        case Weight.Ounce.rawValue:
            return value * 28.3495
        default:
            return -1
        }
    }
}
