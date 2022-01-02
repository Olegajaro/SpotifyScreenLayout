//
//  SpotifyViewController.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

class SpotifyViewController: UIViewController {

    let stackView: UIStackView
    let playerView: PlayerView
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        playerView = PlayerView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        registerForOrientationChanges()
    }
    
    private func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(SpotifyViewController.rotated),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }

    private func setupViews() {
        stackView.addArrangedSubview(makeAlbumImageView())
        stackView.addArrangedSubview(makePlayerStackView())
        
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
    
    private func makePlayerStackView() -> UIStackView {
        let stackView = makeStackView(withOrientation: .vertical)
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 0, leading: 8, bottom: 0, trailing: 8
        )
        stackView.addArrangedSubview(playerView)
        
        return stackView
    }
    
    // MARK: - Rotation
    
    @objc private func rotated() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

