//
//  OnlyFoodView.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/27.
//

import Foundation
import Lottie
import SnapKit
import Then
import UIKit

class WithoutAlcholView {
    
    let infoText1 = UILabel().then{
        $0.text = "난 분위기만 즐겼어!"
        $0.textAlignment = .center
    }
    let infoText2 = UILabel().then{
        $0.text = "아래의 수치를 입력하면 당신의 술값을 계산해드립니다"
        $0.textAlignment = .center
    }
    let anjuText = UILabel().then{
        $0.text = "총 술값"
    }
    let alcholText = UILabel().then{
        $0.text = "오직 술값"
    }
    let countText = UILabel().then{
        $0.text = "술 안마신사람"
    }
    let anfuTextfield = UITextField().then{
        $0.placeholder = "안주와 술을 포함한 총 가격을 입력하세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    let alcholTextfield = UITextField().then{
        $0.placeholder = "오직 술값만 입력해주세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    let countTextfield = UITextField().then{
        $0.placeholder = "술을 안마신인원수를 적어주세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    let resultButton = UIButton().then{
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
}
