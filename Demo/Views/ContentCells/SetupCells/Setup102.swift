//
//  Setup102.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Setup102: UITableViewCell {
    
    lazy private var label:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        return a
    }()
 
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.label)
        self.contentView.addSubview(self.line)

        
        self.label.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(-12)
            make.left.equalTo(12)
            make.right.equalTo(-12)

        }
        
      
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Setup102Model{
            
            let m = aModel as! Setup102Model
            self.label.text = m.name
            
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Setup102Model:VueData{
    
    var name:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    override func v_height() -> CGFloat {
        
        return 80
    }
}
