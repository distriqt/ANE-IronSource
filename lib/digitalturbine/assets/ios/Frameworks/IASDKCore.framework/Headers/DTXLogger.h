//
//  DTXLogger.h
//  IASDKCore
//
//  Created on 15/06/2021.
//  Copyright © 2022 Digital Turbine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DTXLogLevel) {
    /**
    @brief Disabled.
    */
    DTXLogLevelOff = 0,
    
    /**
    @brief Includes system-level or multi-process information when reporting system errors
    */
    DTXLogLevelFault = 1,
    
    /**
    @brief Includes process-level errors
    */
    DTXLogLevelError = 2,
    
    /**
    @brief Includes info, error fault logging.
     */
    DTXLogLevelInfo = 3,
    
    /**
    @brief Includes debug information, and all types of logging.
     */
    DTXLogLevelDebug = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface DTXLogger : NSObject

+ (void)setLogLevel:(DTXLogLevel)logLevel;

@end

NS_ASSUME_NONNULL_END
