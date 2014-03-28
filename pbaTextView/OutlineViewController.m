//
//  OutlineViewController.m
//  pbaTextView
//
//  Created by racso on 02/03/14.
//  Copyright (c) 2014 racso. All rights reserved.
//

#import "OutlineViewController.h"

@implementation OutlineViewController


-(id)init
{
    if (self = [super init]) {
        firstParent = [[NSDictionary alloc]initWithObjectsAndKeys:@"Oscar", @"parent", [NSArray arrayWithObjects:@"Arturo", @"Julia", nil],@"children", nil];
        
        secondParent = [[NSDictionary alloc]initWithObjectsAndKeys:@"Julia", @"parent", [NSArray arrayWithObjects:@"Jammie", @"Kate", nil],@"children", nil];
        
        list = [NSArray arrayWithObjects:firstParent, secondParent, nil];

    }
    return self;
}

//-(void)dealloc
//{
//    
//}

-(BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isKindOfClass:[NSDictionary class]] || [item isKindOfClass:[NSArray class]]) {
        return YES;
    } else {
        return NO;
    }
}

-(NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [list count];
    }
    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"]count];
    }
    return 0;
}

-(id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item
{
    if (item == nil) {
        return [list objectAtIndex:index];
    }
    if ([item isKindOfClass:[NSDictionary class]]) {
        return [[item objectForKey:@"children"]objectAtIndex:index];
    }
    return nil;
}

-(id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
    if ([[tableColumn identifier]isEqualToString:@"children"]) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [NSString stringWithFormat:@"%li nenes",[[item objectForKey:@"children"]count]];
        }
        return item;
    } else {
        if ([item isKindOfClass:[NSDictionary class]]) {
            return [item objectForKey:@"parent"];
        }
    }
    return  nil;
}
-(id)objectInMiOutlineViewAtIndex:(NSUInteger)index
{
    id selectedcosa = [self.miOutlineView itemAtRow:[self.miOutlineView selectedRow]];
    NSLog(@"%@", selectedcosa);
    return selectedcosa;
}
- (void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(notification.description);
}

@end
