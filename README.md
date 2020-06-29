# SKPicker
A SpriteKit base Picker control writen with Swift

In iOS development, UIKit provides a powerful UI feature, picker controls with UIPickerView/UIPickerViewDelegate/UIPickerViewDataSource class/protocols. But this powerful UI feature cannot be used directly and conveniently in iOS game development with SpriteKit framework.

SKPicker is a picker control class created in Swift and SpriteKit framework for SpriteKit base iOS game development. 
 

SKPicker is a derived class from SKSpriteNode. As placeholder, SKPicker classes’ children contain and render picker data items. The data item supports either image data or text data. 

Same as UIKit picker control, the SKPicker child node located in control center position is set as the selected item. The SKPicker control support vertical or Horizontal layout. The SKPicker’s child node renders the data item by scaling the boundary rectangle’s height if vertical layout or width if horizontal layout. The child boundary rectangle height or width scale factor is calculated based on child node Y position if vertical or X position if horizontal offsets from the picker center position. The scale algorithm is based on the human eye view field projection on the round surface representing the picker, the scale factor is the sine value of the virtual angle rotating from picker center position timing with the virtual radius of the picker control; the virtual radius of picker control is the half value of picker control height if vertical or the width if horizontal.

In SKPicker class, the layout of either vertical or horizontal can be determined by the property of “layout”, the property value of “.vertical” sets SKPicker control object to vertical layout, “.horizontal” sets control to horizontal layout.

In SKPicker class, the property of “displayItems” controls the SKPicker control regular display item numbers, usually SKPicker control displays odd numbers of items, even developer sets “displayItems” property to even number, the SKPicker class will automatically increment “displayItems” property value by one to odd number.

In SKPicker class, the property of “itemSteps” control the SKPicker spinning speed.

In SKPicker class, the property of “selection” provides current selected item index or change current selected item.

In SKPicker class, there are some read-only properties indication the SKPicker control real time status.
      
The protocol of SKPickerHost is a delegate of SKPicker class which allow SKPicker object’s user is able to be notified and response SKPicker object status change.
