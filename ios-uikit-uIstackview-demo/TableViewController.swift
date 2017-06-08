//
//  TableViewController.swift
//  ios-uikit-uIstackview-demo
//
//  Created by OkuderaYuki on 2017/06/05.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

final class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cellItems: [CellItem] = []
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        dummyCellItems()
    }
    
    // MARK: - private
    
    private func setup() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.item = cellItems[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: fileprivate
private extension TableViewController {
    func dummyCellItems() {
            
            // imageとlabel2Textがnilの場合、トルツメ
            var cellItem = CellItem(icons: [],
                                    isNew: false,
                                    image: nil,
                                    label1Text: "1234567890",
                                    label2Text: nil,
                                    label3Text: "qwertyuiop@asdfghjk")
            cellItems.append(cellItem)
            
            // label2Textだけnilの場合、labelを持つstackViewはimageViewと同じ高さ
            cellItem = CellItem(icons: [#imageLiteral(resourceName: "am"), #imageLiteral(resourceName: "ya")],
                                isNew: true,
                                image: #imageLiteral(resourceName: "sampleCellImage"),
                                label1Text: "1234567890",
                                label2Text: nil,
                                label3Text: "qwertyuiop@asdfghjk")
            cellItems.append(cellItem)
            
            cellItem = CellItem(icons: [#imageLiteral(resourceName: "am"), #imageLiteral(resourceName: "an"), #imageLiteral(resourceName: "ap"), #imageLiteral(resourceName: "fa")],
                                isNew: true,
                                image: #imageLiteral(resourceName: "sampleCellImage"),
                                label1Text: "1234567890",
                                label2Text: "qwertyuiop@asdfghjk",
                                label3Text: "1234567890123456789012345678901234567890")
            cellItems.append(cellItem)
            
            cellItem = CellItem(icons: [#imageLiteral(resourceName: "am"), #imageLiteral(resourceName: "an"), #imageLiteral(resourceName: "ap"), #imageLiteral(resourceName: "fa"), #imageLiteral(resourceName: "gi"), #imageLiteral(resourceName: "tw"), #imageLiteral(resourceName: "ya")],
                                isNew: true,
                                image: #imageLiteral(resourceName: "sampleCellImage"),
                                label1Text: "1234567890123456789012345678901234567890",
                                label2Text: "1234567890123456789012345678901234567890",
                                label3Text: "1234567890123456789012345678901234567890")
            cellItems.append(cellItem)
    }
}
