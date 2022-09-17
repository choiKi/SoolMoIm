//
//  ViewController.swift
//  SoolMoIm
//
//  Created by 최기훈 on 2022/09/17.
//

import UIKit
import Lottie
import SnapKit
import Then

class MainViewController: UIViewController {

    private let animationView = AnimationView(name: "50854-cash-or-card")
    @IBOutlet weak private var lottieView: UIView!

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
        $0.addTarget(self, action: #selector(goSplitTheBill), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    let withoutAlcoholBtn = UIButton().then{
        $0.setTitle("분위기 값 계산", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(goWithoutAlcoholBtn), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    let hitAndMissBtn = UIButton().then{
        $0.setTitle("술값은 도박", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(goHitAndMissBtn), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubView()
        subviewConstraints()
        mainAnimation()
        navigationTitleHidden()
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           self.animationView.play()
    }
    
    @objc func goSplitTheBill(sender: UIButton!) {
        guard let splitTheBillView = storyboard?.instantiateViewController(withIdentifier: "SplitTheBillViewController") else {return}
        self.navigationController?.pushViewController(splitTheBillView, animated: true)
    }
    @objc func goWithoutAlcoholBtn(sender: UIButton!) {
        print("(:")
    }
    @objc func goHitAndMissBtn(sender: UIButton!) {
        print(":(")
    }

    // SubView 관리
    func addSubView() {
        view.backgroundColor = .white
        view.addSubview(appTitle)
        view.addSubview(appInfo1)
        view.addSubview(appInfo2)
        view.addSubview(splitTheBillBtn)
        view.addSubview(withoutAlcoholBtn)
        view.addSubview(hitAndMissBtn)
    }
    
    func subviewConstraints() {
        appInfo1.snp.makeConstraints{ make in
            make.height.equalTo(15)
            make.top.equalToSuperview().offset(85)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        appInfo2.snp.makeConstraints{ make in
            make.height.equalTo(15)
            make.top.equalToSuperview().offset(110)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        appTitle.snp.makeConstraints{ make in
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
        splitTheBillBtn.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 3)
            make.top.equalTo(lottieView).offset(225)
            make.leading.equalToSuperview().offset(view.bounds.width / 8)
        }
        withoutAlcoholBtn.snp.makeConstraints{ make in
            make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 3)
            make.top.equalTo(lottieView).offset(225)
            make.trailing.equalToSuperview().offset(-(view.bounds.width / 8))
        }
        hitAndMissBtn.snp.makeConstraints{ make in
            // make.width.equalTo(view.bounds.width / 3)
            make.height.equalTo(view.bounds.width / 4)
            make.top.equalTo(splitTheBillBtn.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(view.bounds.width / 8)
            make.trailing.equalToSuperview().offset(-(view.bounds.width / 8))
        }
    }
    
    // 네비게이션 타이틀 히든
    func navigationTitleHidden() {
        self.navigationController?.navigationBar.topItem!.title = "술모임"
    }
    
    // 로티 애니메이션
    func mainAnimation() {
        self.lottieView.addSubview(self.animationView)
        lottieView.backgroundColor = .white
        self.animationView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        self.animationView.loopMode = .loop
    }

    

}

