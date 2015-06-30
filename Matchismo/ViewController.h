//
//  ViewController.h
//  Matchismo
//
//  Created by deus4 on 15/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController
- (Deck *)createDeck;
- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;
- (void)updateUI;
@property (weak, nonatomic) IBOutlet UILabel *flipDescription;
@property (strong, nonatomic) NSMutableArray *flipHistory;

@end
