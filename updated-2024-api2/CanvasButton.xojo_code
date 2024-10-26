#tag Class
Protected Class CanvasButton
Inherits DesktopCanvas
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  me.mousedDown = true
		  
		  me.Refresh()
		  
		  RaiseEvent MouseDown( X, Y )
		  
		  return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  if X >= 0 and X <= me.Width and Y >= 0 and Y <= me.Height then
		    
		    me.rolledOver = true
		    
		  else
		    
		    me.rolledOver = false
		    
		  end if
		  
		  me.Refresh()
		  
		  RaiseEvent MouseDrag( X, Y )
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  // on Windows, a MouseEnter fires when the mouse has been clicked on another button, 
		  // and then (with the button still depressed) the cursor is moved over the canvas button.
		  // As pointed out this is not how a "standard" button should behave (and is different from 
		  // Xojo on Macintosh), hence the check below
		  
		  #if TargetWindows then
		    
		    if System.MouseDown then
		      
		      if not me.mousedDown then return
		      
		    end if
		    
		  #endif
		  
		  if not me.Enabled then return
		  
		  me.rolledOver = true
		  
		  me.Refresh()
		  
		  RaiseEvent MouseEnter
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  me.rolledOver = false
		  
		  me.Refresh()
		  
		  RaiseEvent MouseExit
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  me.mousedDown = false
		  
		  me.Refresh()
		  
		  RaiseEvent MouseUp( X, Y )
		  
		  if X >= 0 and X <= me.Width and Y >= 0 and Y <= me.Height then RaiseEvent Action
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  if me.rolledOver then
		    
		    if me.mousedDown then
		      
		      RaiseEvent PrePaint_MouseDown( g, areas )
		      
		    else
		      
		      RaiseEvent PrePaint_RolledOver( g, areas )
		      
		    end if
		    
		  else
		    
		    RaiseEvent PrePaint_Normal( g, areas )
		    
		  end if
		  
		  RaiseEvent Paint_Common( g, areas )
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint_Common(g As Graphics, areas() As Rect)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PrePaint_MouseDown(g As Graphics, areas() As Rect)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PrePaint_Normal(g As Graphics, areas() As Rect)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PrePaint_RolledOver(g As Graphics, areas() As Rect)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mousedDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private rolledOver As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
