Extension { #name : #RubAbstractTextArea }

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> editing [

	^ editing = true
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> handleKeyDown: anEvent [

	editing = true ifTrue: [ ^ self ].
	^ super handleKeyDown: anEvent
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> handlesTextEditionEvent: anEvent [

	^ true
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> handlesTextInputEvent: anEvent [

	^ true
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> initialize [
	super initialize.
	self compose.
	self addCursor.
	self plugFindReplace.
	DefaultTextColor := self theme textColor.
	editing := false
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea class >> installPharoIM [

	| instVarNames |
	instVarNames := #( 'editing' ).
	instVarNames do: [ :instVarName | 
		(self hasInstVarNamed: instVarName) ifFalse: [ 
			self addInstVarNamed: instVarName ] ]
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> keyStroke: anEvent [

	"Handle a keystroke event."

	anEvent hand anyButtonPressed ifTrue: [ ^ self ].
	self handleEdit: [ 
		editing = true
			ifTrue: [ 
				editing := false.
				self editor unselect ]
			ifFalse: [ self editor keystroke: anEvent ] ].
	self scrollSelectionIntoView: nil
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> keyboardFocusChange: aBoolean [

	aBoolean
		ifTrue: [ 
			self hasFocus: true.
			editing := false.
			self editor unselect.
			self requestTextEditingAt: (self cursor positionInWorld corner:
					 (self cursor positionInWorld translateBy:
						  0 @ (self font height + 4))) truncated.
			self showOverEditableTextCursor ]
		ifFalse: [ 
			self hasFocus: false.
			self requestStopTextEditing.
			editing = true ifTrue: [ 
				self editor unselect.
				editing := false ].
			self hideOverEditableTextCursor ].
	super keyboardFocusChange: aBoolean.
	self focusChanged
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> textEdition: aTextEditionEvent [

	aTextEditionEvent text
		ifNotEmpty: [ :editText | 
			self editor zapSelectionWith: editText.
			editing := true ]
		ifEmpty: [ 
			editing = true ifTrue: [ 
				self editor zapSelectionWith: ''.
				editing := false ] ]
]

{ #category : #'*PharoIM-Core' }
RubAbstractTextArea >> textInput: aTextInputEvent [
	self editor zapSelectionWith: aTextInputEvent text.
	self editor unselect.
	editing := false
]
