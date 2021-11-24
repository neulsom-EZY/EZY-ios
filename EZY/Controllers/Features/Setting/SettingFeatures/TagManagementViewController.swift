//
//  TagManagementViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/07/22.
//

import UIKit
import Combine

protocol SendTagNameSelectedCellIndexDelegate: AnyObject {
    func didTabTagSettingButton(with tagName: String, index: Int)
}

class TagManagementViewController: UIViewController {
    // MARK: - Properties
    static weak var delegate: SendTagNameSelectedCellIndexDelegate?
    
    private var bag = Set<AnyCancellable>()
        
    private var tagNameTextArray = [String]()
    
    private var tagColor = [UIColor]()
                
    private var selectedTagIndex: Int = 0
    
    private var selectedTagColorIndexArray = [Int]()
    
    private var tagColorPreciousSelectedIndex = 0
        
    private let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    
    private let noTagImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_NoTagImage")
    }
    
    private let tagGoodLabel = UILabel().then{
        $0.text = "태그를 사용하시면 더 쉽게 일정을 정리할 수 있어요!"
        $0.textColor = UIColor(red: 82/255, green: 82/255, blue: 82/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    private let tagAddLabel = UILabel().then{
        $0.text = "추가 버튼을 눌러 태그를 추가해보세요!"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 13, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_TagManagementBackButtonImage"), for: .normal)
        $0.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let mainTitleLabel = UILabel().then {
        $0.text = "태그 관리"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 22, currentFontName: "Poppins-SemiBold")
    }
    
    private let tagAddButton = UIButton().then{
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
        $0.addTarget(self, action: #selector(tagAddButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let tagTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.register(TagTableViewCell.self, forCellReuseIdentifier: TagTableViewCell.reuseId)
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // check
        if tagNameTextArray.count == 0{
            tagTableView.isHidden = true
        }
    }
    
    // MARK: - configureUI
    private func configureUI(){
        addView()
        location()
        dataSourceAndDelegate()
    }
    
    
    // MARK: - dataSourceAndDelegate
    private func dataSourceAndDelegate(){
        tagTableView.delegate = self
        tagTableView.dataSource = self
    }
    
    // MARK: - addView
    private func addView(){
        self.view.backgroundColor = .white
        [backButton, mainTitleLabel, tagAddButton, noTagImageView, tagGoodLabel, tagAddLabel, tagTableView].forEach { view.addSubview($0) }
    }
    
    // MARK: - location
    private func location(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(self.view.frame.height/47.7)
            make.left.equalToSuperview().offset(self.view.frame.width/12)
            make.width.equalToSuperview().dividedBy(33.8/2)
            make.height.equalTo(backButton.snp.width)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton)
            make.top.equalTo(backButton.snp.bottom).offset(self.view.frame.height/50)
        }
        
        tagAddButton.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.right.equalToSuperview().offset(-self.view.frame.width/12)
            make.height.width.equalTo(backButton)
        }
        
        noTagImageView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/8.45)
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalTo(noTagImageView.snp.height)
            make.centerX.equalToSuperview()
        }
    
        tagGoodLabel.snp.makeConstraints { make in
            make.centerX.equalTo(noTagImageView)
            make.top.equalTo(noTagImageView.snp.bottom).offset(self.view.frame.height/30)
        }
        
        tagAddLabel.snp.makeConstraints { make in
            make.centerX.equalTo(tagGoodLabel)
            make.top.equalTo(tagGoodLabel.snp.bottom).offset(self.view.frame.height/135.3)
        }
        
        tagTableView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(self.view.frame.height/26.1)
            make.height.equalToSuperview().dividedBy(2)
            make.left.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - selectors
    @objc private func tagAddButtonClicked(sender:UIButton){
        let TagAddModalVC = TagAddModalViewController.instance()
        TagAddModalVC.delegate = self
        TagAddModalVC.baseDelegate = self
        addDim()
        present(TagAddModalVC, animated: true, completion: nil)
    }
    
    @objc private func backButtonClicked(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - addDim
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.bgView.alpha = 0.2
        }
    }

    // MARK: - removeDim
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
        }
    }
    
    // MARK: - tagReloadSetting
    private func tagReloadSetting(_ tagName: String, _ tagColorIndex: Int){
        self.view.endEditing(true)
        selectedTagColorIndexArray.append(tagColorIndex)
        tagNameTextArray.append(tagName)
        tagColor.append(UIColor.EZY_TagColorArray[tagColorIndex]) // color는 왜 담음?
        tagTableView.reloadData()
        
        tagTableView.isHidden = false
        noTagImageView.isHidden = true
        
        print("selectedTagColorIndexArray : \(selectedTagColorIndexArray)")
        print("tagNameTextArray : \(tagNameTextArray)")
    }
}

// MARK: - TableView Extension
extension TagManagementViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagNameTextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.reuseId, for: indexPath) as!TagTableViewCell
        cell.tagSettingButton.isUserInteractionEnabled = false
        cell.tagNameLabel.text = tagNameTextArray[indexPath.row]
        cell.tagNameLabel.textColor = tagColor[indexPath.row]
        cell.tagLabelBackgroundView.layer.borderColor = tagColor[indexPath.row].cgColor
        
        cell.delegate = self
        cell.configure(with: "\(indexPath.row)")
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TagSettingViewController()
                
        // TagSettingViewController에서 tag delete action을 받았을 때
        vc.passDeleteEventButton.sink { [weak self] button in
            self!.selectedTagColorIndexArray.remove(at: indexPath.row)
            self!.tagNameTextArray.remove(at: indexPath.row)
            self!.tagColor.remove(at: indexPath.row)
            
            self!.tagTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
        }.store(in: &bag)
        print("MAnage : selectedTagColorIndexArray : \(selectedTagColorIndexArray)")
        vc.dataSetting(selectedTagColorIndex: selectedTagColorIndexArray[indexPath.row], tagName: "\(tagNameTextArray[indexPath.row])", tagColorPreciousSelectedIndex: self.tagColorPreciousSelectedIndex)
        
        vc.delegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SendChangedTagSetting
extension TagManagementViewController: SendChangedTagSetting{
    func didTagCompleteButton(changedTagName: String, changedColorIndex: Int, tagColorPreciousSelectedIndex: Int) {
        tagNameTextArray[selectedTagIndex] = changedTagName
        selectedTagColorIndexArray[selectedTagIndex] = changedColorIndex
        tagColor[selectedTagIndex] = UIColor.EZY_TagColorArray[changedColorIndex]
        tagTableView.reloadData()
    }
}

// MARK: - TagTableViewCellDelegate Extension
extension TagManagementViewController: TagTableViewCellDelegate{
    func didTabAddButton(with string: String) {
        selectedTagIndex = Int(string)!
    }
}

//MARK: - TagModal Delegate
extension TagManagementViewController: TagAddDelegate{
    func updateData(tagName: String, tagColorIndex: Int) {
        self.tagReloadSetting(tagName, tagColorIndex)
    }
}

//MARK: - BaseModal Delegate
extension TagManagementViewController : BaseModalDelegate{
    func onTapClose() {
        self.removeDim()
    }
}
