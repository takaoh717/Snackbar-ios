//
//  SecondViewController.swift
//  Example
//
//  Created by Takao Horiguchi on 2018/05/19.
//  Copyright © 2018年 kakaocom. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray

        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.setTitle("back", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)

    }

    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }

}
