//
//  CardGameViewController.m
//  Matchismo
//
//  Created by deus4 on 30/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@end

@implementation CardGameViewController
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end