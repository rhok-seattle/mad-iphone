//
//  DamageReport.h
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright 2010 Robot Co-op. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface DamageReport :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * middleName;
@property (nonatomic, retain) NSString * addressState;
@property (nonatomic, retain) NSString * addressStreet;
@property (nonatomic, retain) NSString * addressCity;
@property (nonatomic, retain) NSString * addressCounty;
@property (nonatomic, retain) NSString * lastName;

@end



