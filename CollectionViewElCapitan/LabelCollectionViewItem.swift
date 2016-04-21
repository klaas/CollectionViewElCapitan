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

class LabelCollectionViewItem2: NSCollectionViewItem {
	
	// MARK: properties
	
	var labelObject:LabelObject? {
		didSet {
			label.stringValue = labelObject?.title ?? ""
		}
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
	
	// MARK: - 🔴🔴🔴🔴🔴 view properties 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

	var label:NSTextField!
	
	// MARK: - 🔴🔴🔴🔴🔴 NSViewController 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

	override func loadView() {
		self.view = LabelCollectionViewItemView(frame: NSRect(x: 0, y: 0, width: 300, height: 30))
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.greenColor().CGColor
		
		label = {
			let v = NSTextField()
			v.selectable = false
			v.editable = false
			v.drawsBackground = false
			v.bezeled = false
			v.translatesAutoresizingMaskIntoConstraints = false
			v.alignment = .Center
			v.font = NSFont.systemFontOfSize(30)
			return v
		}()
		
		self.view.addSubview(label)
		self.view.pbbPlaceInCenter(label)
	}
	
	// MARK: NSResponder
	
	override func mouseDown(theEvent: NSEvent) {
		if theEvent.clickCount == 2 {
			print("Double click \(labelObject!.title)")
		} else {
			super.mouseDown(theEvent)
		}
		
	}
	
}

