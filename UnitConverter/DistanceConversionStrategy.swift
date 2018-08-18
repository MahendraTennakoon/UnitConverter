class DistanceConversionStrategy:MetricConversionStrategy {
    // Base unit is Metres
    
    func convert(unitFrom: String, unitTo: String, value: Double) -> Double {
        let valueInBaseUnit = convertToBaseUnit(unitFrom: unitFrom, value: value)
        return convertfromBaseUnit(unitTo: unitTo, value: valueInBaseUnit)
    }
    
    func convertfromBaseUnit(unitTo: String, value: Double) -> Double {
        switch unitTo {
        case Distance.Metre.rawValue:
            return value
        case Distance.Foot.rawValue:
            return value / 0.3048
        case Distance.Yard.rawValue:
            return value / 0.9144
        case Distance.Kilometre.rawValue:
            return value / 1000
        case Distance.Mile.rawValue:
            return value / 1609.34
        default:
            return 0
        }
    }
    
    func convertToBaseUnit(unitFrom: String, value: Double) -> Double {
        switch unitFrom {
        case Distance.Metre.rawValue:
            return value
        case Distance.Foot.rawValue:
            return value * 0.3048
        case Distance.Yard.rawValue:
            return value * 0.9144
        case Distance.Kilometre.rawValue:
            return value * 1000
        case Distance.Mile.rawValue:
            return value * 1609.34
        default:
            return 0
        }
    }
}


