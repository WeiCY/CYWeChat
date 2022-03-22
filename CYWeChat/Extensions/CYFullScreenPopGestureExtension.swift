//
//  CYFullScreenPopGestureExtension.swift
//  CYWeChat
//
//  Created by CityDoWCY on 2022/3/22.
//  参考：SHFullscreenPopGesture
//  初始化必须放在控制器初始化之前 否则tabbar上的界面会失效

import UIKit

open class CYFullScreenPopGestureExtension {
    open class func startFullScreenPop() {
        UINavigationController.cy_nav_initialize()
        UIViewController.cy_vc_initialize()
    }
}

extension UINavigationController {
    
    /// The gesture recognizer that actually handles interactive pop.
    var cy_fullscreenPopGestureRecognizer: UIPanGestureRecognizer {
        guard let pan = objc_getAssociatedObject(self, RuntimeKey.KEY_fullscreenPopGestureRecognizer!) as? UIPanGestureRecognizer else {
            let panGesture = UIPanGestureRecognizer()
            panGesture.maximumNumberOfTouches = 1;
            objc_setAssociatedObject(self, RuntimeKey.KEY_fullscreenPopGestureRecognizer!, panGesture, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            return panGesture
        }
        return pan
    }
    
    /// A view controller is able to control navigation bar's appearance by itself,
    /// rather than a global way, checking "fd_prefersNavigationBarHidden" property.
    /// Default to true, disable it if you don't want so.
    var cy_viewControllerBasedNavigationBarAppearanceEnabled: Bool {
        get {
            guard let bools = objc_getAssociatedObject(self, RuntimeKey.KEY_viewControllerBasedNavigationBarAppearanceEnabled!) as? Bool else {
                self.cy_viewControllerBasedNavigationBarAppearanceEnabled = true
                return true
            }
            return bools
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_viewControllerBasedNavigationBarAppearanceEnabled!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var cy_popGestureRecognizerDelegate: FullscreenPopGestureRecognizerDelegate {
        guard let deleagate = objc_getAssociatedObject(self, RuntimeKey.KEY_popGestureRecognizerDelegate!) as? FullscreenPopGestureRecognizerDelegate else {
            let popDelegate = FullscreenPopGestureRecognizerDelegate.init()
            popDelegate.navigationController = self
            objc_setAssociatedObject(self, RuntimeKey.KEY_popGestureRecognizerDelegate!, popDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return popDelegate
        }
        return deleagate
    }
    
    @objc private func cy_pushViewController(_ viewController: UIViewController, animated: Bool) {
        if interactivePopGestureRecognizer?.view?.gestureRecognizers?.contains(cy_fullscreenPopGestureRecognizer) == false {
            // Add our own gesture recognizer to where the onboard screen edge pan gesture recognizer is attached to.
            interactivePopGestureRecognizer?.view?.addGestureRecognizer(cy_fullscreenPopGestureRecognizer)
            
            // Forward the gesture events to the private handler of the onboard gesture recognizer.
            let internalTargets = interactivePopGestureRecognizer?.value(forKey: "targets") as? Array<NSObject>
            let internalTarget = internalTargets?.first?.value(forKey: "target")
            let internalAction = NSSelectorFromString("handleNavigationTransition:")
            if let target = internalTarget {
                self.cy_fullscreenPopGestureRecognizer.delegate = self.cy_popGestureRecognizerDelegate
                self.cy_fullscreenPopGestureRecognizer.addTarget(target, action: internalAction)
                
                // Disable the onboard gesture recognizer.
                interactivePopGestureRecognizer?.isEnabled = false
            }
        }
        
        // Handle perferred navigation bar appearance.
        self.cy_setupViewControllerBasedNavigationBarAppearanceIfNeeded(viewController)
        
        // Forward to primary implementation.
        self.cy_pushViewController(viewController, animated: animated)
    }
    
    private func cy_setupViewControllerBasedNavigationBarAppearanceIfNeeded(_ appearingViewController: UIViewController) {
        
        if !cy_viewControllerBasedNavigationBarAppearanceEnabled {
            return
        }
        
        let blockContainer = CYViewControllerWillAppearInjectBlockContainer() { [weak self] (_ viewController: UIViewController, _ animated: Bool) -> Void in
            self?.setNavigationBarHidden(viewController.cy_prefersNavigationBarHidden, animated: animated)
        }
        
        // Setup will appear inject block to appearing view controller.
        // Setup disappearing view controller as well, because not every view controller is added into
        // stack by pushing, maybe by "-setViewControllers:".
        appearingViewController.cy_willAppearInjectBlockContainer = blockContainer
        let disappearingViewController = viewControllers.last
        if let vc = disappearingViewController {
            if vc.cy_willAppearInjectBlockContainer == nil {
                vc.cy_willAppearInjectBlockContainer = blockContainer
            }
        }
    }
    
    open class func cy_nav_initialize() {
        // Inject
        DispatchQueue.once(token: "com.UINavigationController.MethodSwizzling") {
            let originalMethod = class_getInstanceMethod(self, #selector(pushViewController(_:animated:)))
            let swizzledMethod = class_getInstanceMethod(self, #selector(cy_pushViewController(_:animated:)))
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}

extension UIViewController {
    fileprivate var cy_willAppearInjectBlockContainer: CYViewControllerWillAppearInjectBlockContainer? {
        get {
            return objc_getAssociatedObject(self, RuntimeKey.KEY_willAppearInjectBlockContainer!) as? CYViewControllerWillAppearInjectBlockContainer
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_willAppearInjectBlockContainer!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Whether the interactive pop gesture is disabled when contained in a navigation stack.
    public var cy_interactivePopDisabled: Bool {
        get {
            guard let bools = objc_getAssociatedObject(self, RuntimeKey.KEY_interactivePopDisabled!) as? Bool else {
                return false
            }
            return bools
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_interactivePopDisabled!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    /// Indicate this view controller prefers its navigation bar hidden or not,
    /// checked when view controller based navigation bar's appearance is enabled.
    /// Default to false, bars are more likely to show.
    public var cy_prefersNavigationBarHidden: Bool {
        get {
            guard let bools = objc_getAssociatedObject(self, RuntimeKey.KEY_prefersNavigationBarHidden!) as? Bool else {
                return false
            }
            return bools
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_prefersNavigationBarHidden!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    /// Max allowed initial distance to left edge when you begin the interactive pop
    /// gesture. 0 by default, which means it will ignore this limit.
    public var cy_interactivePopMaxAllowedInitialDistanceToLeftEdge: Double {
        get {
            guard let doubleNum = objc_getAssociatedObject(self, RuntimeKey.KEY_interactivePopMaxAllowedInitialDistanceToLeftEdge!) as? Double else {
                return 0.0
            }
            return doubleNum
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_interactivePopMaxAllowedInitialDistanceToLeftEdge!, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
    
    @objc private func cy_viewWillAppear(_ animated: Bool) {
        // Forward to primary implementation.
        self.cy_viewWillAppear(animated)
        
        if let block = self.cy_willAppearInjectBlockContainer?.block {
            block(self, animated)
        }
    }
    
    open class func cy_vc_initialize() {
        // Inject
        DispatchQueue.once(token: "com.UIViewController.MethodSwizzling", block: {
            let originalMethod = class_getInstanceMethod(self, #selector(viewWillAppear(_:)))
            let swizzledMethod = class_getInstanceMethod(self, #selector(cy_viewWillAppear(_:)))
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        })
    }

}

extension UIScrollView: UIGestureRecognizerDelegate {
    public var cy_scrollViewPopGestureRecognizerEnable: Bool {
        get {
            guard let bools = objc_getAssociatedObject(self, RuntimeKey.KEY_scrollViewPopGestureRecognizerEnable!) as? Bool else {
                return false
            }
            return bools
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.KEY_scrollViewPopGestureRecognizerEnable!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    //UIGestureRecognizerDelegate
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.cy_scrollViewPopGestureRecognizerEnable, self.contentOffset.x <= 0, let gestureDelegate = otherGestureRecognizer.delegate {
            if gestureDelegate.isKind(of: FullscreenPopGestureRecognizerDelegate.self) {
                return true
            }
        }
        return false
    }
}

private class FullscreenPopGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {
    weak var navigationController: UINavigationController?
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        guard navigationController != nil else {
            return false
        }
        
        // Ignore when no view controller is pushed into the navigation stack.
        guard (navigationController?.viewControllers.count)! > 1 else {
            return false
        }
        
        // Ignore when the active view controller doesn't allow interactive pop.
        guard let topViewController = navigationController?.viewControllers.last else {
            return false
        }
        guard !topViewController.cy_interactivePopDisabled else {
            return false
        }
        
        // Ignore pan gesture when the navigation controller is currently in transition.
        guard let trasition = navigationController!.value(forKey: "_isTransitioning") as? Bool else {
            return false
        }
        guard !trasition else {
            return false
        }
        
        guard let panGesture = gestureRecognizer as? UIPanGestureRecognizer else {
            return false
        }
        
        // Ignore when the beginning location is beyond max allowed initial distance to left edge.
        let beginningLocation = panGesture.location(in: panGesture.view)
        let maxAllowedInitialDistance = topViewController.cy_interactivePopMaxAllowedInitialDistanceToLeftEdge
        guard maxAllowedInitialDistance <= 0 || Double(beginningLocation.x) <= maxAllowedInitialDistance else {
            return false
        }
        
        // Prevent calling the handler when the gesture begins in an opposite direction.
        let translation = panGesture.translation(in: panGesture.view)
        guard translation.x > 0 else {
            return false
        }
        
        return true
    }
}

fileprivate extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}

fileprivate struct RuntimeKey {
    static let KEY_fullscreenPopGestureRecognizer = UnsafeRawPointer(bitPattern: "KEY_fullscreenPopGestureRecognizer".hashValue)
    static let KEY_viewControllerBasedNavigationBarAppearanceEnabled = UnsafeRawPointer(bitPattern: "KEY_viewControllerBasedNavigationBarAppearanceEnabled".hashValue)

    // delegate
    static let KEY_popGestureRecognizerDelegate = UnsafeRawPointer(bitPattern: "KEY_popGestureRecognizerDelegate".hashValue)
    
    // Container
    static let KEY_willAppearInjectBlockContainer = UnsafeRawPointer(bitPattern: "KEY_willAppearInjectBlockContainer".hashValue)

    // ViewController
    static let KEY_interactivePopDisabled = UnsafeRawPointer(bitPattern: "KEY_interactivePopDisabled".hashValue)
    static let KEY_prefersNavigationBarHidden = UnsafeRawPointer(bitPattern: "KEY_prefersNavigationBarHidden".hashValue)
    static let KEY_interactivePopMaxAllowedInitialDistanceToLeftEdge = UnsafeRawPointer(bitPattern: "KEY_interactivePopMaxAllowedInitialDistanceToLeftEdge".hashValue)
    
    // scrollview
    static let KEY_scrollViewPopGestureRecognizerEnable = UnsafeRawPointer(bitPattern: "KEY_scrollViewPopGestureRecognizerEnable".hashValue)
}

fileprivate typealias CYViewControllerWillAppearInjectBlock = (_ viewController: UIViewController, _ animated: Bool) -> Void

fileprivate class CYViewControllerWillAppearInjectBlockContainer {
    var block: CYViewControllerWillAppearInjectBlock?
    init(_ block: @escaping CYViewControllerWillAppearInjectBlock) {
        self.block = block
    }
}
