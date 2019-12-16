//
//  MLabelCell.swift
//  Demo
//
//  Created by apple on 2019/12/16.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class MLabelCell: UITableViewCell {
        
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.font = UIFont.systemFont(ofSize: 15)
        a.text = "欢迎来"
        a.layer.cornerRadius = 20
        a.layer.masksToBounds = true
        a.layer.borderWidth = 1
        a.layer.borderColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0).cgColor
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
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.line)

        self.nameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(0)
        }
    
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0)
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
        if aModel is MLabelCellModel{
            
            let m = aModel as! MLabelCellModel
            nameLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MLabelCellModel:VueData{
    
    var name:String?
    convenience init(_ a:String?){
        self.init()
        name = a
    }
    override func v_height() -> CGFloat {
        
        return 50
    }
}
