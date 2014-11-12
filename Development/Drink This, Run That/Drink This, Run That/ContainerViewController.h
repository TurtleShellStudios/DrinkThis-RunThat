//
//  ContainerViewController.h
//  Drink This, Run That
//
//  Created by X Code User on 11/11/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentController.h"
@interface ContainerViewController : UIViewController<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
-(PageContentController *)viewControllerAtIndex:(NSUInteger)index;

@end
