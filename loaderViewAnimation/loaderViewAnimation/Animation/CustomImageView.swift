//
//  CustomImageView.swift
//  loaderViewAnimation
//
//  Created by Максим Нурутдинов on 31.05.2023.
//

import UIKit

class CustomImageView: UIImageView {
    
    let progressIndicatorView = CircularLoaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentMode = .scaleAspectFit
        
        translatesAutoresizingMaskIntoConstraints = false
        progressIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(progressIndicatorView)
        
        NSLayoutConstraint.activate([
            progressIndicatorView.widthAnchor.constraint(equalTo: widthAnchor),
            progressIndicatorView.heightAnchor.constraint(equalTo: heightAnchor),
            progressIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        let urlString =  "https://adonius.club/uploads/posts/2022-08/1660353821_4-adonius-club-p-kvoka-zhivotnoe-zhivotnie-krasivo-foto-4.jpg"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url)
            .resume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomImageView: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        let image = UIImage(data: data)
        DispatchQueue.main.async {
            self.image = image
            self.progressIndicatorView.reveal()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = totalBytesWritten / totalBytesExpectedToWrite
        
        DispatchQueue.main.async {
            self.progressIndicatorView.progress = CGFloat(progress)
        }
    }
}
