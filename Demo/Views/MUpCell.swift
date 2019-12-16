//
//  MUpCell.swift
//  Demo
//
//  Created by apple on 2019/12/16.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MUpCell: UICollectionViewCell {
    
    lazy private var m:Vue = {
        let a = Vue()
        return a
    }()
     override init(frame: CGRect) {
     super.init(frame: frame)
        self.backgroundColor = UIColor.clear

        
        
        let table = CTable()
        self.addSubview(table)
        table.backgroundColor = UIColor.clear
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)

        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)

     }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MUpCellModel{
            let m = aModel as! MUpCellModel
            self.m.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                return m.array
            }
            self.m.v_index(vId: INDEXID) { (index) in
                
                m.v_identifier = index
                m.v_to()
            }
        }
    }
}
class MUpCellModel:VueData{
    
    var name:String?
    var array:[VueData]?
    convenience init(_ arr:[VueData]?){
        self.init()
        array = arr
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}


