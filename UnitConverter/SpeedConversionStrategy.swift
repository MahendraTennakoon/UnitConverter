class SpeedConversionStrategy:MetricConversionStrategy {
    // Base unit is MetresPerSec
    
    func convert(unitFrom: String, unitTo: String, value: Double) -> Double {
        let valueInBaseUnit = convertToBaseUnit(unitFrom: unitFrom, value: value)
        return convertfromBaseUnit(unitTo: unitTo, value: valueInBaseUnit)
    }
    
    func convertfromBaseUnit(unitTo: String, value: Double) -> Double {
        switch unitTo {
        case Speed.MetrePerSec.rawValue:
            return value
        case Speed.FeetPerMinute.rawValue:
            return value * 196.850394
        case Speed.KilometrePerHour.rawValue:
            return value * 3.6
        case Speed.MilesPerHour.rawValue:
            return value * 2.236936
        default:
            return 0
        }
    }
    
    func convertToBaseUnit(unitFrom: String, value: Double) -> Double {
        switch unitFrom {
        case Speed.MetrePerSec.rawValue:
            return value
        case Speed.FeetPerMinute.rawValue:
            return value / 196.850394
        case Speed.KilometrePerHour.rawValue:
            return value / 3.6
        case Speed.MilesPerHour.rawValue:
            return value / 2.236936
        default:
            return 0
        }
    }
}



