# SegmentControlDemo


This demo project explains the usage of BetterSegmentedController and UIPageViewController.





Changes done in BetterSegmentedController


To remember the previous selected index this below change is done.

    public fileprivate(set) var oldIndex : UInt = 0
    public fileprivate(set) var index: UInt{
            willSet{
                print(index)
                oldIndex = index
            }
     }
     
     
I added a customView to make false height of selected Index

     fileprivate let customView = UIView()
     
     
     
     fileprivate func finishInit() {
        ...............   
        addSubview(customView)
        ...............
    }
     

     public var customViewBackGroundColor: UIColor? {
        get {
            return customView.backgroundColor
        }
        set {
            customView.backgroundColor = newValue ?? UIColor.white
        }
    }
 
 
     public var customViewWidth: CGFloat? {
            get {
                return customView.frame.width
            }
            set {
                customView.frame = CGRect(x: 0, y: 0, width: newValue!, height: 5)
            }
        }
        
        
        
     override open func layoutSubviews() {
        super.layoutSubviews()
        .................
        titleLabelsView.frame = CGRect(x: 0, y: 3, width: bounds.width, height: bounds.height)
        .................
     }
 
 
Pictorial view of this segment control


![screen shot 2017-09-12 at 5 51 39 pm](https://user-images.githubusercontent.com/28722125/30325066-fd060304-97e2-11e7-844b-de2cf4daeda9.png)


Reference for BetterSegmentedController : https://github.com/gmarm/BetterSegmentedControl 

The output of this project is shown below:

![ezgif com-resize](https://user-images.githubusercontent.com/28722125/30323580-7ab90afe-97dd-11e7-8c60-5d98346293bc.gif)



