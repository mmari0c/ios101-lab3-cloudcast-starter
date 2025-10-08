//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Mario Cortez on 10/1/25.
//

import UIKit

class ForecastViewController: UIViewController {
    
    private var forecasts = [WeatherForecast]()
    private var selectedForecastIndex = 0
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBAction func didTapBackButton(_ sender: Any) {
        selectedForecastIndex = max(0, selectedForecastIndex - 1)
        configure(with: forecasts[selectedForecastIndex])
    }
    @IBAction func didTapForwardButton(_ sender: Any) {
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1)
        configure(with: forecasts[selectedForecastIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecasts = createMockData()
        configure(with: forecasts[selectedForecastIndex])

        // Do any additional setup after loading the view.
    }
    
    private func createMockData() -> [WeatherForecast] {
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 1
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
        
        let mockData1 = WeatherForecast(windSpeed: 3.3, weatherCode: .violentRainShowers, precipitation: 33.3, temperature: 59.5, date: today)
        
        let mockData2 = WeatherForecast(windSpeed: 3.7, weatherCode: .fog, precipitation: 13.3, temperature: 65.5, date: tomorrow)
        
        let mockData3 = WeatherForecast(windSpeed: 2.8, weatherCode: .partlyCloudy, precipitation: 13.3, temperature: 49.5, date: dayAfterTomorrow)
        
        return [mockData1, mockData2, mockData3]
    }
    
    private func configure(with forecast: WeatherForecast) {
        forecastImageView.image = forecast.weatherCode.image
        descriptionLabel.text = forecast.weatherCode.description
        temperatureLabel.text = "\(forecast.temperature)°F"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: forecast.date)
    }
}
