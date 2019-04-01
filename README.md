# KeyboardAvoidableViews
Custom views to make TableView/CollectionView/ScrollView/View keyboard avoidable


# How to use?
It's very easy to make Table/Collection/Scroll views keyboard avoidable.
Only change is go to Identity Inspector, and change the class to KeyboardAvoidableTableView/CollectionView/ScrollView

# Other type to be avoidable
For example, an UIViewController contains a TableView and other UI component.
1. make the UIViewController subclass KeyboardAvoidableViewController
2. wrap all the components in the an UIView(named contentView)
3. Open the UIViewController in XIB, link contentView and bottom constraint in Connections Inspector
