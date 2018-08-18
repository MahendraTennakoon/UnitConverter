class WeightConversionStrategy:MetricConversionStrategy {
    func convert(unitFrom: String, unitTo: String, value: Double) -> Double {
        return 100.0
    }
    
    func convertfromBaseUnit(unitTo: String, value: Double) -> Double {
        return 100.0
    }
    
    func convertToBaseUnit(unitFrom: String, value: Double) -> Double {
        return 100.0
    }
}
