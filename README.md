🚨 **This is a Swift 2 repo. The updated version: <https://github.com/klaas/CollectionViewSwift4>** 🚨

# CollectionViewElCapitan
Apple changed the way `NSCollectionView` works in OS 10.11 as shown in the talk ["What's New in NSCollectionView"](https://developer.apple.com/videos/play/wwdc2015-225/) at WWDC 2015. They also provide a complex example written in Objective-C: [CocoaSlideCollection](https://developer.apple.com/library/mac/samplecode/CocoaSlideCollection/Introduction/Intro.html)

This is a simple sample project written in Swift.

It uses the standard Cocoa Application template and has a single view controller containing a collection view. It shows simple labels as items. You can select and double click items.

### Notes

There is still a bug in Xcode (as of 7.3 (7D175)): When you add a NSCollectionView within Interface Bulider you'll get a compile error saying:

`Main.storyboard: error: Unknown segue relationship: Prototype`

The workaround used in this project is to remove the segue and create a .xib file containing the collection view item. The filename can then be used as an item identifier.

### Programmatic Version

The branch `ProgrammaticVersion` contains a second `NSCollectionView` that does not rely on any Interface Builder files.
