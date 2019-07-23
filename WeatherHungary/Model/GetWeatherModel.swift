//
//  GetWeatherModel.swift
//  WeatherHungary
//
//  Created by Marton Molnar on 2019. 07. 18..
//  Copyright © 2019. Marton Molnar. All rights reserved.
//

import UIKit

protocol DetailsDownloadedProtocol: class {
    func detailsDownloaded(cityDetails: Array<String>)
}

protocol DetailsDownloadFailedProtocol: class {
    func displayMyAlertMessage()
}

class GetWeatherModel: NSObject {

    weak var delegeateDetails: DetailsDownloadedProtocol!
    
    weak var delegeateDetailsDownloadFailed: DetailsDownloadFailedProtocol!
    
    var cityDetailsArray = [String]()
    func getWeather(cityName: String){

        //Get details from openweathermap site
        let url = NSURL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&APPID=c0c6107d78a7d73dcb2c9bc95b5255cf")
        var request = URLRequest(url: url! as URL)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            //Handle no internet connectivity
            if let error = error {
                print("Failed to download data: ", error)
               DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.delegeateDetailsDownloadFailed.displayMyAlertMessage()
                    
                })
            } else {
            
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data!)
                
                        self.cityDetailsArray.append(weatherInfo.main.celsius())
                        self.cityDetailsArray.append(weatherInfo.main.maniHumidity())
                        self.cityDetailsArray.append(weatherInfo.clouds.clouds())
                        self.cityDetailsArray.append(weatherInfo.wind.windspeed())
                        self.cityDetailsArray.append(weatherInfo.sys.sunsetTime())                    
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.delegeateDetails.detailsDownloaded(cityDetails: self.cityDetailsArray)
                    
                })
                
            } catch {
                print("Error: city not found")
            }
            }
            }.resume()
    }    
}
