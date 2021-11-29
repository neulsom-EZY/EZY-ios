//
//  ViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/06.
//

import Foundation

protocol SwitchStateDelegate: AnyObject {
    func isOnValueChange(isOn: Bool)
}
