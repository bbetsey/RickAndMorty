//
//  StartViewController.swift
//  Rick&Morty
//
//  Created by Антон Тропин on 14.05.23.
//

import UIKit

class StartViewController: UITableViewController {
	
	let characterCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "characterCell")
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	let locationCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "locationCell")
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	let episodeCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "episodeCell")
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	private var scrollView = UIScrollView()
	private var contentView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .white
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Rick & Morty"
		
		characterCollectionView.delegate = self
		characterCollectionView.dataSource = self
		
		locationCollectionView.delegate = self
		locationCollectionView.dataSource = self
		
		episodeCollectionView.delegate = self
		episodeCollectionView.dataSource = self
		
		scrollView.delegate = self
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		scrollView.backgroundColor = .lightGray
		scrollView.isScrollEnabled = true
		
		contentViewSetupSubviews(characterCollectionView, locationCollectionView, episodeCollectionView)
		setConstraints()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print(view.frame.size)
		print(scrollView.frame.size)
		print(contentView.frame.size)
	}

	private func contentViewSetupSubviews(_ subviews: UIView...) {
		subviews.forEach { subview in
			contentView.addSubview(subview)
		}
	}

	private func setConstraints() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		characterCollectionView.backgroundColor = .red
		episodeCollectionView.backgroundColor = .green
		locationCollectionView.backgroundColor = .purple
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
			scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
		])
		
		NSLayoutConstraint.activate([
			characterCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			characterCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
			characterCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			characterCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
		])
		
		NSLayoutConstraint.activate([
			locationCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			locationCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
			locationCollectionView.topAnchor.constraint(equalTo: characterCollectionView.bottomAnchor, constant: 16),
			locationCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
		])
		
		NSLayoutConstraint.activate([
			episodeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			episodeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
			episodeCollectionView.topAnchor.constraint(equalTo: locationCollectionView.bottomAnchor, constant: 16),
			episodeCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
			episodeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}

}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension StartViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch collectionView {
			case characterCollectionView:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath)
				cell.backgroundColor = .white
				return cell
			case episodeCollectionView:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath)
				cell.backgroundColor = .white
				return cell
			default:
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath)
				cell.backgroundColor = .white
				return cell
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: collectionView.frame.width / 1.6, height: collectionView.frame.width / 2.2)
	}

}

