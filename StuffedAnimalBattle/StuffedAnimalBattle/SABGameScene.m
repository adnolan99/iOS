//
//  SABGameScene.m
//  StuffedAnimalBattle
//
//  Created by Austin Nolan on 5/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "SABGameScene.h"

@interface SABGameScene  () <SKPhysicsContactDelegate>

@end


@implementation SABGameScene
{
    SKLabelNode * timerLabel;
    
    SKSpriteNode * player1HPBar;
    SKSpriteNode * player2HPBar;
    
    SKSpriteNode * buttonA;
    SKSpriteNode * buttonB;

    SKSpriteNode * dpadUp;
    SKSpriteNode * dpadDown;
    SKSpriteNode * dpadLeft;
    SKSpriteNode * dpadRight;
    
    SKSpriteNode * player1;
    SKSpriteNode * player2;
    
    SKSpriteNode * fist;
    SKSpriteNode * foot;

    SKTextureAtlas * charAtlas;
    
    
    float barArea;
    
    float currentBarArea;

}

/*
Homework--
-add health points for players
-make the HP bar represent HP points per player
-make fireball remove HP points
-add sound effects to explosion & landing after jumping
 -player faces the last direction you moved
 
 research sprite characters (how their designed, what they look like)
 find pictures for our characters & put them on the characters (PNG)
 
 
 
 */


- (instancetype)initWithSize:(CGSize)size
{
    
        
        self = [super initWithSize:size];
        if (self)
    {

//        
//        SKPhysicsBody * scenePhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        
        self.physicsWorld.contactDelegate = self;
        
        timerLabel = [SKLabelNode node];
        timerLabel.position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT - 30);
        timerLabel.text = @"00:00";
        timerLabel.fontColor = [SKColor greenColor];
        timerLabel.fontSize = 16.0;
        [self addChild:timerLabel];
        self.backgroundColor = [UIColor yellowColor];
        barArea = ((SCREEN_WIDTH - 60) /2.0) - 20;
        
        currentBarArea = barArea;
        
        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
        
        floor.position = CGPointMake(SCREEN_WIDTH /2.0, 15);
        
        [self addChild:floor];
        
        SKPhysicsBody * floorPhysics = [ SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floorPhysics.affectedByGravity = NO;
        floorPhysics.dynamic = NO;
        floor.physicsBody = floorPhysics;
        
        
        SKSpriteNode * step1 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(50, 30)];
        step1.position = CGPointMake(300, 200);
        [self addChild:step1];
        SKPhysicsBody * step1Physics = [ SKPhysicsBody bodyWithRectangleOfSize:step1.size];
        step1Physics.affectedByGravity = NO;
        step1Physics.dynamic = NO;
        step1.physicsBody = step1Physics;
        
        
        SKSpriteNode * step2 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(50, 30)];
        step2.position = CGPointMake(350, 250);
        [self addChild:step2];
        SKPhysicsBody * step2Physics = [ SKPhysicsBody bodyWithRectangleOfSize:step2.size];
        step2Physics.affectedByGravity = NO;
        step2Physics.dynamic = NO;
        step2.physicsBody = step2Physics;
        
        SKSpriteNode * step3 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(50, 30)];
        step3.position = CGPointMake(400, 300);
        [self addChild:step3];
        SKPhysicsBody * step3Physics = [ SKPhysicsBody bodyWithRectangleOfSize:step3.size];
        step3Physics.affectedByGravity = NO;
        step3Physics.dynamic = NO;
        step3.physicsBody = step3Physics;
        
        SKSpriteNode * step4 = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(400, 30)];
        step4.position = CGPointMake(650, 350);
        [self addChild:step4];
        SKPhysicsBody * step4Physics = [ SKPhysicsBody bodyWithRectangleOfSize:step4.size];
        step4Physics.affectedByGravity = NO;
        step4Physics.dynamic = NO;
        step4.physicsBody = step4Physics;
        
        
        
        
        player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(barArea, 30)];
        
        player1HPBar.position = CGPointMake((barArea + 20) / 2.0, SCREEN_HEIGHT - 20.0);
        
        [self addChild:player1HPBar];

        
        
        
        player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(barArea, 30)];
        
        player2HPBar.position = CGPointMake(SCREEN_WIDTH - (barArea + 20) / 2.0, SCREEN_HEIGHT - 20.0);
        
        [self addChild:player2HPBar];
        
//        buttonA = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
//        buttonA.position = CGPointMake(SCREEN_WIDTH - 40, 80);
//        [self addChild:buttonA];
//
//        buttonB = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
//        buttonB.position = CGPointMake(SCREEN_WIDTH - 80, 40);
//        
//        
//        [self addChild:buttonB];
//        
//        
//        
//        
//        dpadDown = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
//        dpadDown.position = CGPointMake(80, 40);
//        [self addChild:dpadDown];
//        dpadUp = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
//        dpadUp.position = CGPointMake(80, 120);
//        [self addChild:dpadUp];
//        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
//        dpadRight.position = CGPointMake(120, 80);
//        [self addChild:dpadRight];
//        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
//        dpadLeft.position = CGPointMake(40, 80);
//        [self addChild:dpadLeft];
        
        
        //player1 = [SKSpriteNode spriteNodeWithImageNamed:@"Popeye"];

        charAtlas = [SKTextureAtlas atlasNamed:@"char"];
        
        player1 = [SKSpriteNode spriteNodeWithImageNamed:@"charframe1"];

        
        
        
        
        
        //player1 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];

        player1.position = CGPointMake(SCREEN_WIDTH / 5.0, 100);
        [self addChild:player1];
        SKPhysicsBody * player1Physics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        player1.physicsBody = player1Physics;
        

        
        player2 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
        
        //player2 = [SKSpriteNode spriteNodeWithImageNamed:@"Bluto"];

        player2.position = CGPointMake(SCREEN_WIDTH -100, 100);
        [self addChild:player2];
        SKPhysicsBody * player2Physics = [SKPhysicsBody bodyWithRectangleOfSize:player2.size];
        //player2.physicsBody.contactTestBitMask = 1;
        player2.physicsBody = player2Physics;
        player2.userData = [@{@"type" : @"player2"} mutableCopy];
        
        //fist = [SKSpriteNode spriteNodeWithColor:[SKColor grayColor] size:CGSizeMake(20,20)];
        //fist.position = CGPointMake(15, 15);
        //[player1 addChild:fist];
        
        
        //foot = [SKSpriteNode spriteNodeWithColor:[SKColor grayColor] size:CGSizeMake(20,20)];
        //foot.position = CGPointMake(15, -40);
        //[player1 addChild:foot];

        
    }
    
    return self;
}

-(void)update:(NSTimeInterval)currentTime
{
    
    
}



-(void)didBeginContact:(SKPhysicsContact *)contact
{
    NSLog (@"%@",contact.bodyA.node.userData[@"type"]);
    NSLog (@"%@",contact.bodyB.node.userData[@"type"]);

    NSArray * nodes = @[contact.bodyA.node,contact.bodyB.node];
    
    for (SKNode * node in nodes)
    {
        if ([node.userData[@"type"] isEqualToString:@"fireball"])
        {
            [node removeFromParent];
        
            
            
            NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"Explosion" ofType:@"sks"];
        
            SKEmitterNode * explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
            
            explosion.position = contact.contactPoint;
            
            explosion.numParticlesToEmit = 500;
            [self addChild:explosion];
            
            
            
            
            currentBarArea -= 20;
            

//            [player1HPBar removeFromParent];
//            player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake((currentBarArea), 30)];
//            player1HPBar.position = CGPointMake((barArea + 20) / 2.0, SCREEN_HEIGHT - 20.0);
//            [self addChild:player1HPBar];
            
            [player2HPBar removeFromParent];
            player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake((currentBarArea), 30)];
            player2HPBar.position = CGPointMake(SCREEN_WIDTH - (barArea + 20) / 2.0, SCREEN_HEIGHT - 20.0);
            [self addChild:player2HPBar];

            
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];

    CGPoint location = [touch locationInNode:self];

//    NSLog(@"%f, %f",location.x, location.y);
//    
//    NSLog(@"%u",[buttonA containsPoint:location]);
    
    
    
    
    
    //[self testButtonsWithLocation:location];
    
}


- (void)buttonAClick: (UIButton *)sender;
{
    
    NSLog(@"Punch");
    
    //                    SKSpriteNode * fireBall = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(10,10)];
    
    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"Fire" ofType:@"sks"];
    
    SKEmitterNode * fireBall = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    
    fireBall.position = CGPointMake(player1.position.x +30, player1.position.y -10);
    
    SKPhysicsBody * fireBallPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10,10)];
    
    fireBall.physicsBody = fireBallPhysics;
    
    fireBall.physicsBody.contactTestBitMask = 1;
    
    fireBall.userData = [@{@"type" : @"fireball"} mutableCopy];
    
    fireBallPhysics.affectedByGravity = NO;
    
    [self addChild:fireBall];
    
    [fireBall.physicsBody  applyImpulse:CGVectorMake(3.0, 0.0)];
    

    
    
    
    
    
    
    NSLog(@"%@",sender);
}
- (void)buttonBClick: (UIButton *)sender;
{
    
    NSLog(@"%@",sender);
}
- (void)upClick: (UIButton *)sender;
{
    
    NSMutableArray * textures = [@[] mutableCopy];
    
    for (int i = 1; i < charAtlas.textureNames.count; i++)
    {
        
        [textures addObject:[charAtlas textureNamed:
                             [NSString stringWithFormat:@"charframe%d",i]]];
        
        NSLog(@"charframe%d",i);
    }
    
    
    SKAction * setFrame2 = [SKAction animateWithTextures:textures timePerFrame:0.2];
    [player1 runAction:setFrame2];
    
    
    // SKAction * move = [SKAction moveToY:(player1.position.y + 200) duration:0.1];
    //[player1 runAction:move];
    
    [player1.physicsBody applyImpulse:CGVectorMake(0.0, 150.0)];
    
    
    
    NSLog(@"%@",sender);
}
- (void)downClick: (UIButton *)sender;
{
    
    NSLog(@"Duck");
    SKAction * move = [SKAction moveToY:(player1.position.y - 20) duration:0.1];
    [player1 runAction:move];

    NSLog(@"%@",sender);
}
- (void)leftClick: (UIButton *)sender;
{
    
    NSLog(@"Move Left");
    //                    SKAction * move = [SKAction moveToX:(player1.position.x - 5) duration:0.1];
    //                    [player1 runAction:move];
    
    
    [player1.physicsBody applyImpulse:CGVectorMake(-20.0, 0.0)];
    
    
    
    NSLog(@"%@",sender);
}
- (void)rightClick: (UIButton *)sender;
{
    
    
    NSLog(@"Move Right");
    
    [player1.physicsBody applyImpulse:CGVectorMake(20.0, 0.0)];
    
    
    
    //                    SKAction * move = [SKAction moveToX:(player1.position.x + 5) duration:0.1];
    //                    [player1 runAction:move];
    
    
    NSLog(@"%@",sender);
}



//-(void)testButtonsWithLocation:(CGPoint)location
//{
//    NSArray * buttons = @[buttonA, buttonB, dpadUp,dpadDown,dpadLeft, dpadRight];
//    
//    for(SKNode * button in buttons)
//    {
//        if ([button containsPoint:location])
//        {
//            switch ([buttons indexOfObject:button])
//            {
//                case 0:
//                {
//
////                    NSLog(@"Punch");
////                    
//////                    SKSpriteNode * fireBall = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(10,10)];
////                    
////                    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"Fire" ofType:@"sks"];
////                    
////                    SKEmitterNode * fireBall = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
////                    
////                    fireBall.position = CGPointMake(player1.position.x +30, player1.position.y -10);
////                    
////                    SKPhysicsBody * fireBallPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10,10)];
////
////                    fireBall.physicsBody = fireBallPhysics;
////                    
////                    fireBall.physicsBody.contactTestBitMask = 1;
////
////                    fireBall.userData = [@{@"type" : @"fireball"} mutableCopy];
////                    
////                    fireBallPhysics.affectedByGravity = NO;
////                    
////                    [self addChild:fireBall];
////
////                    [fireBall.physicsBody  applyImpulse:CGVectorMake(3.0, 0.0)];
////
////                    
//////                    SKAction * move = [SKAction moveToX:(fist.position.x + 20) duration:0.1];
//////                    SKAction * retract = [SKAction moveToX:(fist.position.x - 20) duration:0.1];
//////                    [fist runAction:move];
//////                    fist runAction:retract];
////                }
//                    break;
//                case 1:
//                {
//                    NSLog(@"Kick");
//                    [foot.physicsBody applyImpulse:CGVectorMake(50.0, 50.0)];
//
//                    
//                }
//                    break;
//                    
//                case 2:
//                {
//                    NSLog(@"Jump");
//                   
////                    for (NSString * textureName in charAtlas.textureNames)
////                    {
////                        
////                        NSLog(@"%@",textureName);
////                    }
//                    
//                    
//                    NSMutableArray * textures = [@[] mutableCopy];
//                    
//                    for (int i = 1; i < charAtlas.textureNames.count; i++)
//                    {
//                        
//                       [textures addObject:[charAtlas textureNamed:
//                                            [NSString stringWithFormat:@"charframe%d",i]]];
//                        
//                        NSLog(@"charframe%d",i);
//                    }
//                    
//                    
//                    SKAction * setFrame2 = [SKAction animateWithTextures:textures timePerFrame:0.2];
//                    [player1 runAction:setFrame2];
//                    
//                    
//                    // SKAction * move = [SKAction moveToY:(player1.position.y + 200) duration:0.1];
//                    //[player1 runAction:move];
//                    
//                    [player1.physicsBody applyImpulse:CGVectorMake(0.0, 150.0)];
//                
//                }
//                    break;
//                case 3:
//                {
//                    NSLog(@"Duck");
//                    SKAction * move = [SKAction moveToY:(player1.position.y - 20) duration:0.1];
//                    [player1 runAction:move];
//                }
//                    break;
//                case 4:
//                {
//                    NSLog(@"Move Left");
////                    SKAction * move = [SKAction moveToX:(player1.position.x - 5) duration:0.1];
////                    [player1 runAction:move];
//                    
//                    
//                    [player1.physicsBody applyImpulse:CGVectorMake(-20.0, 0.0)];
//
//                }
//                    break;
//                case 5:
//                {
//                    NSLog(@"Move Right");
//                    
//                    [player1.physicsBody applyImpulse:CGVectorMake(20.0, 0.0)];
//
//                    
//                    
////                    SKAction * move = [SKAction moveToX:(player1.position.x + 5) duration:0.1];
////                    [player1 runAction:move];
//                }
//                    break;
//            }
//        }
//    }
//}

@end
