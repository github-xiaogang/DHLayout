DHLayout
========

simlify layout work for iOS

# How it works
I wrote this to separate UIView`s layout job to layout manager , so we can add a new layout easily
 
* 1.(UIView + Layout) category  add five layout property to UIView ,so all UIView can participate the layout process

* 2.DHLayoutView is a layout view that used to layout its subviews, it overrides UIView`s layoutSubviews method to provide its own layout, I provide two subclass, DHHorizontalLayoutView and DHVerticalLayoutView for you to use.
 
* 3.DHLayoutManager is used to do the actual job for DHLayoutView, it has a subclass DHHoritalLayoutManager for DHHorizontalLayoutView ,and DHVerticalLayoutManager for DHVerticalLayoutView
 
# Class hierarchy
    + DHLayoutView                          
        + DHHorizontalLayoutView            
        + DHVerticalLayoutView
 
    + DHLayoutManager
        + DHHorizontalLayoutManager
        + DHVerticalLayoutManager
 
# Usage:
* It was designed to be work with Xib (of course you can use it in Code) , you can set all the property in <User Defined Runtime Attributes> section, and you can learn more in the Demo.
