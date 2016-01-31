import UIKit

/// The view for an individual page of the scroll view containing an image.
final class AukPage: UIView {
    
    // Image view for showing a placeholder image while remote image is being downloaded.
    // The view is only created when a placeholder image is specified in settings.
    weak var placeholderImageView: UIImageView?
    
    // Image view for showing local and remote images
    weak var imageView: UIImageView?
    
    // View for holding all text labels
    weak var pageAuxView: UIView?
    
    // Label for showing promotion
    weak var pagePromotion: UILabel?
    
    // Label for showing description
    weak var pageDescption: UILabel?
    
    // Label for showing sub-description
    weak var subPageDescption: UILabel?
    
    // Contains a URL for the remote image, if any.
    var remoteImage: AukRemoteImage?
    
    /**
     
     Shows an image with description and sub-description.
     
     - parameter image: The image to be shown
     - parameter settings: Auk settings.
     
     */
    func show(image image: UIImage, description: String, subDescription: String, promotion: String, settings: AukSettings) {
        imageView = createAndLayoutImageView(settings)
        imageView?.image = image
        
        pageAuxView = createAndLayoutAuxView(settings.pageAuxView)
        
        pagePromotion = createAndLayoutLabel(settings.pagePromotion)
        pagePromotion?.text = promotion
        
        pageDescption = createAndLayoutLabel(settings.pageDescription)
        pageDescption?.text = description
        
        subPageDescption = createAndLayoutLabel(settings.pageSubDescription)
        subPageDescption?.text = subDescription
    }
    
    /**
     
     Shows an image.
     
     - parameter image: The image to be shown
     - parameter settings: Auk settings.
     
     */
    func show(image image: UIImage, settings: AukSettings) {
        imageView = createAndLayoutImageView(settings)
        imageView?.image = image
    }
    
    /**
     
     Shows a remote image. The image download stars if/when the page becomes visible to the user.
     
     - parameter url: The URL to the image to be displayed.
     - parameter settings: Auk settings.
     
     */
    func show(url url: String, settings: AukSettings) {
        if settings.placeholderImage != nil {
            placeholderImageView = createAndLayoutImageView(settings)
        }
        
        imageView = createAndLayoutImageView(settings)
        
        if let imageView = imageView {
            remoteImage = AukRemoteImage()
            remoteImage?.setup(url, imageView: imageView, placeholderImageView: placeholderImageView,
                settings: settings)
        }
    }
    
    /**
     
     Called when the page is currently visible to user which triggers the image download. The function is called frequently each time scroll view's content offset is changed.
     
     */
    func visibleNow(settings: AukSettings) {
        remoteImage?.downloadImage(settings)
    }
    
    /**
     
     Called when the page is currently not visible to user which cancels the image download. The method called frequently each time scroll view's content offset is changed and the page is out of sight.
     
     */
    func outOfSightNow() {
        remoteImage?.cancelDownload()
    }
    
    /**
     
     Create and layout the remote image view.
     
     - parameter settings: Auk settings.
     
     */
    func createAndLayoutAuxView(settings: PageAuxSettings) -> UIView {
        let newView = AukPage.createView(settings)
        addSubview(newView)
        AukPage.layoutView(newView, superview: self)
        return newView
    }
    
    private static func createView(settings: PageAuxSettings) -> UIView {
        let newView = UIView(frame: settings.frame)
        newView.layer.cornerRadius = settings.cornerRadius
        newView.contentMode = settings.contentMode
        newView.layer.backgroundColor = settings.backgroundColor.CGColor
        newView.userInteractionEnabled = false
        newView.tag = settings.tag
        return newView
    }
    
    /**
     
     Creates Auto Layout constrains for the view.
     
     - parameter view: Image view that is used to create Auto Layout constraints.
     
     */
    private static func layoutView(view: UIView, superview: UIView) {
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
    }
    
    /**
     
     Create and layout the remote image view.
     
     - parameter settings: Auk settings.
     
     */
    func createAndLayoutImageView(settings: AukSettings) -> UIImageView {
        let newImageView = AukPage.createImageView(settings)
        addSubview(newImageView)
        AukPage.layoutImageView(newImageView, superview: self)
        return newImageView
    }
    
    private static func createImageView(settings: AukSettings) -> UIImageView {
        let newImageView = UIImageView()
        newImageView.contentMode = settings.contentMode
        return newImageView
    }
    
    /**
     
     Create and layout the labels.
     
     - parameter settings: AukBaseSettings.
     
     */
    func createAndLayoutLabel(settings: AukBaseSettings) -> UILabel {
        let newLabel = AukPage.createLabel(settings)
        addSubview(newLabel)
        return newLabel
    }
    
    private static func createLabel(settings: AukBaseSettings) -> UILabel {
        let newLabel = UILabel(frame: settings.frame)
        newLabel.layer.cornerRadius = settings.cornerRadius
        newLabel.contentMode = settings.contentMode
        newLabel.textColor = settings.textColor
        newLabel.font = settings.font
        newLabel.layer.backgroundColor = settings.backgroundColor.CGColor
        newLabel.textAlignment = settings.textAlignment
        newLabel.tag = settings.tag
        return newLabel
    }
    
    /**
     
     Creates Auto Layout constrains for the image view.
     
     - parameter imageView: Image view that is used to create Auto Layout constraints.
     
     */
    private static func layoutImageView(imageView: UIImageView, superview: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        iiAutolayoutConstraints.fillParent(imageView, parentView: superview, margin: 0, vertically: false)
        iiAutolayoutConstraints.fillParent(imageView, parentView: superview, margin: 0, vertically: true)
    }
    
    func makeAccessible(accessibilityLabel: String?) {
        isAccessibilityElement = true
        accessibilityTraits = UIAccessibilityTraitImage
        self.accessibilityLabel = accessibilityLabel
    }
}