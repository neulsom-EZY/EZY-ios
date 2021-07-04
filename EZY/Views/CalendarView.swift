//
//  CalendarView.swift
//  EZY
//
//  Created by 김유진 on 2021/07/02.
//

import UIKit

@objc public protocol HSCycleGalleryViewDelegate: class {
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: CalendarView) -> Int
    
    func cycleGalleryView(_ cycleGalleryView: CalendarView, cellForItemAtIndex index: Int) -> UICollectionViewCell
    
    @objc optional func cycleGalleryView(_ cycleGalleryView: CalendarView, didSelectItemCell cell: UICollectionViewCell, at Index: Int)
}

public class CalendarView: UIView {
    
    public weak var delegate: HSCycleGalleryViewDelegate?
    
    public var autoScrollInterval: Double = 3
    
    public var contentBackgroundColor = UIColor.yellow {
        didSet {
            collectionView.backgroundColor = contentBackgroundColor
        }
    }
    
    private var collectionView: UICollectionView!
    private let groupCount = 200
    private var indexArr = [Int]()
    private var dataNum: Int = 0
    private var timer: Timer?
    private var currentIndexPath: IndexPath!
    
    
    // MARK: - Initialization
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: CalendarViewLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = contentBackgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        self.addSubview(collectionView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            removeTimer()
            addTimer()
        } else {
            removeTimer()
        }
    }
}


// MARK: - Public Function

extension CalendarView {
    
    public func reloadData() {
        guard let dataNum = delegate?.numberOfItemInCycleGalleryView(self) else { return }
        self.dataNum = dataNum
        indexArr.removeAll()
        for _ in 0 ..< groupCount {
            for j in 0 ..< dataNum {
                indexArr.append(j)
            }
        }
        collectionView.reloadData()
        // Scroll to the middle
        currentIndexPath = IndexPath(item: groupCount / 2 * dataNum, section: 0)
        collectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: false)
    }
    
    public func register(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        self.collectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(nib: UINib?, forCellReuseIdentifier identifier: String) {
        self.collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    public func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell
    }
}


// MARK: - Private Function

extension CalendarView {
    
    func removeTimer() {
        self.timer?.invalidate()
        timer = nil
    }
    
    func addTimer() {
        guard autoScrollInterval > 0 else { return }
        guard timer == nil else { return }
        timer = Timer(timeInterval: autoScrollInterval, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    @objc func autoScroll() {
        if self.superview == nil || self.window == nil {
            return
        }
        self.scrollToNextIndex()
    }
    
    private func scrollToNextIndex() {
        var currentIndex = currentIndexPath.row
        if (currentIndex + 1) >= indexArr.count {
            currentIndex = groupCount / 2 * self.dataNum
            collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
        let nextIndex = currentIndex + 1
        collectionView.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .centeredHorizontally, animated: true)
        currentIndexPath = IndexPath(item: nextIndex, section: 0)
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexArr.count > 0 else { return UICollectionViewCell() }
        let index = indexArr[indexPath.row]
        let dataIndex = index % dataNum
        
        return self.delegate?.cycleGalleryView(self, cellForItemAtIndex: dataIndex) ?? UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexArr[indexPath.row]
        let dataIndex = index % dataNum
        let cell = collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell()
        
        delegate?.cycleGalleryView?(self, didSelectItemCell: cell, at: dataIndex)
    }
    
    // 스크롤이 멈췄을때 시작 cell로 이동하기
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let pointInView = self.convert(collectionView.center, to: collectionView)
//        let indexPathNow = collectionView.indexPathForItem(at: pointInView)
//        let index = (indexPathNow?.row ?? 0) % dataNum
        // Reset to the middle position
//        currentIndexPath = IndexPath(item: groupCount / 2 * dataNum + index, section: 0)
//        collectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: false)
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
}

