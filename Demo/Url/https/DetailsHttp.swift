
//
//  DetailsHttp.swift
//  Demo
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class DetailsHttp: HttpProtocol{
    
    var url:String = defaultUrl
    var userId:Int?
    var token:String?
    func getPOSTBody() -> [String:Any]{
        var body = [String:Any]()
        body["userId"] = userId
        body["token"] = token
        return body
    }
    func getArray() -> [VueData]{
         
         var array = [VueData]()
         
        
         array.append(MUpCellModel([MLabelCellModel("06:00"),MColorCellModel("睡觉","sdf")]))
         array.append(MUpCellModel([MLabelCellModel("08:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("10:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("12:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("02:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("04:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("06:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("08:00"),MColorCellModel("睡觉","sdf")]))
        array.append(MUpCellModel([MLabelCellModel("10:00"),MColorCellModel("睡觉","sdf")]))

         return array
    }
    func getDownArray() -> [VueData]{
         
         var array = [VueData]()
         
         array.append(MColorDownCellModel("sdfs","sdfs"))
         array.append(MColorDownCellModel("sdfs","sdfs"))
         array.append(MColorDownCellModel("sdfs","sdfs"))
         array.append(MColorDownCellModel("sdfs","sdfs"))

         return array
    }
    
}


