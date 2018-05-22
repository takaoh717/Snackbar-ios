//
//  Snackbar.swift
//  Example
//
//  Created by Takao Horiguchi on 2018/04/29.
//  Copyright © 2018年 kakaocom. All rights reserved.
//

import UIKit

public enum BarPosition {
    case top
    case bottom
}

public class Snackbar: UIView {

    public var title: UILabel = UILabel()
    public var subTitle: UILabel?
    public var actionButton: UIButton?

    public var animateDuration: Double = 0.3
    public var dismissDelayTime: Int = 3

    fileprivate var workItem: DispatchWorkItem?

    fileprivate var barPosition: BarPosition!

    fileprivate var transformY: CGFloat {
        switch barPosition {
        case .top:
            return self.frame.height
        case .bottom:
            return -self.frame.height
        default:
            return 0
        }
    }

    fileprivate func positionConstraint(parentView: UIView) -> NSLayoutConstraint {
        switch barPosition {
        case .top:
            return bottomAnchor.constraint(equalTo: parentView.topAnchor)
        case .bottom:
            return topAnchor.constraint(equalTo: parentView.bottomAnchor)
        default:
            return topAnchor.constraint(equalTo: parentView.bottomAnchor)
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupSnackbar(parentView: UIView, position: BarPosition) {

        barPosition = position

        frame = CGRect(x: 0, y: 0, width: parentView.frame.width, height: 80)
        isUserInteractionEnabled = true

        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)

        // set up auto layout
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: frame.height).isActive = true

        positionConstraint(parentView: parentView).isActive = true
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: frame.width).isActive = true

        // set up title
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        title.heightAnchor.constraint(equalToConstant: 16)
        title.font = UIFont.boldSystemFont(ofSize: 16)

        // set up subtitle
        if let subTitle = subTitle {
            title.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true

            self.addSubview(subTitle)
            subTitle.translatesAutoresizingMaskIntoConstraints = false
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4).isActive  = true
            subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
            subTitle.heightAnchor.constraint(equalToConstant: 12)
            subTitle.font = UIFont.systemFont(ofSize: 12)
        } else {
            title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }

        // set up button
        if let actionButton = actionButton {
            self.addSubview(actionButton)
            actionButton.translatesAutoresizingMaskIntoConstraints = false
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            actionButton.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
            actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        }

    }

    public func show() {
        UIView.animate(withDuration: animateDuration) {
            self.transform = CGAffineTransform(translationX: 0, y: self.transformY)
        }

        workItem?.cancel()

        workItem = DispatchWorkItem {
            self.dismiss()
        }

        if let workItem = workItem {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(dismissDelayTime), execute: workItem)
        }
    }

    private func dismiss() {
        UIView.animate(withDuration: animateDuration) {
            self.transform = CGAffineTransform(translationX: 1, y: 1)
        }
        workItem = nil
    }

}
