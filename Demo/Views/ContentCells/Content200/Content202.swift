//
//  Content202.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Content202: UITableViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "feng_1")
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.text = "填充内容1"
        return a
    }()
    lazy private var subLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.text = "填充内容2"
        a.textColor = UIColor.lightGray
        return a
    }()
   
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.headImage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.subLabel)

        
        
        self.contentView.addSubview(self.line)

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.height.equalTo(60)
            make.right.equalTo(-12)
            
        }
        self.nameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(20)
            make.left.equalTo(12)

        }
        self.subLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.nameLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(12)

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
        if aModel is Content202Model{
            let m = aModel as! Content202Model
            
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Content202Model:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 130
    }
}
