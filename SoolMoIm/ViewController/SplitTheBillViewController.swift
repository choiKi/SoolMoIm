//
//  SplitTheBillViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import SnapKit
import Then

class SplitTheBillViewController: UIViewController {
    
    var ta: Int?
    var ptc: Int?
    
    let stbInfo1 = UILabel().then{
        $0.text = "시원하게 나누자!"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 30)
    }
    let totalAmount = UILabel().then{
        $0.text = "총액"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let totalAmountTextField = UITextField().then{
        $0.placeholder = "총 게산금액을 입력하세요"
        $0.textColor = .gray
    }
    let participant = UILabel().then{
        $0.text = "총원"
        $0.font = .boldSystemFont(ofSize: 15)
    }
    let participantTextField = UITextField().then{
        $0.placeholder = "모임 총원을 입력하세요"
        $0.textColor = .gray
    }
    /*
    let resultLabel = UIButton().then {
        $0
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubview()
        subviewConstraints()
        
    }
    
    func addSubview() {
        view.addSubview(stbInfo1)
        view.addSubview(totalAmount)
        view.addSubview(totalAmountTextField)
        view.addSubview(participant)
        view.addSubview(participantTextField)
    }
    
    func subviewConstraints() {
        stbInfo1.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(20)
        }
        totalAmount.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 2)
            make.height.equalTo(18)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(stbInfo1.snp.bottom).offset(40)
        }
        totalAmountTextField.snp.makeConstraints{ make in
            make.width.equalTo(totalAmount)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(totalAmount.snp.bottom).offset(7)
            
        }
        participant.snp.makeConstraints{ make in
            make.width.equalTo(totalAmount)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(totalAmountTextField.snp.bottom).offset(12)
        }
        participantTextField.snp.makeConstraints{ make in
            make.width.equalTo(participant)
            make.height.equalTo(totalAmount)
            make.leading.equalTo(totalAmount)
            make.top.equalTo(participant.snp.bottom).offset(7)
        }
    }

}
