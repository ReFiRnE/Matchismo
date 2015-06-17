//
//  ViewController.m
//  Matchismo
//
//  Created by deus4 on 15/06/15.
//  Copyright (c) 2015 deus4. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
//Prop Deck

@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (nonatomic, strong) Deck *deck;
@end

@implementation ViewController
- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
        self.flipCount = 0;
    }
    return _deck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", flipCount];
    //    NSLog(@"flipCount = %d", flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        Card *nextCard = [self.deck drawRandomCard];
        self.flipCount++;
        if (nextCard) {
            [self.deck addCard:nextCard];
        } else {
            sender.hidden = YES;
        }
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self touchCardButton:self.cardButton];
    self.flipCount = 0;
}

@end
