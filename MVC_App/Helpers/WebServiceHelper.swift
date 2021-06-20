//
//  WebServiceHelper.swift
//  MVC_App
//
//  Created by Rajan Arora on 20/06/21.
//

import Foundation

class WebServiceHelper {
    
    
    func fetchData(keyword : String , completionHandler: @escaping (Result<News,Error>) -> Void) {
        
        let urlString = "https://newsapi.org/v2/everything?q=\(keyword)&apiKey=325ac480a4514f6f883a50810a926abb"
        
        guard let url = URL(string: urlString) else {
            print("URL is not formed")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            
            if (error != nil) {
                print(error?.localizedDescription ?? "")
                completionHandler(.failure(error!))
            }
            
            do {
                
                let jsonData = try JSONDecoder().decode(News.self, from: data!)
                completionHandler(.success(jsonData))
            } catch {
                print("Model is not formed")
            }
        }.resume()
        
        
    }
    
}
