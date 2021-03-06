//
//  DefaultCollectionViewController.swift
//  PullToRefreshKit
//
//  Created by luoyang on 2016/12/8.
//  Copyright © 2016年 luoyang. All rights reserved.
//

import Foundation
import UIKit

class DefaultCollectionViewController: UIViewController,UICollectionViewDataSource{
    var collectionView:UICollectionView?
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.setUpCollectionView()
        
        self.collectionView?.gtm_addRefreshHeaderView(delegate: self)
//        self.collectionView?.gtm_addRefreshHeaderView {
//            [unowned self] in
//            print("excute refreshBlock")
//            self.refresh()
//        }
//        
//        self.collectionView?.gtm_addLoadMoreFooterView {
//            [unowned self] in
//            print("excute loadMoreBlock")
//            self.loadMore()
//        }
    }
    
    
    
    func setUpCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.dataSource = self
        self.view.addSubview(self.collectionView!)
        
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    deinit{
        print("Deinit of DefaultCollectionViewController")
    }
}

import GTMRefresh
extension DefaultCollectionViewController: GTMRefreshHeaderDelegate {
    
    // MARK: - GTMRefreshHeaderDelegate
    func refresh() {
        perform(#selector(endRefresing), with: nil, afterDelay: 3)
    }
    
    func endRefresing() {
        self.collectionView?.endRefreshing(isSuccess: true)
    }
}
