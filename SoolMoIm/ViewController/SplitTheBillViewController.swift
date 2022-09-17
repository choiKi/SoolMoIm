//
//  SplitTheBillViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import Lottie
import SnapKit
import Then

class SplitTheBillViewController: UIViewController {
    
    var ta: Int?
    var ptc: Int?
    
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
    }
    let participant = UILabel().then{
        $0.text = "총원"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let participantTextField = UITextField().then{
        $0.placeholder = "모임 총원을 입력하세요"
        $0.textColor = .gray
        $0.borderStyle = .roundedRect
    }
    
    let resultButton = UIButton().then {
        $0.setTitle("계산 시작", for: .normal)
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.backgroundColor = .green
        $0.addTarget(self, action: #selector(startCalculate), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        subviewConstraints()
        navigationTitleHidden()

    }
    @objc func startCalculate(sender: UIButton!) {
        calculateAnimation()
    }
    
    func addSubview() {
        view.backgroundColor = .white
        view.addSubview(lottieView)
        view.addSubview(stbInfo1)
        view.addSubview(totalAmount)
        view.addSubview(totalAmountTextField)
        view.addSubview(participant)
        view.addSubview(participantTextField)
        view.addSubview(resultButton)
    }
    
    func subviewConstraints() {
        lottieView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(250)
            make.bottom.equalToSuperview().offset(-10)
        }
        stbInfo1.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(80)
        }
        totalAmount.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 1.5)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(stbInfo1.snp.bottom).offset(20)
        }
        totalAmountTextField.snp.makeConstraints{ make in
            make.width.equalTo(totalAmount)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(totalAmount.snp.bottom).offset(12)
            
        }
        participant.snp.makeConstraints{ make in
            make.width.equalTo(totalAmount)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(totalAmountTextField.snp.bottom).offset(20)
        }
        participantTextField.snp.makeConstraints{ make in
            make.width.equalTo(participant)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(participant.snp.bottom).offset(12)
        }
        resultButton.snp.makeConstraints{ make in
            make.height.equalTo(70)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.top.equalTo(participantTextField.snp.bottom).offset(30)
        }
    }
    
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func calculateAnimation() {
        self.lottieView.addSubview(self.animationView)
        self.animationView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        self.animationView.play()
        self.animationView.loopMode = .repeat(2)
    }
}
