//
//  CustomTableViewCell.swift
//  ios-uikit-uIstackview-demo
//
//  Created by OkuderaYuki on 2017/06/05.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

struct CellItem {
    var icons: [UIImage] = []
    var isNew = false
    var image: UIImage?
    var label1Text: String // 必須
    var label2Text: String?
    var label3Text: String // 必須
}

final class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var iconCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var newIcon: UIImageView!
    @IBOutlet fileprivate weak var cellImageView: UIImageView!
    @IBOutlet fileprivate weak var label1: UILabel!
    @IBOutlet fileprivate weak var label2: UILabel!
    @IBOutlet fileprivate weak var label3: UILabel!
    
    var item: CellItem? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupIconCollectionView()
    }
    
    private func setupIconCollectionView() {
        iconCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
        iconCollectionView.dataSource = self
    }
    
    private func setData() {
        let isNew = item?.isNew ?? false
        newIcon.isHidden = !isNew
        
        if let image = item?.image {
            cellImageView.isHidden = false
            cellImageView.image = image
        } else {
            cellImageView.isHidden = true
            cellImageView.image = nil
        }
        
        if let text = item?.label1Text {
            label1.text = text
        }
        
        if let text = item?.label2Text {
            label2.isHidden = false
            label2.text = text
        } else {
            label2.isHidden = true
        }
        
        if let text = item?.label3Text {
            label3.text = text
        }
    }    
}

// MARK: - UICollectionViewDataSource
extension CustomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.icons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as! IconCollectionViewCell
        cell.iconView.image = item?.icons[indexPath.row]
        return cell
    }
}
