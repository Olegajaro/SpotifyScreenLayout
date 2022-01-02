//
//  PlayerView.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

class PlayerView: UIView {
    
    let stackView: UIStackView
    let topSpacer = makeSpacerView(height: 100)
    let bottomSpacer = makeSpacerView(height: 100)
    
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
        let spotifyButton = makeSpotifyButtonCustomView()
        
        stackView.addArrangedSubview(topSpacer)
        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(spotifyButton)
        stackView.addArrangedSubview(bottomSpacer)
        
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(
            equalTo: leadingAnchor
        ).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: trailingAnchor
        ).isActive = true
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func makeSpotifyButtonCustomView() -> UIView {
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(
            equalToConstant: buttonHeight
        ).isActive = true
        container.addSubview(spotifyButton)
        
        spotifyButton.centerXAnchor.constraint(
            equalTo: container.centerXAnchor
        ).isActive = true
        spotifyButton.centerYAnchor.constraint(
            equalTo: container.centerYAnchor
        ).isActive = true
        
        return container
    }
    
    func adjustForOrientation() {
        if UIDevice.current.orientation.isPortrait {
            topSpacer.isHidden = true
            bottomSpacer.isHidden = true
        } else {
            topSpacer.isHidden = false
            topSpacer.isHidden = false
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
}
