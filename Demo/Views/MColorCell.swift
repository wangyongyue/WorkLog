//
//  MColorCell.swift
//  Demo
//
//  Created by apple on 2019/12/16.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class MColorCell: UITableViewCell {
        
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .center
        a.font = UIFont.systemFont(ofSize: 15)
        a.text = "欢迎来"
        a.layer.cornerRadius = 20
        a.layer.masksToBounds = true
        a.backgroundColor = UIColor.blue
        a.textColor = UIColor.white
        
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
        if aModel is MColorCellModel{
            
            let m = aModel as! MColorCellModel
            nameLabel.text = m.name

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MColorCellModel:VueData{
    
    var name:String?
    var color:String?
    convenience init(_ a:String?,_ b:String?){
        self.init()
        name = a
        color = b

    }
    
    override func v_height() -> CGFloat {
        
        return 50
    }
}
