//
//  UIView+Gesture.swift
//  gestureTest
//
//  Created by Serx on 16/5/9.
//  Copyright © 2016年 Serx.Lee. All rights reserved.
//


import Foundation
import UIKit

private struct AssociatedKey {
    static var ActionHandlerTapBlockKey = "ActionHandlerTapBlockKey"
    static var ActionHandlerTapGestureKey = "ActionHandlerTapGestureKey"
    static var ActionHandlerLongPressBlockKey = "ActionHandlerLongPressBlockKey"
    static var ActionHandlerLongPressGestureKey = "ActionHandlerLongPressGestureKey"
}


extension UIView{
    
    /*
        --set the tap Action
    */
    
    typealias ActionClosure = @convention(block) ()-> ()
    
    func setTapActionWithBlock(closure: ActionClosure){
        
        var gesture = objc_getAssociatedObject(self, &AssociatedKey.ActionHandlerTapGestureKey) as? UIGestureRecognizer
        
        if (gesture == nil) {
            gesture = UITapGestureRecognizer(target: self, action: (#selector(UIView.handleActionForTapGesture(_:))))
            self.addGestureRecognizer(gesture!)
            objc_setAssociatedObject(self, &AssociatedKey.ActionHandlerTapGestureKey, gesture, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        let dealObject: AnyObject = unsafeBitCast(closure, AnyObject.self)
        objc_setAssociatedObject(self, &AssociatedKey.ActionHandlerTapBlockKey, dealObject, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    func handleActionForTapGesture(gesture: UITapGestureRecognizer){
        
        if (gesture.state == UIGestureRecognizerState.Recognized){
            
            let closureObject: AnyObject = objc_getAssociatedObject(self, &AssociatedKey.ActionHandlerTapBlockKey)
            let closure = unsafeBitCast(closureObject, ActionClosure.self)
            closure()
        }
    }
    
    
    /*
        --set the long press Action
    */
    func setLongPressActionWithBlock(closure: ActionClosure) {
        
        var gesture = objc_getAssociatedObject(self, &AssociatedKey.ActionHandlerLongPressGestureKey) as? UILongPressGestureRecognizer
        if gesture == nil{
            
            gesture = UILongPressGestureRecognizer(target: self, action: #selector(UIView.handleActionForLongPressGesture(_:)))
        }
        
        let dealObject: AnyObject = unsafeBitCast(closure, AnyObject.self)
        objc_setAssociatedObject(self, &AssociatedKey.ActionHandlerLongPressBlockKey, dealObject, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    func handleActionForLongPressGesture(gesture: UILongPressGestureRecognizer){
        
        if gesture.state == UIGestureRecognizerState.Recognized{
            
            let closureObject: AnyObject = objc_getAssociatedObject(self, &AssociatedKey.ActionHandlerLongPressBlockKey)
            let closure = unsafeBitCast(closureObject, ActionClosure.self)
            closure()
            //TODO: action
        }
    }
    
    /*
        --set ..
    */
}