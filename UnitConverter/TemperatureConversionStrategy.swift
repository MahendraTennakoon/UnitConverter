class TemperatureConversionStrategy:MetricConversionStrategy {
    // Base unit is Kelvin
    
    func convert(unitFrom: String, unitTo: String, value: Double) -> Double {
        let valueInBaseUnit = convertToBaseUnit(unitFrom: unitFrom, value: value)
        return convertfromBaseUnit(unitTo: unitTo, value: valueInBaseUnit)
    }
    
    func convertfromBaseUnit(unitTo: String, value: Double) -> Double {
        switch unitTo {
        case Temperature.Celcius.rawValue:
            return (value - 273.15)
        case Temperature.Fahrenheit.rawValue:
            return (value * 9 / 5) - 459.67
        case Temperature.Kelvin.rawValue:
            return value
        default:
            return -1
        }
    }
    
    func convertToBaseUnit(unitFrom: String, value: Double) -> Double {
        switch unitFrom {
        case Temperature.Celcius.rawValue:
            return (value + 273.15)
        case Temperature.Fahrenheit.rawValue:
            return (value + 459.67) * 5 / 9
        case Temperature.Kelvin.rawValue:
            return value
        default:
            return -1
        }
    }
}

