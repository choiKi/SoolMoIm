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
    
    private let splitTheBillView = SplitTheBillView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        subviewConstraints()
        navigationTitleHidden()
        blockPressBtn(sender: splitTheBillView.participantTextField)

    }
    
    func block() {
        splitTheBillView.totalAmountTextField.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
        splitTheBillView.participantTextField.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
    }
    
    func pressCalculate() {
        splitTheBillView.resultButton.addTarget(self, action: #selector(splitTheBillView.startCalculate), for: .touchUpInside)
    }
    
    @objc func blockPressBtn(sender: Any?) {
        if splitTheBillView.totalAmountTextField.text == "" || splitTheBillView.participantTextField.text == "" {
            splitTheBillView.resultButton.backgroundColor = .white
            splitTheBillView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            splitTheBillView.resultButton.layer.borderWidth = 1
            splitTheBillView.resultButton.setTitle("모두 입력하세요", for: .normal)
            splitTheBillView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            splitTheBillView.resultButton.isEnabled = false
        } else if splitTheBillView.totalAmountTextField.text == "0" || splitTheBillView.participantTextField.text == "0" {
            splitTheBillView.resultButton.backgroundColor = .white
            splitTheBillView.resultButton.layer.borderColor = UIColor.darkGray.cgColor
            splitTheBillView.resultButton.layer.borderWidth = 1
            splitTheBillView.resultButton.setTitle("꽁술 개이득!", for: .normal)
            splitTheBillView.resultButton.setTitleColor(UIColor.gray, for: .normal)
            splitTheBillView.resultButton.isEnabled = false
        } else {
            splitTheBillView.resultButton.setTitle("계산 시작", for: .normal)
            splitTheBillView.resultButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            splitTheBillView.resultButton.backgroundColor = .green
            splitTheBillView.resultButton.setTitleColor(UIColor.white, for: .normal)
            splitTheBillView.resultButton.layer.borderColor = UIColor.green.cgColor
            splitTheBillView.resultButton.isEnabled = true
        }
    }
    
    
    // View 관련
    
    func addSubview() {
        view.backgroundColor = .white
        view.addSubview(splitTheBillView.lottieView)
        view.addSubview(splitTheBillView.stbInfo1)
        view.addSubview(splitTheBillView.totalAmount)
        view.addSubview(splitTheBillView.totalAmountTextField)
        view.addSubview(splitTheBillView.participant)
        view.addSubview(splitTheBillView.participantTextField)
        view.addSubview(splitTheBillView.resultButton)
    }
    
    func subviewConstraints() {
        splitTheBillView.lottieView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(250)
            make.bottom.equalToSuperview().offset(-10)
        }
        splitTheBillView.stbInfo1.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(80)
        }
        splitTheBillView.totalAmount.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 1.5)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(40)
            make.top.equalTo(splitTheBillView.stbInfo1.snp.bottom).offset(20)
        }
        splitTheBillView.totalAmountTextField.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.totalAmount)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount).offset(30)
            make.top.equalTo(splitTheBillView.totalAmount.snp.bottom).offset(12)
            
        }
        splitTheBillView.participant.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.totalAmount)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount)
            make.top.equalTo(splitTheBillView.totalAmountTextField.snp.bottom).offset(20)
        }
        splitTheBillView.participantTextField.snp.makeConstraints{ make in
            make.width.equalTo(splitTheBillView.participant)
            make.height.equalTo(splitTheBillView.totalAmount)
            make.leading.equalTo(splitTheBillView.totalAmount).offset(30)
            make.top.equalTo(splitTheBillView.participant.snp.bottom).offset(12)
        }
        splitTheBillView.resultButton.snp.makeConstraints{ make in
            make.height.equalTo(70)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.top.equalTo(splitTheBillView.participantTextField.snp.bottom).offset(30)
        }
    }
    
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = ""
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

/*
extension SplitTheBillViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        // resultLabel.text = trimmedText
        textField.resignFirstResponder()
        return true
    }
}
*/
