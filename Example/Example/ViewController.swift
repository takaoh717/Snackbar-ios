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
        button.addTarget(self, action: #selector(self.showSnackbar), for: .touchUpInside)
        button.frame = CGRect(x: view.frame.minX, y: view.frame.midY, width: 300, height: 50)
        button.backgroundColor = UIColor.red
        button.setTitle("show snackbar", for: .normal)

        setupview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupview() {
        snackbar.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 50)
        view.addSubview(snackbar)
        snackbar.backgroundColor = UIColor.red
        snackbar.setupSnackbar(parentView: view)

        snackbar.title.text = "test snackbar"
        snackbar.title.textColor = UIColor.blue
        snackbar.subTitle.text = "sub title"
        snackbar.actionButton.setTitle("button", for: .normal)
    }

    @objc func showSnackbar() {
        snackbar.show()
    }

}

