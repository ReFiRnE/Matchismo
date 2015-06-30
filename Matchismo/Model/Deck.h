//
//  Deck.h
//  Matchismo
//
//  Created by deus4 on 15/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
