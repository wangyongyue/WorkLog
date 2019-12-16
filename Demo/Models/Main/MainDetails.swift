//
//  MainDetails.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MainDetails:Vue,V_ViewControllerProtocol{
    private var http = DetailsHttp()
    var array = [VueData]()
    var arrayDown = [VueData]()
    var currentIndex = 0

    
    func v_viewController() -> UIViewController{
        let vc = DetailsViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
                
        dealNav()
        dealContent()
        dealDownContent()

    }
    private func dealNav(){
        
        var array = [VueData]()
        let m = NavBackCellModel()
        m.name = ""
        array.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return array
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
    }
    private func dealContent(){
        
        POST().request(params: self.http) { (isK, data) in
                
            self.array = self.http.getArray()
            self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                return self.array
            }
                    
          
        }
        self.v_index(vId: INDEXID) { (index) in
            
            self.currentIndex = index
          
        }
        
        
    }
    private func dealDownContent(){
        
        POST().request(params: self.http) { (isK, data) in
                
          
            self.arrayDown = self.http.getDownArray()
          
             
            self.v_array(vId: DOWNARRAYID) { () -> Array<VueData>? in
                return self.arrayDown
            }
                      
            
        }
        self.v_index(vId: DOWNINDEXID) { (index) in
            
           let m =  self.arrayDown[index] as! MColorDownCellModel
           let b = MColorCellModel(m.name,m.color)
           let m1 =  self.array[self.currentIndex] as! MUpCellModel
           m1.array?.append(b)
           self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
            return self.array
           }
          
        }
        
    }
  
}
