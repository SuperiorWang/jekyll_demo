---
layout:default
title: IOS开发_实时监测网络
---

###检测当前网络环境
1.从Apple网站下载示例：[点此下载](https://developer.apple.com/library/ios/samplecode/Reachability/Reachability.zip)

2.将Reachability.h和Reachability.m拷贝到自己的项目中

3.连接状态发生变化时及时的通知用户
  
    修改AppDeleate中的代码  
    @implementation AppDelegate
    {
       Reachability *hostReach;
    }
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
    
      //监测网络状况
      [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reachabilityChanged:)
                                            name:kReachabilityChangedNotification  											 object:nil];
      hostReach = [Reachability reachabilityWithHostName:@"www.google.com"];
      [hostReach startNotifier];
    
      return YES;
    }

    - (void)reachabilityChanged:(NSNotification *)note
    {
      Reachability *curReach = [note object];
      NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
      NetworkStatus status = [curReach currentReachabilityStatus];
    
      if (status == NotReachable) {
          UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"AppName"
                                                       message:@"NotReachable"
                                                      delegate:nil 								cancelButtonTitle:@"YES" otherButtonTitles:nil];
        [alert show];
      }
    }
	
4.这样就可以在断开网络连接的时候出一个提示框了
