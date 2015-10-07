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
	
	// MARK: properties
	
	var labelObject:LabelObject? {
		return representedObject as? LabelObject
	}
	
	override var selected: Bool {
		didSet {
			(self.view as! LabelCollectionViewItemView).selected = selected
		}
	}
	override var highlightState: NSCollectionViewItemHighlightState {
		didSet {
			(self.view as! LabelCollectionViewItemView).highlightState = highlightState
		}
	}

	// MARK: outlets
	
	@IBOutlet weak var label: NSTextField!

	// MARK: NSResponder

	override func mouseDown(theEvent: NSEvent) {
		if theEvent.clickCount == 2 {
			print("Double click \(labelObject!.title)")
		} else {
			super.mouseDown(theEvent)
		}
		
	}

}

