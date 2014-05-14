DHLayout
===

简化iOS的布局工作

----------
## 为什么要写

将UIView的布局工作分离出来，由专门的布局管理器(LayoutManager)来完成布局工作。
好处： 1.UIView不用处理布局相关的事情  2.容易新增布局形式。

* 1.通过(UIView+Layout)给UIView添加5个布局属性，这样所有UIView都可以参与布局。
* 2.DHLayoutView是具有布局子视图能力的View。它重写了layoutSubviews方法来实现自己的布局。(代码中提供了它的两个子类DHHorizontalLayoutView和DHVerticalLayoutView，分别用于水平布局和垂直布局)
* 3.DHLayoutManager用于处理实际布局工作。DHLayoutView的布局工作实际上都会交由内部的DHLayoutManager来完成。（代码中为DHHorizontalLayoutView提供了DHHoritalLayoutManager，为DHVerticalLayoutView提供了DHVerticalLayoutManager）
 
## Class hierarchy
    + DHLayoutView                          
        + DHHorizontalLayoutView            
        + DHVerticalLayoutView
 
    + DHLayoutManager
        + DHHorizontalLayoutManager
        + DHVerticalLayoutManager
 
## Usage:
* It was designed to be work with Xib (of course you can use it in Code) , you can set all the property in `User Defined Runtime Attributes`
![此处输入图片的描述][1]
* you can learn more in the Demo.


  [1]: http://d.pcs.baidu.com/thumbnail/a915c1ca67c356fe8c4c0b57aca7957d?fid=2382928553-250528-1052143030927168&time=1400065200&rt=pr&sign=FDTAER-DCb740ccc5511e5e8fedcff06b081203-wWZdWWewyQ1H22gkgaJ5bIJ06ZA%3D&expires=8h&prisign=RK9dhfZlTqV5TuwkO5ihMSi9urWA6/WDVOZJjW161c97pPFvBnDjJvo8Gcuo6pQpvRueDZ4mTmr27k9J0e2dzkmye5j3Whl2FUBatugDm4Hnjds9K4Te4F7rrSoMdSR+fM/YKEORv7zOuOwy0sc8eQNry+nhBSfDN0fBGRIdEQImVDevvKfjRDlDZ5A8/SpsBV0kJzJEDGqVFhLOY+LAdqxq3WOPuI3SjriTWqPLoHyJNj4vs5qzEg==&chkv=0&chkbd=0&r=838706800&size=c850_u580&quality=100
