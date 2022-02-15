Extension { #name : #HandMorph }

{ #category : #'*PharoIM-Core' }
HandMorph >> handleEvent: anEvent [
	| evt  |
	owner ifNil:[^self].
	evt := anEvent.
	
	"nil test here is for efficiency in the normal case"
	EventStats ifNotNil: [ self class logEventStats: evt ]. 
	
	evt isMouse ifTrue:[
		 "just for record, to be used by capture block" 
		lastMouseEvent := evt].

	captureBlock ifNotNil: [ ^ captureBlock value: anEvent ].
	evt isMouseOver ifTrue:[^self sendMouseEvent: evt].
	
	self showDebugEvent: evt.
	
	"Notify listeners"
	self sendListenEvent: evt to: self eventListeners.

	(evt isTextEditionEvent or: [evt isTextInputEvent]) ifTrue: [
		^ self sendEvent: evt focus: keyboardFocus  ].

	evt isWindowEvent ifTrue: [
		^ self sendEvent: evt focus: nil ].
	

	evt isKeyboard ifTrue:[
		
		(evt isKeystroke and: [supressNextKeyPress == true])
			ifTrue: [
				supressNextKeyPress := false.
				^ self ].
		
			self sendListenEvent: evt to: self keyboardListeners.
			self sendKeyboardEvent: evt.
			supressNextKeyPress := evt isKeyDown and: [evt supressNextKeyPress].
		^ self ].

	evt isDropEvent ifTrue:[
		^ self sendEvent: evt focus: nil ].

	evt isMouse ifTrue:[
		self sendListenEvent: evt to: self mouseListeners.
		lastMouseEvent := evt].

	"Check for pending drag or double click operations."
	mouseClickState ifNotNil:[
		(mouseClickState handleEvent: evt from: self) ifFalse:[
			"Possibly dispatched #click: or something and will not re-establish otherwise"
			^self ]].

	evt isMove ifTrue:[
		| pos |
		pos := evt position.
		evt isDraggingEvent ifTrue: [ 
			| treshold |
			treshold := 0.
			(self submorphs at: 1 ifAbsent: [ nil ])
				ifNotNil: [ :first | treshold := self top-first top ].
			pos y < (self class upperHandLimit+treshold) ifTrue: [ pos := pos x @ (self class upperHandLimit + treshold)] ].
		
		self position: pos.
		self sendMouseEvent: evt.
	] ifFalse:[
		"Issue a synthetic move event if we're not at the position of the event"
		(evt position = self position) ifFalse:[self moveToEvent: evt].
		"Drop submorphs on button events"
		(self hasSubmorphs) 
			ifTrue:[self dropMorphs: evt]
			ifFalse:[self sendMouseEvent: evt].
	].
	self showMouseFocusEvent: evt.
	self mouseOverHandler processMouseOver: lastMouseEvent.

]
