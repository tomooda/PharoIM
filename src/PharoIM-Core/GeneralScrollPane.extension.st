Extension { #name : #GeneralScrollPane }

{ #category : #'*PharoIM-Core' }
GeneralScrollPane >> handlesTextEditionEvent: anEvent [

	^ self scrollTarget handlesTextEditionEvent: anEvent
]

{ #category : #'*PharoIM-Core' }
GeneralScrollPane >> handlesTextInputEvent: anEvent [

	^ self scrollTarget handlesTextInputEvent: anEvent
]

{ #category : #'*PharoIM-Core' }
GeneralScrollPane >> textEdition: aTextEditionEvent [

	self scrollTarget textEdition: aTextEditionEvent
]

{ #category : #'*PharoIM-Core' }
GeneralScrollPane >> textInput: aTextInputEvent [

	self scrollTarget textInput: aTextInputEvent
]
