//
//  DetailViewController.swift
//  ios101-project5-tumblr
//
//  Created by Jonathan Bateman on 7/17/25.
//

import UIKit
import NukeExtensions

class DetailViewController: UIViewController {
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var postTextView: UITextView!
    var post: Post!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postURL = post.photos?[0].originalSize.url
        NukeExtensions.loadImage(with: postURL, into: backdropImageView)
        
        postTextView.text = post.caption.trimHTMLTags()
    }
    

}
