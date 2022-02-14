Extension { #name : #RubScrolledTextMorph }

{ #category : #'*PharoIM-Core' }
RubScrolledTextMorph >> handlesTextEditionEvent: anEvent [

	^ self scrollPane
		  ifNotNil: [ :pane | pane handlesTextEditionEvent: anEvent ]
		  ifNil: [ super handlesTextEditionEvent: anEvent ]
]

{ #category : #'*PharoIM-Core' }
RubScrolledTextMorph >> handlesTextInputEvent: anEvent [

	^ self scrollPane
		  ifNotNil: [ :pane | pane handlesTextInputEvent: anEvent ]
		  ifNil: [ super handlesTextInputEvent: anEvent ]
]

{ #category : #'*PharoIM-Core' }
RubScrolledTextMorph >> textEdition: aTextEditionEvent [

	self scrollPane ifNotNil: [ :scrollpane | 
		scrollpane textEdition: aTextEditionEvent ]
]

{ #category : #'*PharoIM-Core' }
RubScrolledTextMorph >> textInput: aTextInputEvent [

	self scrollPane ifNotNil: [ :scrollpane | 
		scrollpane textInput: aTextInputEvent ]
]
