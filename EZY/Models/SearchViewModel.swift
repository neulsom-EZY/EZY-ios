//
//  SearchViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/30.
//
import UIKit

protocol FormViewModel {
    func updateForm()
}
protocol SearchViewModel {
    var formIsValid: Bool{get}
    var showView: Bool{get}
}
struct MoreTodoModel : SearchViewModel {
    var nickName : String?
    var formIsValid: Bool{
        return nickName?.isEmpty == false
    }
    var showView: Bool{
        return formIsValid
    }
}
