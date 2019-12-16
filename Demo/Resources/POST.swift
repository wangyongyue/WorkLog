//
//  POST.swift
//  Demo
//
//  Created by wangyongyue on 2019/7/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class POST: NSObject {
    
    func request(params:HttpProtocol?,http:POSTProtocol){
        
        if let p = params{
            
            let url = p.url
            let body = p.getPOSTBody()
            Debug.log(url)
            Debug.log(body)

            //虚假延迟1秒
            Alert.loading()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
                Alert.dissmiss()
                http.POSTHttpWithData(http, "data")
            }
        }
        
    }
    func request(params:HttpProtocol?,results:@escaping (Bool,Any) -> ()){
        
        if let p = params{
            
            let url = p.url
            let body = p.getPOSTBody()
            Debug.log(url)
            Debug.log(body)
            //虚假延迟1秒
            Alert.loading()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
                
                Alert.dissmiss()
                results(true,"data")
            }
           
        }
        
    }

}
protocol POSTProtocol {
    
    func POSTHttpWithData(_ httP:POSTProtocol,_ data:Any)
    func POSTHttpWithError(_ httP:POSTProtocol,_ error:String)

}

class Debug: NSObject {
    
    static func log<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line)
    {
        #if DEBUG
        let fName = ((fileName as NSString).pathComponents.last!)
        print("\(fName).\(methodName)[\(lineNumber)]: \(message)")
        #else
        #endif
    }
    
    
}
