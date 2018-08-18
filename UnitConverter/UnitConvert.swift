class UnitConvert {
    private let strategy: MetricConversionStrategy
    
    init(strategy: MetricConversionStrategy) {
        self.strategy = strategy
    }
    
    func convert(unitFrom:String, unitTo:String, value: Double) -> Double {
        return self.strategy.convert(unitFrom: unitFrom, unitTo: unitTo, value: value)
    }
}
