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


