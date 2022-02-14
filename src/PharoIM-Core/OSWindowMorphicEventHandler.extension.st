Extension { #name : #OSWindowMorphicEventHandler }

{ #category : #'*PharoIM-Core' }
OSWindowMorphicEventHandler >> visitTextEditingEvent: anEvent [
	
	| keyEvent |
	keyEvent := TextEditionEvent new
		setHand: self activeHand;
		setPosition: (self convertPosition: anEvent position);
		text: anEvent text;
		start: anEvent start;
		length: anEvent length;
		wasHandled: false.
	^ keyEvent
]

{ #category : #'*PharoIM-Core' }
OSWindowMorphicEventHandler >> visitTextInputEvent: anEvent [

	anEvent text ifNil: [ ^ nil ].
	^ anEvent text size = 1
		  ifTrue: [ 
			  | char mods |
			  char := anEvent text first.
			  char ifNil: [ ^ nil ].
			  mods := anEvent modifiers.
			  "If a modifier key is pressed the keystroke event is handled by #visitMouseDownEvent:"
			  (mods alt or: [ mods ctrl or: [ mods cmd ] ]) ifTrue: [ ^ nil ].

			  KeyboardEvent new
				  setType: #keystroke
				  buttons: (self convertModifiers: anEvent modifiers)
				  position: (self convertPosition: anEvent position)
				  keyValue: char charCode
				  charCode: char charCode
				  hand: self activeHand
				  stamp: Time millisecondClockValue ]
		  ifFalse: [ 
			  ^ TextInputEvent new
				    setHand: self activeHand;
				    setPosition: (self convertPosition: anEvent position);
				    text: anEvent text;
				    wasHandled: false ]
]
