//
//  Loading.swift
//
//
//  Created by Jalal Najafi.
//  Copyright © 2018  . All rights reserved.
//

import UIKit
protocol LoadingDelegate: class {
    func handleErrorSelected()
}
class Loading: UIView {

    @IBOutlet weak var errorHandlingButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var delegate: LoadingDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        CommonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CommonInit()
    }
    private func CommonInit() {
        Bundle.main.loadNibNamed("Loading", owner: self, options: nil)
        addSubview(contentView)
        self.layoutIfNeeded()
        contentView.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: UIScreen.main.bounds.width, height: self.bounds.height)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.activityIndicator.tintColor = UIColor.agriGreen
        self.activityIndicator.hidesWhenStopped = true
        self.layoutIfNeeded()
    }
    func startLoading() {
        self.messageLabel.isHidden = true
        self.activityIndicator.startAnimating()
    }
    func stopLoading() {
        self.messageLabel.isHidden = false
        self.activityIndicator.stopAnimating()
    }
    func setMessageLabel(_ message: String) {
        self.messageLabel.text = message
        self.stopLoading()
    }
    func setButtonTitle(title: String) {
        self.errorHandlingButton.isHidden = false
        self.errorHandlingButton.setTitle(title, for: .normal)
    }
    func hideButton() {
        self.errorHandlingButton.isHidden = true
    }
    @IBAction func handleErrorAction(_ sender: UIButton) {
        self.delegate?.handleErrorSelected()
    }
    
}
