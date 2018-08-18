protocol MetricConversionStrategy {
    func convertToBaseUnit(unitFrom:String, value:Double) -> Double
    func convertfromBaseUnit(unitTo:String, value:Double) -> Double
    func convert(unitFrom:String, unitTo:String, value: Double) -> Double
}
