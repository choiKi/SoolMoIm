//
//  SplitTheBillView.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/19.
//

import Foundation
import Lottie
import SnapKit
import Then
import UIKit

class SplitTheBillView: UIView {
    
    let customAlert = Alert()
    let animationView = AnimationView(name: "70450-bitcoin-calculator")
    
    let lottieView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let stbInfo1 = UILabel().then{
        $0.text = "시원하게 나누자!"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
    }
    let totalAmount = UILabel().then{
        $0.text = "총액"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let totalAmountTextField = UITextField().then{
        $0.placeholder = "총 게산금액을 입력하세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    let participant = UILabel().then{
        $0.text = "총원"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let participantTextField = UITextField().then{
        $0.placeholder = "모임 총원을 입력하세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    
    let resultButton = UIButton().then {
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.backgroundColor = .green
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.layer.borderWidth = 1
        $0.setTitle("모두 입력하세요", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.isEnabled = false
    }
    let result = UILabel().then {
        $0.textColor = .red
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
    }
    
}

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        imageView?.tintColor = .red
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
