//
//  CustomizeCell.swift
//  Blocks
//
//  Created by Quan on 7/27/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class CustomizeCell: UITableViewCell {
    
    var kCellWidth: CGFloat = 400
    var kCellHeight: CGFloat = 200
    var kLblHeight: CGFloat = 30
    var kLblWidth: CGFloat = 200
    var photoForModel: UIImageView!
    var infoView: UIView!
    var lbl_Name: UILabel!
    var lbl_Height: UILabel!
    var lbl_Sodo3vong: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    
    func addSubviews() {
        if photoForModel == nil {
            photoForModel = UIImageView(frame: CGRect(x: kLblWidth, y: 0, width: kCellHeight, height: kCellHeight))
            contentView.addSubview(photoForModel)
        }
        
        if infoView == nil {
            infoView = UIView(frame: CGRect(x: 0, y: 0, width: kLblWidth, height: kCellHeight))
            if lbl_Name == nil {
                lbl_Name = UILabel(frame: CGRect(x: 0, y: 0, width: kLblWidth, height: kLblHeight))
                infoView.addSubview(lbl_Name)
                
            }
            if lbl_Height == nil {
                lbl_Height = UILabel(frame: CGRect(x: 0, y: kLblHeight, width: kLblWidth, height: kLblHeight))
                infoView.addSubview(lbl_Height)
                
            }
            if lbl_Sodo3vong == nil {
                lbl_Sodo3vong = UILabel(frame: CGRect(x: 0, y: kLblHeight * 2.0, width: kLblWidth, height: kLblHeight))
                infoView.addSubview(lbl_Sodo3vong)
            }
            
            
            contentView.addSubview(infoView)
        }
    }
}
