//
//  ContainerViewController.m
//  Drink This, Run That
//
//  Created by X Code User on 11/11/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "ContainerViewController.h"


@implementation ContainerViewController

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentController*) viewController).indexNumber;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentController*) viewController).indexNumber;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    return [self viewControllerAtIndex:index];
}

-(PageContentController *)viewControllerAtIndex:(NSUInteger) index
{
    PageContentController *pageContentController;
    if (index == 0)
    {
        pageContentController = [self.storyboard instantiateViewControllerWithIdentifier:@"CaloriePage"];
    }
    else if (index == 1)
    {
        pageContentController = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinksPage"];
    }
    return pageContentController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create page view controller
    self.pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageController.dataSource = self;
    
    PageContentController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    //self.pageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageController];
    [self.view addSubview:_pageController.view];
    [self.pageController didMoveToParentViewController:self];
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 2;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
