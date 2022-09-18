//
//  Alert.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/18.
//

import Foundation
import UIKit
import SnapKit
import Then

class Alert {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    private let backgroundView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    private let alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
    }
    private var myTargetView: UIView?
    
    func showAlert(with title: String,
                   message: String,
                   on viewController: UIViewController) {
        guard let targetView = viewController.view else {return}
        myTargetView = targetView
        backgroundView.frame = targetView.bounds
        
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        alertView.snp.makeConstraints{ make in
            make.width.equalTo(targetView.frame.size.width - 80)
            make.height.equalTo(300)
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(50)
        }
        
        let alertTitle = UILabel().then{
            $0.text = title
            $0.textAlignment = .center
            $0.textColor = .systemRed
            $0.font = .boldSystemFont(ofSize: 30)
        }
        let alertMessage = UILabel().then {
            $0.text = message
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
        let alertButton = UIButton().then {
            $0.setTitle("창 닫기", for: .normal)
            $0.setTitleColor(.link, for: .normal)
            $0.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        }
        alertView.addSubview(alertTitle)
        alertView.addSubview(alertMessage)
        alertView.addSubview(alertButton)
        alertTitle.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview()
        }
        alertMessage.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(170)
            make.top.equalToSuperview().offset(80)
        }
        alertButton.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(250)
        }
        
        UIView.animate(withDuration: 0.1) {
            // animations
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.25) {
                    // animations
                    self.alertView.center = targetView.center
                }
            }
        }
    }
    
    @objc func dismissAlert() {
        guard let targetView = self.myTargetView else {return}
        UIView.animate(withDuration: 0.25) { [self] in
            // animations
            self.alertView.snp.makeConstraints{ make in
                make.width.equalTo(targetView.frame.size.width - 80)
                make.height.equalTo(300)
                make.leading.equalTo(alertView).offset(40)
                make.bottom.equalTo(alertView).offset(100)
            }
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.25) {
                    // animations
                    self.backgroundView.alpha = 0
                } completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
