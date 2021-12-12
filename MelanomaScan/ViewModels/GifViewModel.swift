//
//  GifViewModel.swift
//  MelanomaScan
//
//  Created by Aasmaan Yadav on 11/12/21.
//

import Foundation
import WebKit
import SwiftUI
import UIKit


struct GifImage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    //creating the actual webview using the gif file added to the files.
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        
        //webView.scrollView.isScrollEnabled = false
        //webView.scrollView.contentInset = UIEdgeInsets.zero
        //webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        webView.scrollView.isUserInteractionEnabled = false
        webView.scrollView.backgroundColor = UIColor(Color("Background"))
        
        return webView
    }
    
    //updating the webview (making sure the gif animates)
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        uiView.reload()
    }
    
}

