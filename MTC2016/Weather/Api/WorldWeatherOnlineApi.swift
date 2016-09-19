//
//  WeatherAPI.swift
//  MTC2016
//
//  Created by Jonas Stubenrauch on 10.03.16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import UIKit

class WorldWeatherOnlineApi: WeatherApi {

  private static let API_KEY = "d64b24399022f5a72c46fbc1054c6"

  func loadWeatherForQuery(query: String, completion: (weather: Weather?, error: ErrorType?) -> Void) {

    let currentQueue = NSOperationQueue.currentQueue() ?? NSOperationQueue.mainQueue()

    let session = NSURLSession.sharedSession()

    //    https://api.worldweatheronline.com/free/v2/weather.ashx?q=Karlsruhe&num_of_days=5&key=d64b24399022f5a72c46fbc1054c6&format=json

    let url = NSURL(string: "https://api.worldweatheronline.com/free/v2/weather.ashx")!

    let urlComponents = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)!


    let apiKey = NSURLQueryItem(name: "key", value: WorldWeatherOnlineApi.API_KEY)
    let format = NSURLQueryItem(name: "format", value: "json")
    let numberOfDays = NSURLQueryItem(name: "num_of_days", value: "5")
    let query = NSURLQueryItem(name: "q", value: query)

    urlComponents.queryItems = [apiKey, format, numberOfDays, query]

    session.dataTaskWithURL(urlComponents.URL!) { (data, response, error) in
      var weather: Weather?
      var requestError: ErrorType? = error

      guard let data = data where requestError == nil else { return }

      do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        if let weatherData = json["data"] as? [String: AnyObject] {
          weather = Weather(weatherData: weatherData)
        }
      } catch {
        requestError = error
      }

      defer {
        currentQueue.addOperationWithBlock {
          if let weather = weather {
            completion(weather: weather, error: nil)
          } else {
            print("error:\n\(error) \nresponseText:\n \(NSString(data: data, encoding: NSUTF8StringEncoding))")
            completion(weather: nil, error: error)
          }
        }
      }

      }.resume()

  }
}
