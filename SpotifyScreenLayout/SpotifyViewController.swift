//
//  SpotifyViewController.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

class SpotifyViewController: UIViewController {

    let stackView: UIStackView
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        stackView.addSubview(makeAlbumImageView())
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor
        ).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor
        ).isActive = true
        stackView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor
        ).isActive = true
    }
    
    // MARK: - Factory Methods
    
    private func makeAlbumImageView() -> UIImageView {
        let albumImage = makeImageView(named: "rush")
        
        let heighAnchorConstraint = albumImage.heightAnchor.constraint(
            equalTo: albumImage.widthAnchor
        )
        heighAnchorConstraint.priority = .defaultHigh
        heighAnchorConstraint.isActive = true
        
        return albumImage
    }
}

