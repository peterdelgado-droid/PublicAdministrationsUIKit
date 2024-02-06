//
//  PublicAdminViewController.swift
//  PublicAdministrationsUIKit
//
//  Created by Peter Delgado on 9/10/23.
//
import UIKit

class PublicAdminViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		// Create a new UIView instance
		let greenRectangle = UIView()

		// Set the background color to green
		greenRectangle.backgroundColor = UIColor.green

		// Set the frame of the UIView
		greenRectangle.frame = CGRect(x: 50, y: 50, width: 200, height: 100)

		// Add the UIView as a subview of the main view
		view.addSubview(greenRectangle)
	}
}
