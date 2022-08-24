//
//  ImageCollectionVC.swift
//  ContactApp
//
//  Created by Sushil Dhital on 24/08/2022.
//

import UIKit

class ImageCollectionVC: UIViewController {

    @IBOutlet weak var imageCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollection.register(UINib(nibName: "CellImageCollection", bundle: nil), forCellWithReuseIdentifier: "CellImageCollection")

    }
    

}

extension ImageCollectionVC: UICollectionViewDelegate,  UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CellImageCollection
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  5
        
    }
    
    
}

