//
//  ErrandListViewModel.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/29.
//

import Foundation

struct ErrandListTypeViewModel{
    let errandGotList : [ ErrandEntireDocument]
    let errandAskedList : [ ErrandEntireDocument]
    let errandWaitingForAcceptance : [ErrandEntireDocument]
}
extension ErrandListTypeViewModel{
    var numberOfSection : Int{
        return 3
    }
    func numberOfRowsInSection(_ section : Int) -> Int{
        if section == 0{
            return self.errandGotList.count
        }else if section == 1{
            return self.errandAskedList.count
        }else{
            return self.errandWaitingForAcceptance.count
        }
    }
    func errandListIndex(_ section : Int,_ index : Int) -> ErrandListViewModel{
        if section == 0{
            let errandList = self.errandGotList[index]
            return ErrandListViewModel(errandList)
        }else if section == 1{
            let errandList = self.errandAskedList[index]
            return ErrandListViewModel(errandList)
        }else{
            let errandList = self.errandWaitingForAcceptance[index]
            return ErrandListViewModel(errandList)
        }
    }
}
struct ErrandListViewModel{
    private let errandList : ErrandEntireDocument 
}
extension ErrandListViewModel{
    init(_ errandList : ErrandEntireDocument){
        self.errandList = errandList
    }
}
extension ErrandListViewModel{
    var errandListIdx : Int?{
        return self.errandList.planIdx
    }
    var errandListSubject : String?{
        return self.errandList.subject
    }
    var errandListTitle : String?{
        return self.errandList.title
    }
    var errandListStartDate : String?{
        return self.errandList.period.startDateTime
    }
    var errandListEndDate : String?{
        return self.errandList.period.endDateTime
    }
    var errandListSender : String?{
        return self.errandList.sender
    }
    var errandListRecipient : String?{
        return self.errandList.recipient
    }
    var errandListStatus : String?{
        return self.errandList.errandStatus
    }
}
