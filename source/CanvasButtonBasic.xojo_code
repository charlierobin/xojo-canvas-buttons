#tag Class
Protected Class CanvasButtonBasic
Inherits CanvasButton
	#tag Event
		Sub Paint_Common(g As Graphics, areas() As REALbasic.Rect)
		  g.PenWidth = 3
		  
		  g.PenHeight = 3
		  
		  g.DrawRoundRect( 0, 0, g.Width, g.Height, 7, 7 )
		  
		  if me.m_Caption <> "" then
		    
		    if me.Enabled then
		      
		      g.ForeColor = Color.Black
		      
		    else
		      
		      g.ForeColor = Color.DarkGray
		      
		    end if
		    
		    g.TextFont = "System"
		    
		    g.TextSize = 13
		    
		    dim captionWidth as Double = g.StringWidth( me.m_Caption )
		    
		    dim captionHeight as Double = g.StringHeight( me.m_Caption, 1000 )
		    
		    dim baselineShift as Double = g.TextHeight - g.TextAscent
		    
		    g.DrawString( me.m_Caption, ( g.Width - captionWidth ) / 2, ( ( g.Height - captionHeight ) / 2 ) + captionHeight - baselineShift )
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PrePaint_MouseDown(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = Color.Red
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PrePaint_Normal(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = Color.Gray
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PrePaint_RolledOver(g As Graphics, areas() As REALbasic.Rect)
		  g.ForeColor = Color.Green
		  
		End Sub
	#tag EndEvent


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.m_Caption
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.m_Caption = value
			  
			  me.Invalidate()
			  
			  
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_Caption As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
