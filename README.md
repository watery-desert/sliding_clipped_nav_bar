<p align="center">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/sliding_clipped_nav_bar/package_cover.png" alt="Loading Animation Widget" />
</p>

<div align="center">

[![YouTube Badge](https://img.shields.io/badge/-YouTube-EA3223?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/waterydesert)
[![Twitter Badge](https://img.shields.io/badge/-Twitter-198CD8?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/watery_desert)
[![Patreon Badge](https://img.shields.io/badge/-Patreon-FF424D?style=for-the-badge&logo=patreon&logoColor=white)](https://www.patreon.com/watery_desert)
[![BMC Badge](https://img.shields.io/badge/-Buy_Me_a_Coffee-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=535353)](https://www.buymeacoffee.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/sliding_clipped_nav_bar.svg?style=for-the-badge)](https://pub.dev/packages/sliding_clipped_nav_bar)
[![WateryDesert](https://img.shields.io/badge/WateryDesert-Website-F8D977?style=for-the-badge)](https://waterydesert.com)
</div>
<hr>

## How to use?

Add `sliding_clipped_nav_bar:` to your `pubspec.yaml` dependencies then run `flutter pub get`

Add from git [Latest and experimental version]

```yaml
 dependencies:
  sliding_clipped_nav_bar:
    git:
      url: https://github.com/watery-desert/sliding_clipped_nav_bar  
```

Add from pub [Stable]

```yaml
 dependencies:
  sliding_clipped_nav_bar:
```

Then import the package to use

```dart 
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
```

Add `SlidingClippedNavBar()` to `bottomNavigationBar` property of `Scaffold()` and add `PageView()` to `body` with `NeverScrollableScrollPhysics()` don't try to upate the seleted index from `onPageChanged` or will see some weird behaviour. You can use `Stack()` or `AnimatedSwitcher()` for custom page transition animation.

<details>
  <summary>API reference</summary>
  <br>

  barItems → `List<BarItem>`
  - List of bar items that shows horizontally, Minimum 2 and maximum 4 items.\
  *required*

  selectedIndex → `int`
  - Selected index of the bar items.\
  *required*

  iconSize → `double`
  - Size of all icons (inactive items), don't make it too big or will be clipped.\
  *optional [30]*

  fontSize → `double`
  - FontSize of the text.\
  *optional [16]*

   fontWeight → `FontWeight`
  - FontWeight of the text.\
  *optional [FontWeight.bold]*

   fontStyle → `FontStyle`
  - FontStyle of the text.\
  *optional [null]*

  activeColor → `Color`
  - Color of the selected item which indicate selected.\
  *required*

  inactiveColor → `Color?`
  - Inactive color of item, which actually color icons.\
  *nullable* 

  onButtonPressed → `OnButtonPressCallback`
  - Callback when item is pressed.\
  *required* 

  backgroundColor → `Color`
  -  background color of the bar.\
  *optional [Colors.white]*
  </summary> 
</details>
<br>

## Design Credit & screen recording

[Toolbar icons animation by Cuberto](https://dribbble.com/shots/5605168-Toolbar-icons-animation)

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/sliding_clipped_nav_bar/demo_recording.gif"  width="280"/>


### **Do and don't**
 - Don't make icon size too big.
   - FontAwesomeIcons: 24 
   - MaterialIcons: 30

 - Using `SlidingClippedNavBar()` when you want global active and inactive color.
```dart
 return Scaffold(
     
      body: PageView(
      physics: NeverScrollableScrollPhysics(),       
      controller: controller,
...
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.event,
            title: 'Events',
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
          ),
           /// Add more BarItem if you want
        ],
      ),
    );
```

 - Using `SlidingClippedNavBar.colorful()` when you want to set individual item active & inactive color.
 ```dart
 return Scaffold(
     
      body: PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
...
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.event,
            title: 'Events',
            activeColor: Colors.amber,
            inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Colors.red,
            inactiveColor: Colors.green,
          ),
         /// Add more BarItem if you want

        ],
      ),
    );
```

### FAQ

- #### How do I change the height?

The height must be constant because the animation is in vertical direction. According to me 60 is perfect. But if you think needs to be reduced then please create an issue with a screenshot. I will see if I can do something.
- #### How do I add drop shadow?

Wrap `SlidingClippedNavBar` with `DecoratedBox` or `Container` and pass `BoxDecoration` to `decoration` property. `BoxDecoration` takes list of `boxShadow` there you can pass your drop shadow.
  ``` dart
  DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 8.0)
        ],
      ),
      child: SlidingClippedNavBar()
  )
  ```
- #### How do I change the corner radius of the navigation bar?

Wrap `SlidingClippedNavBar` with ClipRRect and pass `BorderRadius` to `borderRadius` property.
``` dart
  ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: SlidingClippedNavBar(
    )                
```


<br>
<details>
   <summary>All flutter packages</summary>
   <br>

  ➜ [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)\
  ● [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)\
  ● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)\
  ● [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)

   </summary> 
</details>
<br>

