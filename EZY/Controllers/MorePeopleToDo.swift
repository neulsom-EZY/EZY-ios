//
//  morepeopletodo.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/06/08.
//
    
import UIKit
import SnapKit
import Then
    
class MorePeopleToDo: UIViewController{
    static let recommendData = ["JiHoooooon","siwonnnny","NoName","mingki","johnjihwan","noplayy","gyeongggggjuunnn"]
    static let searchData = ["JiHoon","Siwony","gyeongjun","noplayy","cat","dog"]
    
    //MARK: - Properties
    var tblDropDownHC = NSLayoutConstraint()

    private let backbutton = UIButton().then{
        $0.tintColor = .EZY_968DFF
        $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    private let TitleLabel = UILabel().then{
        $0.text = "누구와 일정을 함께하시나요?"
        $0.dynamicFont(fontSize: 24, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = .EZY_968DFF
    }
    private let SubLabel = UILabel().then{
        $0.text = "한명도 좋고 여러명도 좋아요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.EZY_968DFF,.white])
    }
    

    private let GroupLabel = UILabel().then{
        $0.text = "닉네임"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = .EZY_818181
    }
    
    private lazy var nickNameTextFieldContainerView: GroupSearchTextfield = {
        let tf = GroupSearchTextfield(placeholder: "닉네임을 검색하세요")
        return tf
    }()
    
    private let searcherView  = SearchTableView().then{
        $0.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 6, blur: 15, spread: 0)
    }
    
    private let recommendPeopleLabel = UILabel().then{
        $0.text = "이런 사람들은 어때요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    fileprivate let WhatAboutPeopleLikeThis: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 0
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(WhatAboutPeopleLikeThisCell.self, forCellWithReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear

        return cv
    }()
    

    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        WhatAboutPeopleLikeThis.dataSource = self
        WhatAboutPeopleLikeThis.delegate = self
        WhatAboutPeopleLikeThis.allowsMultipleSelection = true
        tblDropDownHC.constant = 0
    }
    
    //MARK: - Selectors
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }
    @objc func textDidChage(_ sender: UITextField){
        if sender == nickNameTextFieldContainerView{
            UIView.animate(withDuration: 0.25) {
                
            }
        }
    }
    
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        WhatAboutPeopleLikeThis.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/21.95, bottom: 0, right: view.frame.height/21.95)
        searcherView.layer.cornerRadius = view.frame.height/81.2
        addView()
        location()
    }
    
    func addView(){
        view.addSubview(backbutton)
        view.addSubview(TitleLabel)
        view.addSubview(SubLabel)
        view.addSubview(GroupLabel)
        view.addSubview(nickNameTextFieldContainerView)
        view.addSubview(recommendPeopleLabel)
        view.addSubview(WhatAboutPeopleLikeThis)
        view.addSubview(searcherView)
    }
    
    
    func location(){
        backbutton.snp.makeConstraints { (make) in
            make.height.width.equalTo(self.view.frame.height/33.8)
            make.left.equalTo(self.view.frame.height/29)
            make.top.equalTo(self.view.frame.height/13.3)
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
            make.top.equalTo(SubLabel.snp.bottom).offset(view.frame.height/17.6)
        }
        nickNameTextFieldContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(GroupLabel.snp.bottom).offset(view.frame.height/135.3)
            make.height.equalTo(self.view.frame.height/21.3)
            make.left.equalTo(view.snp.left).offset(self.view.frame.height/23.2)
            make.right.equalTo(view.snp.right).offset(self.view.frame.height/23.8 * -1)
        }
        searcherView.snp.makeConstraints { (make) in
            make.top.equalTo(nickNameTextFieldContainerView.snp.bottom).offset(view.frame.height/135.333)
            make.left.equalTo(nickNameTextFieldContainerView.snp.left)
            make.right.equalTo(nickNameTextFieldContainerView.snp.right)
            make.height.equalTo(view.frame.height/5.1392)
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

    }
    func configureNotificationObservers(){
        nickNameTextFieldContainerView.addTarget(self, action: #selector(textDidChage), for: .editingChanged)
    }

    
}

extension MorePeopleToDo : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MorePeopleToDo.recommendData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier, for: indexPath) as? WhatAboutPeopleLikeThisCell else {return UICollectionViewCell()}
        cell.bglabel.text = "@ " + MorePeopleToDo.recommendData[indexPath.row]
        cell.bglabel.dynamicFont(fontSize: 12, currentFontName:"AppleSDGothicNeo-Thin")
        cell.bglabel.textColor = .EZY_3D64FF
        cell.layer.borderWidth = 1
        cell.bglabel.sizeToFit()
        cell.layer.borderColor = UIColor.EZY_6383FF.cgColor
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return WhatAboutPeopleLikeThisCell.fittingSize(availableHeight: view.frame.size.height/25.375, name: MorePeopleToDo.recommendData[indexPath.row])
    }

}

extension MorePeopleToDo: FormViewModel{
    func updateForm() {
        
    }
}


