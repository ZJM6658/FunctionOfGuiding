# FunctionOfGuiding

提供一个需要局部抠图的功能引导遮罩实现方法


![示例](https://github.com/ZJM6658/FunctionOfGuiding/blob/master/img/example.png?raw=true&alt="example.png")

####Api摘要：

```
/** 是否以椭圆形式展现 默认是NO */
@property (nonatomic) BOOL forEllipseType;
/** 设置需要挖取的rect */
@property (nonatomic) CGRect cropRect;
/** 设置marginSize对需要挖取的rect进行扩大 */
@property (nonatomic) CGSize marginSize;
/** 挖取出来之后放置的位置 如果有需求放在某个地方，隐藏时动画到目的位置，可以增加显示/隐藏时的动画函数 */
@property (nonatomic) CGPoint placePoint;

```

####详情请下载示例代码查看。
