# sliding_clipped_nav_bar

Navigation bar inspired by Toolbar-icons-animation (designed by Cuberto).

## Demo Screen Recording
<img src="https://github.com/watery-desert/assets/blob/main/sliding_clipped_nav_bar/screen_recording.gif?raw=true"  width="300"/>

## **Design Credit**

<img src="https://github.com/watery-desert/assets/blob/main/sliding_clipped_nav_bar/credit_video.gif?raw=true"  width="500"/>

[Toolbar icons animation by Cuberto](https://dribbble.com/shots/5605168-Toolbar-icons-animation)

### Disclaimer
The bar height is taller than normal and might not be suitable for small devices. Also don't make the icon size too big or they will be clipped. 

## API reference

barItems → `List<BarItem>`
- List of bar items that shows horizontally.\
 *required*

selectedIndex → `int`
- Selected index of the bar items.\
 *required*

iconSize → `double`
 - Size of all icons (inactive items), don't make it too big or will be clipped.\
 *optional [30]*

activeColor → `Color`
 - Color of the selected item which indicate selected.\
*optional [const Color(0xFF01579B)]*

inactiveColor → `Color?`
 - Inactive color of item, which actually color icons.\
*nullable* 

onButtonPressed → `OnButtonPressCallback`
 - Callback when item is pressed.\
*required* 

backgroundColor → `Color`
 -  background color of the bar.\
*optional [Colors.white]*

### **Suitable icon size**
 - FontAwesomeIcons: 24
 - MaterialIcons: 30

Feel free to report issue even if you are using a another icon pack and see some problem.

Check the example app the implementation is pretty straightforward.

Please consider giving me star and see my other repositories. This will motivate me to keep working.


### Follow me on social media
[Instagram](https://www.instagram.com/watery_desert)

[Twitter](https://www.twitter.com/watery_desert)