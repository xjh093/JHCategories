# UIView-JHCategory

## 1.Set view's Frame from a string.
## 2.A quick method to set view's Property.



# 1.Set view's Frame from a string.
## example0: the beginning.
```objc
UIView *view1 = [[UIView alloc] init];

//usually
view1.frame = CGRectMake(20,20,40,20);

//now
view1.frame = [self.view jhRectFromString:@"[x:20,y:20,w:40,h:20]"];
```

## example1: set view's width is half of ther screen.
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


## more methods, find yourself.


# 2.A quick method to set view's Property.

