//
//  ErrandListViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/29.
//

import Foundation

struct ErrandListViewModel{
    let errandGotList : [ ErrandEntireDocument]
    let errandAskedList : [ ErrandEntireDocument]
}
extension ErrandListViewModel{
    var numberOfSection : Int{
        return 2
    }
    func numberOfRowsInSection(_ section : Int) -> Int{
        if section == 0{
            return self.errandGotList.count
        }else if section == 1{
            return self.errandAskedList.count
        }else{
            return 0
        }
    }
}
