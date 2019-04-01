//
//  KeyboardAvoidableViewController.swift
//  KeyboardAvoidable
//
//  Created by Yiyin Shen on 1/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class KeyboardAvoidableViewController: UIViewController {
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        enableKeyboardAvoidable()
    }

    private func enableKeyboardAvoidable() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let size = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
            let curveValue = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber,
            let curve = UIView.AnimationCurve(rawValue: curveValue.intValue)
            else {
                return
        }

        let height = size.cgRectValue.height
        UIView.animate(withDuration: duration.doubleValue) {
            UIView.setAnimationCurve(curve)
            self.bottomConstraint?.constant = height
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        guard
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
            let curveValue = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber,
            let curve = UIView.AnimationCurve(rawValue: curveValue.intValue)
            else {
                return
        }
        UIView.animate(withDuration: duration.doubleValue) {
            UIView.setAnimationCurve(curve)
            self.bottomConstraint?.constant = 0
        }
    }
}
