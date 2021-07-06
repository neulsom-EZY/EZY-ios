//
//  ViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/06.
//

import Foundation

protocol HeaderViewProtocol {
    associatedtype Content
    func setHeader(data: Content)
}
