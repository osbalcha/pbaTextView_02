//
//  OutlineViewController.h
//  pbaTextView
//
//  Created by racso on 02/03/14.
//  Copyright (c) 2014 racso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OutlineViewController : NSOutlineView <NSOutlineViewDataSource, NSOutlineViewDelegate>
{
    NSDictionary *firstParent;
    NSDictionary *secondParent;
    NSArray *list;
    
}
@property (strong)IBOutlet NSOutlineView *miOutlineView;

@end
