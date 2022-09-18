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
        // red gradient
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = CGColor(red: 1, green: 1, blue: 1 , alpha: 1)
        $0.layer.borderWidth = 1
        $0.backgroundColor = .orange
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
            make.height.equalTo(450)
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(50)
        }
        
        let alertImage = UIImageView().then{
            $0.image = UIImage(systemName: "x.circle")
            $0.tintColor = UIColor.white
        }
        let alertTitle = UILabel().then{
            $0.text = title
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = .boldSystemFont(ofSize: 30)
        }
        let alertMessage = UILabel().then {
            $0.text = message
            $0.textAlignment = .center
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        let alertButton = UIButton().then {
            $0.setTitle("술깨고 다시 입력하기", for: .normal)
            $0.setTitleColor(.link, for: .normal)
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20
            $0.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        }
        
        alertView.addSubview(alertImage)
        alertView.addSubview(alertTitle)
        alertView.addSubview(alertMessage)
        alertView.addSubview(alertButton)
        
        alertImage.snp.makeConstraints{ make in
            make.height.equalTo(180)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-35)
            make.top.equalToSuperview().offset(10)
        }
        alertTitle.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalTo(alertImage.snp.bottom)
        }
        alertMessage.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalTo(alertTitle.snp.bottom)
        }
        alertButton.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(alertMessage.snp.bottom)
            
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
                make.bottom.equalToSuperview()
                make.width.equalTo(targetView.frame.size.width - 80)
                make.height.equalTo(300)
                make.leading.equalTo(alertView).offset(40)
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

/*
extension UIView {
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            CGColor(red: 0.988, green: 0.513, blue: 0.513, alpha: 0.7),
            CGColor(red: 0.988, green: 0.305, blue: 0.305, alpha: 1),
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.addSublayer(gradientLayer)
    }
}
*/
