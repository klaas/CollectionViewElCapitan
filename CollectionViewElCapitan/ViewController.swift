//
//  ViewController.swift
//  CollectionViewElCapitan
//
//  Created by Klaas on 07.10.15.
//  Copyright © 2015 Park Bench. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource {
	var strings = ["Peter", "Florian", "Ruediger", "John", "Paul", "George", "Ringo"].sort()
	
	@IBOutlet weak var collectionView: NSCollectionView!
	private var collectionView2:NSCollectionView!
	private var scrollView:NSScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// MARK: - 🔴🔴🔴🔴🔴 parte 1: interface builder 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

		collectionView.dataSource = self
		collectionView.registerClass(LabelCollectionViewItem2.self, forItemWithIdentifier: "item")
		
		// MARK: - 🔴🔴🔴🔴🔴 part 2: programmatically 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴

		scrollView = {
			let v = NSScrollView(frame: NSRect.zero)
			v.translatesAutoresizingMaskIntoConstraints = false
			v.hasVerticalRuler = false
			v.hasVerticalScroller = true
			return v
			}()
		
		collectionView2 = {
			let v = NSCollectionView(frame: NSRect.zero)
			v.wantsLayer = true
			v.layer!.backgroundColor = NSColor.brownColor().CGColor
			v.selectable = true
			v.allowsEmptySelection = false
			v.collectionViewLayout = {
				let l = NSCollectionViewFlowLayout()
				l.minimumInteritemSpacing = 10
				l.minimumLineSpacing = 10
				l.scrollDirection = NSCollectionViewScrollDirection.Horizontal
				l.sectionInset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
				l.itemSize = CGSize(width: 400, height: 80)
				return l
				}()
			
			return v
			}()
		
		collectionView2.registerClass(LabelCollectionViewItem2.self, forItemWithIdentifier: "item")
		collectionView2.dataSource = self
		scrollView.documentView = collectionView2

		view.addSubview(scrollView)

		view.pbbPlace(scrollView, at:(300,0,0,0))
	}

	// MARK: NSCollectionViewDataSource
	
	func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return strings.count * 10
	}
	
	func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
		
		let lo = LabelObject(title: strings[indexPath.item % strings.count])
		
		if indexPath.item % 2 == 0 {
			let item = collectionView.makeItemWithIdentifier("item", forIndexPath: indexPath) as! LabelCollectionViewItem2
			item.labelObject = lo
			return item
		} else {
			let item = collectionView.makeItemWithIdentifier("LabelCollectionViewItem", forIndexPath: indexPath)
			item.representedObject = lo
			return item
		}
		
	}
}

