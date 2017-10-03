//
//  Pagecontrol.swift
//  Emerged
//
//  Created by appinventiv on 19/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Pagecontrol: UIViewController {
    //---------variable declaration----//
    var food = ["pizza1", "pizza2", "pizza3", "pizza4",
                "pizza5", "pizza6"]
    //----------Outlets-------//
    @IBOutlet weak var pagecontrolCollectionView: UICollectionView!
    @IBOutlet weak var scrollPgeControll: UIPageControl!
    
    @IBAction func scrollPgeControll(_ sender: UIPageControl){
            self.pagecontrolCollectionView.contentOffset.x = self.pagecontrolCollectionView.frame.size.width * CGFloat(self.scrollPgeControll.currentPage)
        }
    

override func viewDidLoad() {
        super.viewDidLoad()
        self.pagecontrolCollectionView.dataSource = self
        self.pagecontrolCollectionView.delegate = self
}

}
extension Pagecontrol: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIPageViewControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return food.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Customcell", for: indexPath) as? Customcell
            else {
            fatalError("not found")
        }
        cell.pizzaImgView.image = UIImage(named: food[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.pagecontrolCollectionView.frame.width, height: 392)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if let cell = collectionView.visibleCells.first {
            let index = collectionView.indexPath(for: cell)!
            self.scrollPgeControll.currentPage = index.row
        }
    }
}
class Customcell: UICollectionViewCell {
    
    @IBOutlet weak var pizzaImgView: UIImageView!
}















