//
//  WXImageDownloader.m
//  WeexDemo
//
//  Created by hjc on 2017/2/16.
//  Copyright © 2017年 hehe. All rights reserved.
//

#import "WXImageDownloader.h"
#import <SDWebImage/SDWebImageManager.h>

@implementation WXImageDownloader

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url
                                          imageFrame:(CGRect)imageFrame
                                            userInfo:(NSDictionary *)options
                                           completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock {
    return (id<WXImageOperationProtocol>)
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url]
                                                        options:0
                                                       progress:^(NSInteger receivedSize, NSInteger expectedSize)
        {
                                                           
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL)
        {
            if (completedBlock) {
                completedBlock(image, error, finished);
            }
        }];
}

@end
