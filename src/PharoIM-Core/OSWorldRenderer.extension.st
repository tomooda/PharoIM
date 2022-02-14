Extension { #name : #OSWorldRenderer }

{ #category : #'*PharoIM-Core' }
OSWorldRenderer >> requestStopTextEditing [
	
	osWindow stopTextInput
]

{ #category : #'*PharoIM-Core' }
OSWorldRenderer >> requestTextEditingAt: aRectangle [ 
	
	osWindow startTextInputAtRectangle: aRectangle
]
