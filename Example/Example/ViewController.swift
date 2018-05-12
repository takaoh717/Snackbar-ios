//
//  ViewController.swift
//  Example
//
//  Created by Takao Horiguchi on 2018/04/29.
//  Copyright © 2018年 kakaocom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var snackbar = Snackbar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showSnackbar), for: .touchUpInside)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.setTitle("show snackbar", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        setupview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupview() {

        view.addSubview(snackbar)
        snackbar.backgroundColor = UIColor.darkGray
        snackbar.setupSnackbar(parentView: view)

        snackbar.title.text = "test snackbar"
        snackbar.title.textColor = UIColor.blue
        snackbar.subTitle.text = "sub title"
        snackbar.subTitle.textColor = UIColor.black
        snackbar.actionButton.setTitle("button", for: .normal)
    }

    @objc func showSnackbar() {
        snackbar.show()
    }

}

