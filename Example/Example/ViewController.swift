//
//  ViewController.swift
//  Example
//
//  Created by Takao Horiguchi on 2018/04/29.
//  Copyright © 2018年 kakaocom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // snackbar
    var snackbar = Snackbar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

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

    // setup snackbar
    func setupview() {

        view.addSubview(snackbar)
        snackbar.backgroundColor = UIColor.white

        snackbar.title.text = "saved to list"
        snackbar.title.textColor = UIColor.black

        // if you use subtitle, initialize snackbar.subtitle
        snackbar.subTitle = UILabel()
        snackbar.subTitle?.text = "view list"
        snackbar.subTitle?.textColor = UIColor.lightGray

        // if you use actionButton, initialize snackbar.actionButton
        snackbar.actionButton = UIButton()
        snackbar.actionButton?.setTitle("change", for: .normal)
        snackbar.actionButton?.setTitleColor(UIColor.black, for: .normal)
        snackbar.actionButton?.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

        snackbar.setupSnackbar(parentView: view, position: .top)
    }

    @objc func tapButton() {
        present(SecondViewController(), animated: true, completion: nil)
    }

    @objc func showSnackbar() {
        snackbar.show()
    }

}
