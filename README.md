# CureDemo

#CAMediaTimingFunction

```
@interface CAMediaTimingFunction : NSObject <NSCoding>
{
@private
  struct CAMediaTimingFunctionPrivate *_priv;
}

/* A convenience method for creating common timing functions. The
 * currently supported names are `linear', `easeIn', `easeOut' and
 * `easeInEaseOut' and `default' (the curve used by implicit animations
 * created by Core Animation). */

+ (instancetype)functionWithName:(NSString *)name;

/* Creates a timing function modelled on a cubic Bezier curve. The end
 * points of the curve are at (0,0) and (1,1), the two points 'c1' and
 * 'c2' defined by the class instance are the control points. Thus the
 * points defining the Bezier curve are: '[(0,0), c1, c2, (1,1)]' */

+ (instancetype)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;

- (instancetype)initWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;

/* 'idx' is a value from 0 to 3 inclusive. */

- (void)getControlPointAtIndex:(size_t)idx values:(float[2])ptr;

@end
```

有3个初始化的函数。

- functionWithName: 有5个name
- - kCAMediaTimingFunctionLinear	 匀速
- - kCAMediaTimingFunctionEaseIn	 开始慢，结束快
- - kCAMediaTimingFunctionEaseOut	 开始快，结束慢
- - kCAMediaTimingFunctionEaseInEaseOut 开始慢，结束慢
- - kCAMediaTimingFunctionEaseInEaseOut 开始慢，结束慢
- - kCAMediaTimingFunctionDefault	 系统大部分使用的function
- functionWithControlPoints: 大致c1y越大，开始速度越快，c2y越小，结束速度越快

可以使用[A Mac OS X app to help you design CAMediaTimingFunction curves](https://github.com/simonwhitaker/tween-o-matic)，更直观查看c1，c2点对速度的影响。