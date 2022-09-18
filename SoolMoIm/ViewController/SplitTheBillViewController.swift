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
        $0.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
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
        $0.addTarget(self, action: #selector(blockPressBtn(sender:)), for: .editingChanged)
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
        blockPressBtn(sender: participantTextField)

    }
    
    // optional 처리, Int 아닐때
    @objc func startCalculate(sender: UIButton!) {
        // 이미지 나오고 2초 후
        calculateAnimation()
        // 옳은 결과면 결과보여주고, 옳은 결과가 아니라면 에러페이지
        calculate()
        print("1")
    }
    
    @objc func blockPressBtn(sender: Any?) {
        if totalAmountTextField.text == "" || participantTextField.text == "" {
            resultButton.backgroundColor = view.backgroundColor
            resultButton.layer.borderColor = UIColor.darkGray.cgColor
            resultButton.layer.borderWidth = 1
            resultButton.setTitle("모두 입력하세요", for: .normal)
            resultButton.setTitleColor(UIColor.gray, for: .normal)
            resultButton.isEnabled = false
        } else if totalAmountTextField.text == "0" || participantTextField.text == "0" {
            resultButton.backgroundColor = view.backgroundColor
            resultButton.layer.borderColor = UIColor.darkGray.cgColor
            resultButton.layer.borderWidth = 1
            resultButton.setTitle("꽁술 개이득!", for: .normal)
            resultButton.setTitleColor(UIColor.gray, for: .normal)
            resultButton.isEnabled = false
        } else {
            resultButton.setTitle("계산 시작", for: .normal)
            resultButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            resultButton.backgroundColor = .green
            resultButton.setTitleColor(UIColor.white, for: .normal)
            resultButton.layer.borderColor = UIColor.green.cgColor
            resultButton.isEnabled = true
        }
    }
    
    func calculate() {
        checkCompatibility(ta: Int(totalAmountTextField.text!)!, ptc: Int(participantTextField.text!)!)
        print("2")
    }
    
    func checkCompatibility(ta: Int!, ptc: Int!) {
        let ta = Int(totalAmountTextField.text!)!
        let ptc = Int(participantTextField.text!)!
        let result = ta / ptc
        guard ta >= ptc else {
            // 경고1
            customAlert.showAlert(with: "계산 불가",
                                message: "총액과 총원을 정확히 입력하세요",
                                on: self)
            return
        }
        guard result > 1000 else {
            // 경고 2
            return
        }
    }
    
    // View 관련
    
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
            make.leading.equalTo(totalAmount).offset(30)
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
            make.leading.equalTo(totalAmount).offset(30)
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
