//
//  Kumulos.h
//  Kumulos
//
//  Created by Kumulos Bindings Compiler on Apr 28, 2016
//

#import <Foundation/Foundation.h>
#import "libKumulos.h"


@class Kumulos;
@protocol KumulosDelegate <kumulosProxyDelegate>
@optional

 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation createBooksDidCompleteWithResult:(NSNumber*)newRecordID;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation selectDataDidCompleteWithResult:(NSArray*)theResults;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation createUserDidCompleteWithResult:(NSNumber*)newRecordID;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation deleteUserDidCompleteWithResult:(NSNumber*)affectedRows;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation selectUserDidCompleteWithResult:(NSArray*)theResults;
 
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation updateUserDidCompleteWithResult:(NSNumber*)affectedRows;

@end

@interface Kumulos : kumulosProxy {
    NSString* theAPIKey;
    NSString* theSecretKey;
}

-(Kumulos*)init;
-(Kumulos*)initWithAPIKey:(NSString*)APIKey andSecretKey:(NSString*)secretKey;

   
-(KSAPIOperation*) createBooksWithID_Books:(NSString*)iD_Books andName_Books:(NSString*)name_Books andAuthors_Books:(NSString*)authors_Books andPrice_Books:(NSInteger)price_Books;
    
   
-(KSAPIOperation*) selectDataWithName_Books:(NSString*)name_Books andAuthors_Books:(NSString*)authors_Books andPrice_Books:(NSInteger)price_Books andID_Books:(NSString*)iD_Books;
    
   
-(KSAPIOperation*) createUserWithUsername:(NSString*)username andPassword:(NSString*)password andEmail:(NSString*)email;
    
   
-(KSAPIOperation*) deleteUserWithUsername:(NSString*)username andPassword:(NSString*)password;
    
   
-(KSAPIOperation*) selectUserWithUsername:(NSString*)username;
    
   
-(KSAPIOperation*) updateUserWithPassword:(NSString*)password andUsername:(NSString*)username andEmail:(NSString*)email;
    
            
@end