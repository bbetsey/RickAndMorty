//
//  CharacterTableViewCell.swift
//  Rick&Morty
//
//  Created by Антон Тропин on 18.05.23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
	
	static let cellID = "characterCell"
	private let itemID = "characterItem"
	
	let characterCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addSubview(characterCollectionView)
		characterCollectionView.delegate = self
		characterCollectionView.dataSource = self
		characterCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: itemID)
		
		characterCollectionView.backgroundColor = .red
		
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
			characterCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
			characterCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			characterCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			characterCollectionView.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor),
			characterCollectionView.heightAnchor.constraint(equalToConstant: 300)
		])
	}

}


// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource

extension CharacterTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemID, for: indexPath)
		cell.backgroundColor = .white
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: collectionView.frame.width / 1.6, height: collectionView.frame.width / 2.2)
	}
}
