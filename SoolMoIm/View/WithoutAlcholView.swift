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
    
    let customAlert = Alert()
    
    let infoText1 = UILabel().then{
        $0.text = "난 분위기만 즐겼어!"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    let infoText2 = UILabel().then{
        $0.text = "억울하지않게 내 술값만 계산한다"
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .center
    }
    let anjuText = UILabel().then{
        $0.text = "총 술값"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    let alcholText = UILabel().then{
        $0.text = "오직 술값"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    let countText = UILabel().then{
        $0.text = "총 인원"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    let countText2 = UILabel().then{
        $0.text = "술 안마신사람"
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    let anfuTextfield = UITextField().then{
        $0.placeholder = "안주와 술을 포함한 총 가격을 입력하세요"
        $0.font = .systemFont(ofSize: 15)
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
        $0.placeholder = "총 인원"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    let countTextfield2 = UITextField().then{
        $0.placeholder = "술 안마신인원"
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
    let result1 = UILabel().then {
        $0.textColor = .red
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        $0.text = ""
    }
    let result2 = UILabel().then {
        $0.textColor = .blue
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textAlignment = .center
        $0.text = ""
    }
}
