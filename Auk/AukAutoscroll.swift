import UIKit

/**

Starts and cancels the auto scrolling.

*/
struct AukAutoscroll {
  var autoscrollTimer: AutoCancellingTimer?
  
  mutating func startAutoScroll(scrollView: UIScrollView, delaySeconds: Double,
    forward: Bool, cycle: Bool, animated: Bool, auk: AukInterface) {
      
    autoscrollTimer = AutoCancellingTimer(interval: delaySeconds, repeats: true) {
      if forward {
        AukScrollTo.scrollToNextPage(scrollView, cycle: cycle,
          animated: animated, currentPageIndex: auk.currentPageIndex,
          numberOfPages: auk.numberOfPages)
      } else {
        AukScrollTo.scrollToPreviousPage(scrollView, cycle: cycle,
          animated: animated, currentPageIndex: auk.currentPageIndex,
          numberOfPages: auk.numberOfPages)
      }
    }
  }
  
  mutating func stopAutoScroll() {
    autoscrollTimer = nil // Cancels the timer on deinit
  }
}
