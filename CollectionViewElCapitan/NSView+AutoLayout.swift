//

import Foundation
import AppKit

// --------------------------------------------------------------------------------
// auto layout
// --------------------------------------------------------------------------------

extension NSView {
	public func pbbPlace(view: NSView, inset:CGFloat) -> [NSLayoutConstraint] {
		return pbbPlace(view, at:(inset, inset, inset, inset))
	}
	
	public func pbbPlace(view: NSView, at tuple:(CGFloat?, CGFloat?, CGFloat?, CGFloat?) = (0,0,0,0)) -> [NSLayoutConstraint] {
		var res: [NSLayoutConstraint] = []
		
		let (top, left, bottom, right) = tuple
		
		if let inset = top {
			let c = NSLayoutConstraint( item: view, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = left {
			let c = NSLayoutConstraint( item: view, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = bottom {
			let c = NSLayoutConstraint( item: self, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		if let inset = right {
			let c = NSLayoutConstraint( item: self, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: inset)
			res.append(c)
		}
		
		addConstraints(res)
		
		return res
	}
	
	public func pbbPlaceInCenter(view:NSView, withOffset offset:(CGFloat, CGFloat) = (0,0)) -> [NSLayoutConstraint] {
		let c1 = NSLayoutConstraint( item: view, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: offset.0)
		let c2 = NSLayoutConstraint( item: view, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: offset.1)
		
		addConstraints([c1, c2])
		
		return [c1, c2]
	}
	
}