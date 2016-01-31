import UIKit

/**
 
 Appearance and behavior of the scroll view.
 
 */
public struct AukSettings {
    
    /// Determines the stretching and scaling of the image when its proportion are not the same as its  container.
    public var contentMode = UIViewContentMode.ScaleAspectFit
    
    /// Image to be displayed when remote image download fails.
    public var errorImage: UIImage?
    
    /// Settings for styling the scroll view page indicator.
    public var pageControl = PageControlSettings()
    
    /// Settings for styling the page auxilary container.
    public var pageAuxView = PageAuxSettings()
    
    /// Settings for styling the page promotion.
    public var pagePromotion = PagePromotionSettings()
    
    /// Settings for styling the page description.
    public var pageDescription = PageDescriptionSettings()
    
    /// Settings for styling the page sub-description.
    public var pageSubDescription = PageSubDescriptionSettings()
    
    /// Enable paging for the scroll view. When true the view automatically scrolls to show the whole image.
    public var pagingEnabled = true
    
    /// Image to be displayed while the remote image is being downloaded.
    public var placeholderImage: UIImage?
    
    /// The duration of the animation that is used to show the remote images.
    public var remoteImageAnimationIntervalSeconds: Double = 0.5
    
    /// Show horizontal scroll indicator.
    public var showsHorizontalScrollIndicator = false
}

/**
 
 Settings for page indicator.
 
 */
public struct PageControlSettings {
    /// Frame of the page control container.
    public var frame = CGRectMake(0, 0, 0, 0)
    
    /// Background color of the page control container view.
    public var backgroundColor = UIColor(red: 128/256, green: 128/256, blue: 128/256, alpha: 0.4)
    
    /// Corner radius of page control container view.
    public var cornerRadius: Double = 13
    
    /// Color of the dot representing for the current page.
    public var currentPageIndicatorTintColor: UIColor? = nil
    
    /// Padding between page indicator and its container
    public var innerPadding = CGSize(width: 10, height: -5)
    
    /// Distance between the bottom of the page control view and the bottom of the scroll view.
    public var marginToScrollViewBottom: Double = 8
    
    /// Vertical position of pager.
    public var verticalPosition: NSLayoutAttribute = NSLayoutAttribute.Bottom
    
    /// Horizontal position of pager.
    public var horizontalPosition: NSLayoutAttribute = NSLayoutAttribute.Right
    
    /// Color of the page indicator dot.
    public var pageIndicatorTintColor: UIColor? = nil
    
    /// When true the page control is visible on screen.
    public var visible = true
}

/**
 
 Settings for page auxillary container.
 
 */
public struct PageAuxSettings {
    
    /// Frame of the page auxillary container.
    public var frame = CGRectMake(0, 0, 100, 50)
    
    /// Corner radius of page auxillary container.
    public var cornerRadius: CGFloat = 0
    
    /// Content mode of the page auxillary container.
    public var contentMode = UIViewContentMode.Bottom
    
    /// Background color of the page auxillary container.
    public var backgroundColor = UIColor.whiteColor()
    
    /// Tag of the page auxillary container.
    public var tag = 5;
}

/**
 
 Settings for page promotion.
 
 */
public struct PagePromotionSettings: AukBaseSettings {
    
    /// Frame of the page promotion.
    public var frame = CGRectMake(10, 15, 90, 15)
    
    /// Corner radius of page promotion.
    public var cornerRadius: CGFloat = 5
    
    /// Content mode of the page promotion.
    public var contentMode = UIViewContentMode.BottomLeft
    
    /// Text color of the page promotion text.
    public var textColor = UIColor.whiteColor()
    
    /// Font of the page promotion text.
    public var font = UIFont(name: "Arial", size: 12)
    
    /// Background color of the page promotion.
    public var backgroundColor = UIColor(red: 255/256, green: 90/256, blue: 0/256, alpha: 1)
    
    /// Text alignment of the page promotion.
    public var textAlignment = NSTextAlignment.Center
    
    /// Tag of the page promotion.
    public var tag = 6;
}

/**
 
 Settings for page description.
 
 */
public struct PageDescriptionSettings: AukBaseSettings {
    
    /// Frame of the page description.
    public var frame = CGRectMake(10, 100, 200, 50)
    
    /// Corner radius of page description.
    public var cornerRadius: CGFloat = 0
    
    /// Content mode of the page description.
    public var contentMode = UIViewContentMode.BottomLeft
    
    /// Text color of the page description text.
    public var textColor = UIColor.whiteColor()
    
    /// Font of the page description text.
    public var font = UIFont(name: "Arial", size: 20)
    
    /// Background color of the page description.
    public var backgroundColor = UIColor.clearColor()
    
    /// Text alignment of the page description.
    public var textAlignment = NSTextAlignment.Left
    
    /// Tag of the page description.
    public var tag = 7;
}

/**
 
 Settings for page sub-description.
 
 */
public struct PageSubDescriptionSettings: AukBaseSettings {
    
    /// Frame of the page sub-description.
    public var frame = CGRectMake(10, 125, 200, 50)
    
    /// Corner radius of page page sub-description.
    public var cornerRadius: CGFloat = 0
    
    /// Content mode of the page sub-description.
    public var contentMode = UIViewContentMode.BottomLeft
    
    /// Text color of the page sub-description text.
    public var textColor = UIColor(red: 169/256, green: 169/256, blue: 169/256, alpha: 1)
    
    /// Font of the page sub-description text.
    public var font = UIFont(name: "Arial", size: 15)
    
    /// Background color of the page sub-description.
    public var backgroundColor = UIColor.clearColor()
    
    /// Text alignment of the page sub-description.
    public var textAlignment = NSTextAlignment.Left
    
    /// Tag of the page sub-description.
    public var tag = 8;
}

protocol AukBaseSettings {
    
    var frame: CGRect { get }
    var cornerRadius: CGFloat { get }
    var contentMode: UIViewContentMode { get }
    var textColor: UIColor { get }
    var font: UIFont? { get }
    var backgroundColor: UIColor { get }
    var textAlignment: NSTextAlignment { get }
    var tag: Int { get }
    
}

