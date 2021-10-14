//
//  morepeopletodo.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/08.
//
    
import UIKit
import SnapKit
import Then

protocol UserDataDelegate : class{
    func updateData(name : String , Color : UIColor)
}
class MorePeopleToDo: UIViewController{
    let bounds = UIScreen.main.bounds
    let data = ["Jihoooooon","siwonnnny","NoName","mingki","johnjihwan","noplayy"]

    let recommendData = ["Jihoooooon","siwonnnny","NoName","mingki","johnjihwan","noplayy"]
        
    let randomColorData : [UIColor] = [.rgb(red: 186, green: 200, blue: 255),.rgb(red: 255, green: 204, blue: 204),.rgb(red: 186, green: 222, blue: 255),.rgb(red: 207, green: 227, blue: 206),.rgb(red: 255, green: 209, blue: 141)]
    var filterData = [SearchData]()
    var filtered = false

    //MARK: - Properties
    weak var delegate : UserDataDelegate?
    
    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_968DFF
        $0.setImage(UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.text = "누구와 일정을 함께하시나요?"
        $0.dynamicFont(fontSize: 24, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_968DFF
    }
    private let SubLabel = UILabel().then{
        $0.text = "한명만 선택해주세요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.white])
    }
    
    private let GroupLabel = UILabel().then{
        $0.text = "닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .rgb(red: 129, green: 129, blue: 129)
    }
    
    private let  nickNameTextFieldContainerView =  GroupSearchTextfield(placeholder: "닉네임을 검색하세요")
    
    private let recommendPeopleLabel = UILabel().then{
        $0.text = "이런 사람들은 어때요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }

    
    private let WhatAboutPeopleLikeThis: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 0
        cv.register(WhatAboutPeopleLikeThisCell.self, forCellWithReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    private let userChoose : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "인원 선택"
        button.color = .rgb(red: 151, green: 142, blue: 255)
        button.addTarget(self, action: #selector(chooseUser), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        WhatAboutPeopleLikeThis.dataSource = self
        WhatAboutPeopleLikeThis.delegate = self
        nickNameTextFieldContainerView.delegate = self
    }
    
    //MARK: - Selectors
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func chooseUser(){
        DataIsRight()
    }
    
    func configureUI(){
        view.backgroundColor = .white
        WhatAboutPeopleLikeThis.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/21.95, bottom: 0, right: view.frame.height/21.95)
        userChoose.layer.cornerRadius = view.frame.height/81.2
        addView()
        location()
    }
    //MARK: - AddView
    func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(SubLabel)
        view.addSubview(GroupLabel)
        view.addSubview(nickNameTextFieldContainerView)
        view.addSubview(recommendPeopleLabel)
        view.addSubview(WhatAboutPeopleLikeThis)
        view.addSubview(userChoose)
    }
    //MARK: - Data 일치 여부
    func DataIsRight(){
        for item in data{
            if item == (nickNameTextFieldContainerView.text ?? ""){
                delegate?.updateData(name: nickNameTextFieldContainerView.text ?? "", Color: .blue)
                navigationController?.popViewController(animated: true)
            }else{
                shakeView(view)
            }
        }
    }
    //MARK: - location
    func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/15.6154)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(backbutton.snp.left)
            make.top.equalTo(backbutton.snp.top).offset(view.frame.height/15.6)
        }
        SubLabel.snp.makeConstraints { (make) in
            make.top.equalTo(TitleLabel.snp.bottom)
            make.left.equalTo(TitleLabel.snp.left)
        }

        GroupLabel.snp.makeConstraints { (make) in
            make.left.equalTo(view.frame.height/20.8)
            make.top.equalTo(SubLabel.snp.bottom).offset(view.frame.height/17.65)
        }
        nickNameTextFieldContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(GroupLabel.snp.bottom).offset(view.frame.height/135.3)
            make.height.equalTo(self.view.frame.height/21.368)
            make.left.equalTo(view.snp.left).offset(self.view.frame.height/23.2)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/23.8 * -1)
        }

        recommendPeopleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nickNameTextFieldContainerView.snp.bottom).offset(view.frame.height/21.9)
            make.left.equalTo(view.frame.height/22.5)
        }
        WhatAboutPeopleLikeThis.snp.makeConstraints { (make) in
            make.top.equalTo(recommendPeopleLabel.snp.bottom).offset(view.frame.height/81.2)
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height/11.277)
            make.right.equalToSuperview()
        }
        userChoose.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).inset(view.frame.height/13.3)
            make.height.equalTo(self.view.frame.height/18.044)
            make.left.equalTo(view.snp.left).offset(view.frame.height/30.07)
            make.right.equalTo(view.snp.right).inset(view.frame.height/29)
        }
    }


    
    //MARK: - 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    //MARK: - Shake Animation
    func shakeView(_ view: UIView?) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! - 5, y: view?.center.y ?? 0.0))
        shake.toValue = NSValue(cgPoint: CGPoint(x: (view?.center.x)! + 5, y: view?.center.y ?? 0.0))
        view?.layer.add(shake, forKey: "position")
    }

}


extension MorePeopleToDo : UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text!)
    }
}
//MARK: - CollectionView
extension MorePeopleToDo : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return recommendData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier, for: indexPath) as? WhatAboutPeopleLikeThisCell else {return UICollectionViewCell()}
        cell.bglabel.text = "@ " + recommendData[indexPath.row]
        cell.bglabel.dynamicFont(fontSize: 12, currentFontName:"AppleSDGothicNeo-UltraLight")
        cell.bglabel.textColor = MorePeopleToDo().randomColorData.randomElement()
        cell.layer.borderWidth = 1
        cell.layer.borderColor = cell.bglabel.textColor.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: bounds.width/3, height: WhatAboutPeopleLikeThis.frame.height/2 - 5)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return bounds.width/41.67
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nickNameTextFieldContainerView.text = recommendData[indexPath.row]
    }
}
