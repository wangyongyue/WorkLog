//
//  DetailsViewController.swift
//  Demo
//
//  Created by apple on 2019/12/16.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift

class DetailsViewController: UIViewController {

    var m:Vue?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Configuration.instructions.backgroundColor()
        
        
        
        let style = UIView()
        style.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20)
        style.alpha = 1
        self.view.addSubview(style)
        style.backgroundColor = Configuration.instructions.statusColor()
                
        let navigation = CTable()
        self.view.addSubview(navigation)
        navigation.backgroundColor = Configuration.instructions.statusColor()
        navigation.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topStatus())
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(Adapter.topNavigation())
        }
        navigation.v_array(vId: NAVARRAYID, vue: m)
        navigation.v_index(vId: NAVINDEXID, vue: m)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: WIDTH/3, height: HEIGHT/2)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.view.addSubview(table)
        table.backgroundColor = Configuration.instructions.statusColor()

        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(Adapter.topNavigation() + Adapter.topStatus())
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-(HEIGHT/2 - Adapter.topNavigation() - Adapter.topStatus()))

        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)
        
        
        let downLayout = UICollectionViewFlowLayout()
        downLayout.itemSize = CGSize.init(width: WIDTH/3, height: 50)
        downLayout.scrollDirection = .vertical
        downLayout.minimumLineSpacing = 0
        downLayout.minimumInteritemSpacing = 0
        let downTable = CCollection.init(frame: CGRect.zero, collectionViewLayout: downLayout)
        self.view.addSubview(downTable)
        downTable.backgroundColor = Configuration.instructions.statusColor()

        downTable.snp.makeConstraints { (make) in
            
            make.top.equalTo(table.snp_bottomMargin).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)

        }
        downTable.v_array(vId: DOWNARRAYID, vue: m)
        downTable.v_index(vId: DOWNINDEXID, vue: m)
        
        m?.v_start()
        
    }
   
    

}


