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
    let randomColorData : [UIColor] = [.EZY_BAC8FF,.EZY_FFCCCC,.EZY_BADEFF,.EZY_CFE3CE,.EZY_FFD18D]
    let identifier = "MorePeopleToDo"
    var data = [SearchData]()
    var filterData = [SearchData]()
    var filtered = false
    
    var clickData : String = ""
    
    //MARK: - Properties
    var isTableVisible = false
    var viewModel = MoreTodoModel()
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
        $0.text = "한명만 선택해주세요!"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.updateGradientTextColor_vertical(gradientColors: [.EZY_968DFF,.EZY_968DFF,.white])
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
    
    private lazy var searcherView  = SearchTableView().then{
        $0.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 6, blur: 15, spread: 0)
        $0.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)

    }
    
    private let recommendPeopleLabel = UILabel().then{
        $0.text = "이런 사람들은 어때요"
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Thin")
    }
    fileprivate lazy var ErrandPersonCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ErrandPeopoleChooseAfterCell.self, forCellWithReuseIdentifier: ErrandPeopoleChooseAfterCell.identifier)
        cv.backgroundColor = .clear
        cv.alpha = 0
        return cv
    }()
    
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
    
    private let userChoose : AdditionalButton = {
        let button = AdditionalButton(type: .system)
        button.title = "인원 선택"
        button.color = .EZY_978EFF
        button.addTarget(self, action: #selector(chooseUser), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        WhatAboutPeopleLikeThis.dataSource = self
        searcherView.tv.delegate = self
        searcherView.tv.dataSource = self
        WhatAboutPeopleLikeThis.delegate = self
        nickNameTextFieldContainerView.delegate = self
        WhatAboutPeopleLikeThis.allowsMultipleSelection = true
        ErrandPersonCollectionView.delegate = self
        ErrandPersonCollectionView.dataSource = self
        configureNotificationObservers()
        Data()
    }
    //MARK: - 키보드 받기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    //MARK: - Selectors
    @objc func backButton(){
        navigationController?.popViewController(animated: true)
    }
    @objc func textDidChage(_ sender: UITextField){
        if sender == nickNameTextFieldContainerView{
            viewModel.nickName = sender.text
        }
        updateForm()
    }
    
    @objc func chooseUser(){
        navigationController?.popViewController(animated: true)

    }
    @objc func deleteCollectionViewBehavior(){
        UIView.animate(withDuration: 0.4) {
            self.ErrandPersonCollectionView.alpha = 0
        }
        UIView.animate(withDuration: 0.4) {
            self.WhatAboutPeopleLikeThis.alpha = 1
        }
        recommendPeopleLabel.text = "이런 분들은 어때요?"
        clickData = ""
    }

    
    //MARK: - Helpers
    func Data() {
        data = [
            SearchData(koreanName: "정시원", name: "Siwony"),
            SearchData(koreanName: "전지환", name: "gyeongjun"),
            SearchData(koreanName: "김유진", name: "youjin"),
            SearchData(koreanName: "김기홍", name: "KiHong"),
            SearchData(koreanName: "안지훈", name: "Jihoon"),
            SearchData(koreanName: "김기홍", name: "KimKiHooooong"),
            SearchData(koreanName: "안지훈", name: "JiHoooooon"),
            SearchData(koreanName: "안지훈", name: "JiHun")
            
        ]
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        WhatAboutPeopleLikeThis.contentInset = UIEdgeInsets(top: 0, left: view.frame.height/21.95, bottom: 0, right: view.frame.height/21.95)
        ErrandPersonCollectionView.contentInset =  UIEdgeInsets(top: 0, left: view.frame.height/21.95, bottom: 0, right: view.frame.height/21.95)

        searcherView.layer.cornerRadius = view.frame.height/81.2
        userChoose.layer.cornerRadius = view.frame.height/81.2
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
        view.addSubview(ErrandPersonCollectionView)
        view.addSubview(searcherView)
        view.addSubview(userChoose)
        
    }
    

    
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
        ErrandPersonCollectionView.snp.makeConstraints { (make) in
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
    func configureNotificationObservers(){
        nickNameTextFieldContainerView.addTarget(self, action: #selector(textDidChage), for: .editingChanged)
    }
    
    
    //MARK: - Search filter
    func filterContentForSearchText(_ searchText: String) {
        filterData = data.filter({( data : SearchData) -> Bool in
            return data.koreanName.lowercased().contains(searchText.lowercased()) || data.name.lowercased().contains(searchText.lowercased())
      })
        searcherView.tv.reloadData()
    }

}

extension MorePeopleToDo : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == WhatAboutPeopleLikeThis{
            return MorePeopleToDo.recommendData.count
        }
        else if collectionView === ErrandPersonCollectionView{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == WhatAboutPeopleLikeThis{
            guard let whatAboutPeoplecell = collectionView.dequeueReusableCell(withReuseIdentifier: WhatAboutPeopleLikeThisCell.identifier, for: indexPath) as? WhatAboutPeopleLikeThisCell else {return UICollectionViewCell()}
            whatAboutPeoplecell.bglabel.text = "@ " + MorePeopleToDo.recommendData[indexPath.row]
            whatAboutPeoplecell.bglabel.dynamicFont(fontSize: 12, currentFontName:"AppleSDGothicNeo-UltraLight")
            whatAboutPeoplecell.bglabel.textColor = MorePeopleToDo().randomColorData.randomElement()
            whatAboutPeoplecell.layer.borderWidth = 1
            whatAboutPeoplecell.bglabel.sizeToFit()
            whatAboutPeoplecell.layer.borderColor = whatAboutPeoplecell.bglabel.textColor.cgColor
            return whatAboutPeoplecell
        }else {
            guard let errandPersonChooseCell  = collectionView.dequeueReusableCell(withReuseIdentifier: ErrandPeopoleChooseAfterCell.identifier, for: indexPath) as? ErrandPeopoleChooseAfterCell else {return UICollectionViewCell()}
            errandPersonChooseCell.bglabel.text = clickData
            errandPersonChooseCell.layer.borderWidth = 1
            errandPersonChooseCell.backgroundColor = .clear
            errandPersonChooseCell.bglabel.sizeToFit()
            errandPersonChooseCell.bglabel.textColor = .black
            errandPersonChooseCell.button.addTarget(self, action: #selector(deleteCollectionViewBehavior), for: .touchUpInside)
            errandPersonChooseCell.bglabel.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-SemiBold")
            errandPersonChooseCell.layer.borderColor = UIColor.EZY_E0E0E0.cgColor
            return errandPersonChooseCell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == WhatAboutPeopleLikeThis{
            return WhatAboutPeopleLikeThisCell.fittingSize(availableHeight: view.frame.size.height/25.375, name: MorePeopleToDo.recommendData[indexPath.row])
        }else if collectionView == ErrandPersonCollectionView{
            let label = UILabel()
            label.text = clickData
            label.sizeToFit()
            return CGSize(width:label.frame.width + view.frame.height/50.75 , height: view.frame.size.height/27.06667)
        }
        return CGSize(width: 0, height: 0)
    }

}



extension MorePeopleToDo: FormViewModel{
    func updateForm() {
        
        isTableVisible = viewModel.showView
        if isTableVisible == false{
            searcherView.noUser.isHidden = true
            UIView.animate(withDuration: 0.2) {
                self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)
                self.view.layoutIfNeeded()
            }
        }else{
            UIView.animate(withDuration: 0.2) {
                self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: self.view.frame.height/5.1392)
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension MorePeopleToDo : UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text{
            filterContentForSearchText(nickNameTextFieldContainerView.text!)
        }
        if filterData.count == 0 {
            searcherView.noUser.isHidden = false
        }else{
            searcherView.noUser.isHidden = true
        }
    }
}

extension MorePeopleToDo : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    //SearcherView 안에 Cell 을 넣었을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickData = filterData[indexPath.row].name

        UIView.animate(withDuration: 0.4) {
            self.ErrandPersonCollectionView.alpha = 1
        }
        UIView.animate(withDuration: 0.4) {
            self.WhatAboutPeopleLikeThis.alpha = 0
        }
        recommendPeopleLabel.text = "심부름을 부탁할 분이군요!"
        UIView.animate(withDuration: 0.2) {
            self.searcherView.frame = CGRect(x: self.view.frame.height/23.2, y: self.view.frame.height/3.0526, width: self.view.frame.width/1.2255, height: 0)
            self.view.layoutIfNeeded()
        }
        ErrandPersonCollectionView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier) as! SearchTableCell
        let personData : SearchData
        personData = filterData[indexPath.row]
        cell.personName.text = personData.koreanName + " (" + personData.name  + ")"
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/20.3
    }
    
}

