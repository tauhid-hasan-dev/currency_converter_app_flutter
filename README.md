# currency_converter

Read: https://medium.com/@hadiyaaamir222/lifecycle-of-a-stateful-widget-aece2d56c946
Watch: https://www.youtube.com/watch?v=_gIbneld-bw&ab_channel=FlutterCommunity

A new Flutter project.

// https://www.tcmb.gov.tr/kurlar/today.xml

# StatefulWidget Lifecycle Overview

This guide provides a detailed overview of the lifecycle of a `StatefulWidget` in Flutter, from creation to disposal. Understanding these steps is crucial for effective Flutter development, particularly in managing resources and maintaining performance.

## Table of Contents
- [1. Widget Creation](#1-widget-creation)
- [2. Initialization](#2-initialization)
- [3. Call super.initState()](#3-call-superinitstate)
- [4. Perform Custom Initialization](#4-perform-custom-initialization)
- [5. Widget Building](#5-widget-building)
- [6. Widget Updating](#6-widget-updating)
- [7. Widget Rebuilding](#7-widget-rebuilding)
- [8. Widget Removal](#8-widget-removal)
- [9. Disposing](#9-disposing)
- [10. Call super.dispose()](#10-call-superdispose)

### 1. Widget Creation
At this initial stage, the constructor of the widget is called. This is the phase where constants or final variables are initialized.

### 2. Initialization
The `initState()` method kicks in here. Set up the initial state, fetch initial data, and initialize any controllers or listeners necessary for the widget.

### 3. Call super.initState()
Within `initState()`, ensure to call `super.initState()` to execute the parent class's initialization procedures.

### 4. Perform Custom Initialization
Still in the `initState()`, perform any operations such as data fetching or setting up event listeners.

### 5. Widget Building
The `build()` method constructs the widget visually based on its current state. This method represents the widget in terms of simpler, often composite widgets.

### 6. Widget Updating
The widget updates when `setState()` is invoked due to events, interactions, or incoming data, causing the `build()` method to rerun and reflect state changes in the UI.

### 7. Widget Rebuilding
The widget continues to rebuild in response to state changes until it is deemed no longer needed.

### 8. Widget Removal
This step occurs when the widget is removed from the widget tree, such as when navigating away from a screen or it's no longer displayed by its parent.

### 9. Disposing
The `dispose()` method is called, marking the end of the widget's lifecycle. Here, clean up all resources like disposing controllers, detaching listeners, closing streams, and other necessary cleanup to prevent memory leaks.

### 10. Call super.dispose()
Finally, within the `dispose()` method, call `super.dispose()` to ensure that the base class's disposal mechanisms are executed.

Understanding and properly managing these lifecycle methods ensures efficient resource management and smooth user experiences in your Flutter applications.

