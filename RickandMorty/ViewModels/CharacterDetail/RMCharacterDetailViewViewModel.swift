//
//  RMCharacterDetailViewViewModel.swift
//  RickandMorty
//
//  Created by Saadet Şimşek on 16/12/2023.
//

import Foundation
import UIKit

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information(viewModel: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes(viewModel: [RMCharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    
    //MARK: - Inıt
    
    init(character: RMCharacter) {
        self.character = character
        setUpSections()
    }
    public func setUpSections() {
        sections = [
            .photo(viewModel: .init(imageUrl: <#T##URL?#>)),
            .information(viewModel: [
                .init(),
                .init(),
                .init(),
                .init()
            ]),
            .episodes(viewModel: [
                .init(),
                .init(),
                .init(),
                .init()
            ])
        ]
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    //MARK: - lAYOUT
    public func createPhotoSectionLayout()-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .fractionalHeight(0.5)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    public func createInfoSectionLayout()-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                     leading: 2,
                                                     bottom: 2,
                                                     trailing: 2)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(150)),
                                                     subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    public func createEpisodeSectionLayout()-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                     leading: 5,
                                                     bottom: 10,
                                                     trailing: 8)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                                                                        heightDimension: .absolute(150)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    
    
}
/*
 public func fetchCharacterInfo(){
     guard let url = requestUrl,
         let request = RMRequest(url: url) else{
         print("failed to create")
         return
     }
     RMService.shared.execute(request,
                              expecting: RMCharacter.self) { result in
         switch result{
         case .success(let success):
             print(String(describing: success))
         case .failure(let failure):
             print(String(describing: failure))
         }
     }
 }
 */
