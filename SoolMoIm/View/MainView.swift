//
//  MainView.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/19.
//

import Foundation
import Lottie
import SnapKit
import Then
import UIKit

class MainView: UIView {
    
    let animationView = AnimationView(name: "50854-cash-or-card")
    
    let lottieView = UIView().then {
        $0.backgroundColor = .white
    }

    let appInfo1 = UILabel().then{
        $0.text = "분위기만 즐겼는데 억울하게 N빵은 그만!"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 13)
    }
    let appInfo2 = UILabel().then{
        $0.text = "당신의 술자리를 계산해드립니다"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let appTitle = UILabel().then{
        $0.text = "술모임"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 25)
    }
    let splitTheBillBtn = UIButton().then{
        $0.setTitle("N빵하자", for: .normal)
        // 버튼 4개 다 Bold체 적용하기
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    let withoutAlcoholBtn = UIButton().then{
        $0.setTitle("분위기 값 계산", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.isUserInteractionEnabled = true
    }
    let hitAndMissBtn = UIButton().then{
        $0.setTitle("술값은 도박", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.isUserInteractionEnabled = true
    }

    
    // 로티 애니메이션
    func mainAnimation() {
        lottieView.addSubview(animationView)
        lottieView.backgroundColor = .white
        animationView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        animationView.loopMode = .loop
    }
    
}
