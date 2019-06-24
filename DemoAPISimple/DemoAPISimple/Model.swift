//
//  Model.swift
//  DemoAPISimple
//
//  Created by Hoàng Anh on 6/24/19.
//  Copyright © 2019 Hoàng Anh. All rights reserved.
//

import UIKit

struct RingTone : Codable {
    var id: Int
    var title: String
    var genre: String
    var artist: String
    var duration: Double
    var rate: Double
    var filename: String
}
