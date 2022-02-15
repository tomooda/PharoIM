Extension { #name : #MorphicEventDispatcher }

{ #category : #'*PharoIM-Core' }
MorphicEventDispatcher >> handleTextEditionEvent: aTextEditionEvent [
	^ self dispatchDefault: aTextEditionEvent with: morph
]

{ #category : #'*PharoIM-Core' }
MorphicEventDispatcher >> handleTextInputEvent: aTextInputEvent [ 
	^ self dispatchDefault: aTextInputEvent with: morph
]
