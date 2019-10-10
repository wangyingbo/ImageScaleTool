# ImageScaleTool


## 根据图片比例缩放imageView

**ImageScaleTool地址：**
[https://github.com/wangyingbo/ImageScaleTool](https://github.com/wangyingbo/ImageScaleTool)

**预览图**

![gif](https://raw.githubusercontent.com/wangyingbo/ImageScaleTool/master/gif.gif)


---

**一共有三种方法：**
> + 约束最大的`width；`
> + 约束最大的`height；`
> + 约束最大的`size；`



- 当约束最大`width`时，宽固定，高度不限，高度会根据image的比例计算使图片不变形的最适合的高；当`imageView`原始的`width`小于`maxWidth`时，宽取`imageView`的宽；

		fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"v_pic"] maxWidth:250];
		
- 当约束最大`height`时，高度固定，宽度不限，宽度会根据image的比例计算使图片不变形的最适合的宽；当`imageView`原始的`height`小于`maxHeight`时，高取`imageView`的高；

		fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"h_pic"] maxHeight:200.f];
		
- 当约束最大`size`时，`width`和`height`都固定，`imageView`会根据image的比例算出最适合的size；当`imageView`原始的`size`小于`maxSize`时，最大`maxSize`取`imageView`的`size`；

		fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"v_pic"] maxSize:CGSizeMake(300, 200)];
		

---

