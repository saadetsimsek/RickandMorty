//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickandMorty
//
//  Created by Saadet Şimşek on 19/12/2023.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraits(){
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel){
        
    }
}
