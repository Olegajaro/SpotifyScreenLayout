//
//  PlayerView.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

class PlayerView: UIView {
    
    let stackView: UIStackView
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYAnchorConstraint = NSLayoutConstraint()
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        let progressView = ProgressRow()
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(spotifyButton)
        
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topAnchorConstraint = stackView.topAnchor.constraint(equalTo: topAnchor)
        centerYAnchorConstraint = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    }
    
    func adjustForOrientation() {
        if UIDevice.current.orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYAnchorConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYAnchorConstraint.isActive = true
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
}
