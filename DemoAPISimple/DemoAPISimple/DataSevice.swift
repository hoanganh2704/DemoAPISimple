//
//  DataSevice.swift
//  DemoAPISimple
//
//  Created by Hoàng Anh on 6/24/19.
//  Copyright © 2019 Hoàng Anh. All rights reserved.
//


import UIKit

class DataService  {
    static var sharedInstance: DataService = DataService()
    
    var categoryMusic = [RingTone]()
    
    func getCategoryMusic(completedHandle: @escaping([RingTone]) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/kidanh/ringtones/master/ringtones.json") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let categoryMusicData = try JSONDecoder().decode([RingTone].self, from: data!)
                self.categoryMusic = categoryMusicData
                //print(categoryMusicData)
                DispatchQueue.main.async {
                    completedHandle(self.categoryMusic)
                }
            } catch {}
        })
        
        downloadTask.resume()
        
    }
}
