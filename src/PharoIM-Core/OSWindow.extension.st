Extension { #name : #OSWindow }

{ #category : #'*PharoIM-Core' }
OSWindow >> startTextInputAtRectangle: aRectangle [

	"Start accepting Unicode text input events.
	I will start accepting Unicode text input events in the focused window, and start emitting text input and text editing events.
	Please use me in pair with stopTextInput.
	On some platforms I may activate the screen keyboard."

	self validHandle startTextInputAtRectangle: aRectangle
]
