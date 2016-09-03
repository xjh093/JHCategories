# UIView-JHCategory

* 1.Set view's Frame from a string.
* 2.A quick method to set view's Property.

---------------------------------------------------------------
## 1.Set view's Frame from a string.
### example0: the beginning.
```objc
UIView *view1 = [[UIView alloc] init];

//usually
view1.frame = CGRectMake(20,20,40,20);

//now
view1.frame = [self.view jhRectFromString:@"[x:20,y:20,w:40,h:20]"];
```

### example1: set view's width is half of ther screen.
```objc
UIView *view1 = [[UIView alloc] init];

//usually
view1.frame = CGRectMake(0,20,self.view.frame.size.width/2,20);

//now
view1.frame = [self.view jhRectFromString:@"[x:0,y:20,w:2_w(0),h:30]"];
//self.view's tag is 0.
```

### example2: put view1 at the center of self.view.
```objc
//view1's width is 50,height is 50.
UIView *view1 = [[UIView alloc] init];

//usually
view1.frame = CGRectMake((self.view.frame.size.width - 50)/2,(self.view.frame.size.height - 50)/2,50,50);

//now
view1.frame = [self.view jhRectFromString:@"[x:2_w(0)-25,y:2_h(0)-25,w:50,h:50]"];
```


### more methods, find yourself.

---------------------------------------------------------------
## 2.A quick method to set view's Property.
### example0: view.
```objc
    UIView *view = [[UIView alloc] init];
    
    //usually
    view.frame = CGRectMake(20,40,50,30);
    view.backgroundColor = [UIColor redColor];
    view.layer.borderWidth = 2;
    view.layer.borderColor = [UIColor blueColor].CGColor;
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    view.tag = 5;
    
    //now
    view.jh_addToView(self.view).jh_frame(@"[x:20,y:40,w:50,h:30]").jh_bgColor([UIColor redColor]).jh_bdWidth(@(2)).jh_bdColor([UIColor blueColor]).jh_cnRadius(@(5)).jh_mtBounds(@(YES)).jh_tag(@(5));
    
```

### example1: label.
```objc
    UILabel *label = [[UILabel alloc] init];
    label.jh_addToView(self.view).jh_frame(@"[x:20,y:40,w:150,h:30]").jh_text(@"label").jh_color(@"0xa2s3f4").jh_font(@"s15").jh_bgColor(@"0xb1d10a").jh_align(@(1)).jh_adjust(@(YES)).jh_lines(@(0)).jh_bdWidth(@(1)).jh_bdColor([UIColor blueColor]).jh_cnRadius(@(5)).jh_mtBounds(@(YES)).jh_tag(@(5));
    
```

### example2: button.
```objc
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.jh_addToView(self.view).jh_frame(@"[x:20,y:80,w:150,h:30]").jh_title(@"button").jh_color(@"0x1a2b3c").jh_bgColor(@"0xa1b2c3").jh_cnRadius(@(5)).jh_font(@"s17").jh_target_selector_event(self,@"jhButton",@(UIControlEventTouchUpInside));
```

### notice: jh_addToView should be called before jh_frame.
* more support: textField,textView,tableView,scrollView.
* need more, do it yourself.
