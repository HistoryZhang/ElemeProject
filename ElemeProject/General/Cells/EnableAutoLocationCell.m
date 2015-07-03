//
//  EnableAutoLocationCell.m
//
//
//  Created by Sam Lau on 6/17/15.
//
//

#import "EnableAutoLocationCell.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>
#import "UserPreferences.h"


@implementation EnableAutoLocationCell

#pragma mark - Views hierarchy and layout
- (void)addSubviews
{
    [self addSubview:self.enableCurrentLocationLabel];
    [self addSubview:self.enableLocationSwitch];
    
    // when enableLocationSwitch change state
    [self.enableLocationSwitch.rac_newOnChannel subscribeNext:^(id on) {
        if ([on boolValue]) {
            [UserPreferences enableAutoLocation];
        }
        else {
            [UserPreferences disableAutoLocation];
        }
    }];
}

- (void)defineLayout
{
    [self.enableCurrentLocationLabel mas_remakeConstraints:^(MASConstraintMaker* make) {
        make.left.equalTo(self).with.offset(15);
        make.centerY.equalTo(self);
    }];

    [self.enableLocationSwitch mas_makeConstraints:^(MASConstraintMaker* make) {
        make.right.equalTo(self).with.offset(-15);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - Views Lazy Initialization
- (UILabel*)enableCurrentLocationLabel
{
    if (!_enableCurrentLocationLabel) {
        _enableCurrentLocationLabel = [UILabel new];
        _enableCurrentLocationLabel.text = @"启动时，自动定位到当前位置";
        _enableCurrentLocationLabel.font = [UIFont systemFontOfSize:16.0];
    }

    return _enableCurrentLocationLabel;
}

- (UISwitch*)enableLocationSwitch
{
    if (!_enableLocationSwitch) {
        _enableLocationSwitch = [UISwitch new];
        _enableLocationSwitch.on = [UserPreferences isAutoLocation];
    }

    return _enableLocationSwitch;
}



@end
