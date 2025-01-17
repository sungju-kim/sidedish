import UIKit

extension BriefBanchanViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDishes[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        return CGSize(width: cellWidth, height: cellWidth/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BriefBanchanViewCell.cellId, for: indexPath) as? BriefBanchanViewCell else {
            return UICollectionViewCell()
        }
        if let targetDish: Dish = allDishes[indexPath.section][indexPath.row] {
            let dishViewModel = BanchanViewModel(dish: targetDish)
            guard let special = dishViewModel.discountPolicy else { return UICollectionViewCell() }
            
            cell.configure(title: dishViewModel.title, description: dishViewModel.description)
            cell.configure(specialBadge: special)
            cell.configure(price: dishViewModel.price, listPrice: dishViewModel.listPrice)
            DispatchQueue.global().async {
                if let image = dishViewModel.image {
                    DispatchQueue.main.sync {
                        cell.configure(image: image)
                    }
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        
        let height: CGFloat = 96
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BriefBanchanReusableView.identifier, for: indexPath) as? BriefBanchanReusableView else {return UICollectionReusableView()}
            headerView.setTitle(to: allDishes[indexPath.section].type)
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: CGFloat.defaultInset*2, right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allDishes.count
    }
    
}
