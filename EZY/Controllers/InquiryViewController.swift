//
//  InquiryViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/09.
//

import UIKit

class InquiryViewController: UIViewController {
    
    let titleBottomLabelColor = [UIColor(red: 151/255, green: 142/255, blue: 255/255, alpha: 1), UIColor(red: 194/255, green: 189/255, blue: 255/255, alpha: 1)]
    
    let bottomTitleBottomLabelColor = [UIColor(red: 135/255, green: 125/255, blue: 255/255, alpha: 1), UIColor(red: 196/255, green: 191/255, blue: 255/255, alpha: 1)]
    
    var beforeInquiryTitleText: [String] = ["아이디는 어디서 변경할 수 있나요?", "심부름 내용은 변경이 불가능하나요?", "회원 탈퇴는 어떻게 하나요?","회원 탈퇴는 어떻게 하나요?"]
    var beforeInquiryContentText: [String] = ["아이디는 설정 > 아이디 변경 창에서 변경할 수 있습니다.","네. 심부름 내용은 변경이 불가능합니다.","회원탈퇴는 설정 > 회원 탈퇴  창에서  할 수 있습니다.","회원탈퇴는 설정 > 회원 탈퇴  창에서  할 수 있습니다."]
    
    lazy var backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_DetailBackButton"), for: .normal)
    }
    
    lazy var inquiryTitleFontHeightLabel = UILabel().then{
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var inquiryContentFontHeightLabel = UILabel().then{
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var titleTopLabel = UILabel().then {
        $0.text = "문제가 생기셨나요?"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 25, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var titleBottomLabel = UILabel().then {
        $0.text = "최선을 다해 해결해드릴게요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "Poppins-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: titleBottomLabelColor)
    }
    
    lazy var inquiryBackgroundButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var inquiryImageView = UIImageView().then {
        $0.image = UIImage(named: "EZY_EZYHateMoment")
    }
    
    lazy var inquiryLabel = UILabel().then {
        $0.text = "문의하기"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var divideLine = UILabel().then {
        $0.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    }
    
    lazy var bottomTitleTopLabel = UILabel().then {
        $0.text = "문의하기 전에 확인해보세요!"
        $0.textColor = UIColor(red: 110/255, green: 98/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 20, currentFontName: "Poppins-SemiBold")
    }
    
    lazy var bottomTitleBottomLabel = UILabel().then {
        $0.text = "혹시 이게 궁금하셨나요?"
        $0.dynamicFont(fontSize: 18, currentFontName: "Poppins-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: bottomTitleBottomLabelColor)
    }
    
    let questionTableView = UITableView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.separatorEffect = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
        questionTableViewSetting()
    }
    
    func questionTableViewSetting() {
        self.view.addSubview(questionTableView)
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
        
        questionTableView.register(questionTableViewCell.self, forCellReuseIdentifier: questionTableViewCell.reuseId)
        
        questionTableView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/13.8)
            make.top.equalTo(bottomTitleBottomLabel.snp.bottom).offset(self.view.frame.height/50.75)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func inquiryBackgroundButtonClicked(sender:UIButton)
    {
        let nextViewController = InquiryChattingViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func backButtonClicked(sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func layoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(titleTopLabel)
        self.view.addSubview(titleBottomLabel)
        self.view.addSubview(inquiryBackgroundButton)
        self.view.addSubview(divideLine)
        self.view.addSubview(bottomTitleTopLabel)
        self.view.addSubview(bottomTitleBottomLabel)
        inquiryBackgroundButton.addSubview(inquiryImageView)
        inquiryBackgroundButton.addSubview(inquiryLabel)
        
        inquiryBackgroundButton.addTarget(self, action: #selector(inquiryBackgroundButtonClicked(sender:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        titleTopLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/30)
        }
        
        titleBottomLabel.snp.makeConstraints { make in
            make.left.equalTo(titleTopLabel)
            make.top.equalTo(titleTopLabel.snp.bottom)
        }
        
        inquiryBackgroundButton.snp.makeConstraints { make in
            make.top.equalTo(titleBottomLabel.snp.bottom).offset(self.view.frame.height/27)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5.9)
        }
        
        inquiryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/58)
            make.height.equalToSuperview().dividedBy(1.6)
            make.width.equalToSuperview().dividedBy(3.6)
            make.centerX.equalToSuperview()
        }
        
        inquiryLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.height/58)
            make.centerX.equalToSuperview()
        }
        
        divideLine.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(inquiryBackgroundButton.snp.bottom).offset(self.view.frame.height/29)
            make.left.equalToSuperview().offset(self.view.frame.width/11.7)
            make.height.equalTo(0.5)
        }
        
        bottomTitleTopLabel.snp.makeConstraints { make in
            make.left.equalTo(divideLine)
            make.top.equalTo(divideLine).offset(self.view.frame.height/18.8)
        }
        
        bottomTitleBottomLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomTitleTopLabel.snp.bottom)
            make.left.equalTo(bottomTitleTopLabel)
        }
    }
}

extension InquiryViewController: UITableViewDelegate{
    
}

extension InquiryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beforeInquiryTitleText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: questionTableViewCell.reuseId, for: indexPath) as! questionTableViewCell
        cell.backgroundColor = .white
        cell.titleTextView.text = beforeInquiryTitleText[indexPath.row]
        cell.contentTextView.text = beforeInquiryContentText[indexPath.row]
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (beforeInquiryContentText[indexPath.row] as NSString).size(withAttributes: [NSAttributedString.Key.font : inquiryTitleFontHeightLabel.font ?? ""]).height + (beforeInquiryTitleText[indexPath.row] as NSString).size(withAttributes: [NSAttributedString.Key.font : inquiryContentFontHeightLabel.font ?? ""]).height + self.view.frame.height/15
    }
}
