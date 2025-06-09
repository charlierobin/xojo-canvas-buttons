# Button class based on built-in Canvas control

Very similar to the example(s) that ship with Xojo, except that those don’t show how to “track” the mouse pointer like standard system buttons.

This control responds in the (generally) accepted manner, handling a click in the bounding rect and then rolling out with the mouse button still down, clicking and then moving out (MouseExit) and then moving back in, and handling the mouse up correctly: when rolled out no action triggered, when still within bounds does trigger action.

Also adds a few custom events to assist with control painting. The original native `Paint( g as Graphics etc )` is replaced with:

`PrePaint_Normal( g As Graphics, areas() As REALbasic.Rect )` for setting up `g` in preparation for a “normal” paint pass (also checking if `enabled` is true or false, and drawing the control differently depending on the result)

`PrePaint_RolledOver( g As Graphics, areas() As REALbasic.Rect )` for setting up `g` in preparation for a paint pass when the button has been moused over

`PrePaint_MouseDown( g As Graphics, areas() As REALbasic.Rect )` for setting up `g` in preparation for a pass when the mouse button has been clicked down over the button

`Paint_Common( g As Graphics, areas() As REALbasic.Rect )` as the actual painting routine using whatever colours etc have been set-up in the pre-passes

All this is in the `CanvasButton` base class. The simple caption button in the test window is subclassed from that, showing how to use it as a simple jumping off point for more complicated buttons.

![Screenshot of states](/screenshots/image.jpg)

# Notes as of 9th June 2025

There's now an excellent series of three blog posts on the Xojo website which go into a lot of great detail about creating a custom button control in Xojo using the canvas control:

[How To Create a Custom Button Control in Xojo](https://blog.xojo.com/2025/05/02/how-to-create-a-custom-button-control-in-xojo/)

[How To Create a Custom Button Control in Xojo – Part 2](https://blog.xojo.com/2025/05/14/how-to-create-a-custom-button-control-in-xojo-part-2/)

[How To Create a Custom Button Control in Xojo – Part 3: Make Your Controls Inspector-Friendly](https://blog.xojo.com/2025/05/28/how-to-create-a-custom-button-control-in-xojo-part-3-make-your-controls-inspector-friendly/)

Highly recommended!

(And also the [Github repository](https://github.com/xolabsro/CanvasButton) from where you can get the source files for the above blogposts.)
