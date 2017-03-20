# AnimatedBorder
This is a category on a `UIView`. Just directly drag and drop it into your project to use it. It has 2 properties that you can set using either code or from the storyboard. It animatedly draws and clears the border applied on any `UIView` (since its a category, it will work on any views that inherit from `UIView`).

## To create the border:

In your `viewDidAppear` just call `[mainView createBorder];`. This will create a border but it will **not** draw it on the UI. This just creates the boder i.e sets its bounds and what not. 

###### To animatedly show the border on button action or whatever:`[mainButton startDrawingBorder];` 
###### And to clear the border: `[mainButton clearBorder];`

There are two properties that you can set, they are:

    @property (strong, nonatomic) IBInspectable UIColor *borderColor;
    @property (assign, nonatomic) IBInspectable CGFloat borderWidth;


You can either set them using code or using storyboard. (If anything is still unclear just download the sample project)
