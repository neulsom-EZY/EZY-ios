//
//  CalendarViewLayout.swift
//  EZY
//
//  Created by 김유진 on 2021/07/02.
//

import UIKit

class CalendarViewLayout: UICollectionViewFlowLayout {
    var itemWidth: CGFloat = 50
    var itemHeight: CGFloat = 80
    
    // prepare ? -> 레이아웃관련 연산이 일어날 때마다 호출된다. 이 메소드에서 셀의 위치/크기 등을 계산하기 위한 사전처리를 할 수 있다.
    override func prepare() {
        super.prepare()
        
        // cell의 크기
        self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        // scroll방향 왼오
        self.scrollDirection = .horizontal
        
        // minimumInteritemSpacing 행에서 아이템 간의 최소 간격을 설정해준 것
        self.minimumInteritemSpacing = 0
        
        // minimumLineSpaceing 열에서 아이템 간의 최소 간격을 설정해준 것
        self.minimumLineSpacing = 0
        
        // collectionview안에 padding
        let left = (self.collectionView!.bounds.width - itemWidth) / 2
        let top = (self.collectionView!.bounds.height - itemHeight) / 2
        self.sectionInset = UIEdgeInsets.init(top: top, left: left, bottom: top, right: left)
        
    }
    
    // shouldInvalidateLayout ? ->  Bounds에 변화가 있을 때마다, 함수를 호출할 지 결정
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // layoutAttributesForElements ? ->  CollectionView 안의 모든 요소에 대한 Layout 요소들을 리턴합니다. (현재 화면에 보이는 요소)
    // 가운데에 위치할수록 크기 키워주는 부분..?
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        let visiableRect = CGRect(x: self.collectionView!.contentOffset.x,
                                  y: self.collectionView!.contentOffset.y,
                                  width: self.collectionView!.frame.width,
                                  height: self.collectionView!.frame.height)

        let centerX = self.collectionView!.contentOffset.x + self.collectionView!.bounds.width / 2

        for attributes in array! {
            if !visiableRect.intersects(attributes.frame) { continue }

            let offsetCenterX = abs(attributes.center.x - centerX)
            let scale = max(1 - offsetCenterX / self.collectionView!.bounds.width * 0.9, 0.8)

            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }

        return array
    }
    
    
    // scroll했을때 셀 한개가 정확히 가운데에 위치하도록 하게해주는거..?
    override func targetContentOffset(forProposedContentOffset
        proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let lastRect = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y,
                              width: self.collectionView!.bounds.width,
                              height: self.collectionView!.bounds.height)
        let centerX = proposedContentOffset.x + self.collectionView!.bounds.width * 0.5;
        let array = self.layoutAttributesForElements(in: lastRect)

        var adjustOffsetX = CGFloat(MAXFLOAT);
        for attri in array! {
            let deviation = attri.center.x - centerX
            if abs(deviation) < abs(adjustOffsetX) {
                adjustOffsetX = deviation
            }
        }
        return CGPoint(x: proposedContentOffset.x + adjustOffsetX, y: proposedContentOffset.y)
    }
}
