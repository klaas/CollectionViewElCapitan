//

import Foundation
import AppKit

class LabelObject: NSObject {
	var title:String
	
	init(title:String) {
		self.title = title
	}
}


class LabelCollectionViewItem: NSCollectionViewItem {
	
	// MARK: - 🔴🔴🔴🔴🔴 properties 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
	
//	override var representedObject: AnyObject? {
//		didSet {
//			if let imageObject = representedObject as? ImageObject {
//				title = imageObject.title
//				thumb = imageObject.thumb
//			}
//		}
//	}
	
	var labelObject:LabelObject? {
		return representedObject as? LabelObject
	}
	
	override var selected: Bool {
		didSet {
//			qlinelog("selected \(selected)")
			(self.view as! LabelCollectionViewItemView).selected = selected
		}
	}
	override var highlightState: NSCollectionViewItemHighlightState {
		didSet {
//			qlinelog("highlightState \(highlightState.pbDescription)")
			(self.view as! LabelCollectionViewItemView).highlightState = highlightState
		}
	}

	// MARK: - 🔴🔴🔴🔴🔴 outlets 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
	
	@IBOutlet weak var label: NSTextField!

	// MARK: - 🔴🔴🔴🔴🔴 NSResponder 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

	override func mouseDown(theEvent: NSEvent) {
		if theEvent.clickCount == 2 {
			print("double click! \(labelObject!.title)")
		} else {
			super.mouseDown(theEvent)
		}
		
	}

}

