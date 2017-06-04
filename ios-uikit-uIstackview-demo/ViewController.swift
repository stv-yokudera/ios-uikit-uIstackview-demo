//
//  ViewController.swift
//  ios-uikit-uIstackview-demo
//
//  Created by k_motoyama on 2017/03/07.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAxis()
        setSpace()
        addSubview()
        setDistribution()
    }

    // stackviewにviewを追加する
    private func addSubview(){
        let label = UILabel()
        label.text = "aaa"
        label.textColor = UIColor.black
        stackView.addArrangedSubview(label)
    }
    
    // stackviewから指定したviewを除去する
    private func removeSubview() {
        stackView.removeArrangedSubview(stackView.subviews.first!)
    }
    
    // ビューを並べる方向を設定する
    private func setAxis() {
        stackView.axis = .vertical
    }
    
    // ビュー同士の間隔を設定する
    private func setSpace() {
        stackView.spacing = 5
    }
    
    // 軸に沿ったビューの配置方法を設定する
    private func setDistribution() {
        stackView.distribution = .fillEqually
    }
}
