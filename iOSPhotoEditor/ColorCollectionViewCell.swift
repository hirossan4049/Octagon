//
//  ColorCollectionViewCell.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 5/1/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var checkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.frame.width / 2
        colorView.clipsToBounds = true
        colorView.layer.borderWidth = 2.0
        checkImageView.isHidden = true
        checkImageView.tintColor = .red
        colorView.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
    }
    
    override var isSelected: Bool {
        didSet {
            checkImageView.tintColor = .red
            checkImageView.isHidden = !isSelected
            if isSelected {
//                let previouTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.colorView.layer.borderWidth = 0
                self.colorView.layoutIfNeeded()
                UIView.animate(withDuration: 0.2, animations: {
                    self.colorView.layer.borderWidth = 3.0
//                    self.colorView.transform = previouTransform
//                    self.colorView.transform = self.colorView.transform.scaledBy(x: 1.3, y: 1.3)
                    },
                completion: { _ in
//                    UIView.animate(withDuration: 0.2) {
//                    self.colorView.transform = previouTransform
//                    }
                })
            } else {
//                checkImageView.isHidden  = true
                // animate deselection
                UIView.animate(withDuration: 0.2, animations: {
                    self.colorView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.colorView.layer.borderWidth = 1.0
                    },
                completion: { _ in }
                )
            }
        }
    }
}
