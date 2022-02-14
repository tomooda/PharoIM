Extension { #name : #WorldMorph }

{ #category : #'*PharoIM-Core' }
WorldMorph >> requestStopTextEditing [

	self worldState worldRenderer requestStopTextEditing
]

{ #category : #'*PharoIM-Core' }
WorldMorph >> requestTextEditingAt: aRectangle [

	self worldState worldRenderer requestTextEditingAt: aRectangle
]
