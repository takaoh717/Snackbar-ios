//
//  Snackbar.swift
//  Example
//
//  Created by Takao Horiguchi on 2018/04/29.
//  Copyright © 2018年 kakaocom. All rights reserved.
//

import UIKit

public class Snackbar: UIView {

    public var title: UILabel = UILabel()
    public var subTitle: UILabel = UILabel()
    public var actionButton: UIButton = UIButton()

    public var animateDuration: Double = 0.5
    public var dismissDelayTime: Int = 5

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupSnackbar(parentView: UIView) {

//        frame = CGRect(x: 0, y: parentView.frame.height - 100, width: parentView.frame.width, height: 50)
        isUserInteractionEnabled = true

        // set up auto layout
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        heightAnchor.constraint(equalToConstant: frame.height).isActive = true

        // set up title
        parentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true

        // set up subtitle
        parentView.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16).isActive  = true
        subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true

        // set up button
        parentView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: frame.height).isActive = true

    }

    public func show() {
//        DispatchQueue.main.async {
//            self.transform = CGAffineTransform(translationX: 0, y: -100)
//        }
        UIView.animate(withDuration: animateDuration) {
            self.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(dismissDelayTime)) {
            self.dismiss()
        }
    }

    private func dismiss() {
        UIView.animate(withDuration: animateDuration) {
            self.transform = CGAffineTransform(translationX: 1, y: 1)
        }
    }

}
