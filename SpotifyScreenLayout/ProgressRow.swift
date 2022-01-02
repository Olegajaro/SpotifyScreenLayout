//
//  ProgressRow.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

class ProgressRow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let playButton = makePlayButton()
        let previewStartLabel = makePreviewLabel(withText: "0:00")
        let previewEndLabel = makePreviewLabel(withText: "0:30")
        let progressView = makeProgressView()
        
        addSubview(playButton)
        addSubview(previewStartLabel)
        addSubview(progressView)
        addSubview(previewEndLabel)
        
        playButton.topAnchor.constraint(
            equalTo: topAnchor
        ).isActive = true
        playButton.leadingAnchor.constraint(
            equalTo: leadingAnchor
        ).isActive = true
        playButton.widthAnchor.constraint(
            equalToConstant: buttonHeight
        ).isActive = true
        playButton.heightAnchor.constraint(
            equalToConstant: buttonHeight
        ).isActive = true
        
        previewStartLabel.centerYAnchor.constraint(
            equalTo: playButton.centerYAnchor
        ).isActive = true
        previewStartLabel.leadingAnchor.constraint(
            equalTo: playButton.trailingAnchor, constant: 8
        ).isActive = true
        
        progressView.centerYAnchor.constraint(
            equalTo: playButton.centerYAnchor
        ).isActive = true
        progressView.leadingAnchor.constraint(
            equalTo: previewStartLabel.trailingAnchor, constant: 8
        ).isActive = true
        progressView.trailingAnchor.constraint(
            equalTo: previewEndLabel.leadingAnchor, constant: -8
        ).isActive = true
        
        previewEndLabel.centerYAnchor.constraint(
            equalTo: playButton.centerYAnchor
        ).isActive = true
        previewEndLabel.trailingAnchor.constraint(
            equalTo: trailingAnchor
        ).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize (width: 200, height: buttonHeight)
    }
}

