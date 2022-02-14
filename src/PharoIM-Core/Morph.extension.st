Extension { #name : #Morph }

{ #category : #'*PharoIM-Core' }
Morph >> handleTextEditionEvent: anEvent [
	"System level event handling."
	
	anEvent wasHandled ifTrue:[^self].
	(self handlesTextEditionEvent: anEvent) ifTrue:[
		anEvent wasHandled: true.
		self textEdition: anEvent]
]

{ #category : #'*PharoIM-Core' }
Morph >> handleTextInputEvent: anEvent [
	"System level event handling."
	
	anEvent wasHandled ifTrue:[^self].
	(self handlesTextInputEvent: anEvent) ifTrue:[
		anEvent wasHandled: true.
		self textInput: anEvent]
]

{ #category : #'*PharoIM-Core' }
Morph >> handleUnknownEvent: anEvent [
	"An event of an unknown type was sent to the receiver. What shall we do?!"
	self inform: 'Unknown event: ', anEvent printString. 
	anEvent printString displayAt: 0@0.
	anEvent wasHandled: true.
]

{ #category : #'*PharoIM-Core' }
Morph >> handlesTextEditionEvent: evt [
	"Do I want to receive text edition events?" 

	^false
]

{ #category : #'*PharoIM-Core' }
Morph >> handlesTextInputEvent: evt [
	"Do I want to receive text edition events?" 

	^false
]

{ #category : #'*PharoIM-Core' }
Morph >> requestStopTextEditing [

	"Used by a morph to request stop text edition capabilities.
	The rendering backend can use this, for example, close the IME (input-method-editor).
	Use it in pair with requestTextEditingAt:
	
	By default, propagate the request to the owner.
	If this morph has no owner, do nothing.
	Particular morphs (e.g., the root of the composition hierarchy should override)"
	self owner ifNil: [ ^ self ].
	self owner requestStopTextEditing
]

{ #category : #'*PharoIM-Core' }
Morph >> requestTextEditingAt: aRectangle [

	"Used by a morph to request text edition capabilities.
	The rendering backend can use this information to, for example, open the IME (input-method-editor).
	The rectangle indicates the position where the IME menu could be shown.
	
	Use it in pair with requestStopTextEditing
	
	By default, propagate the request to the owner.
	If this morph has no owner, do nothing.
	Particular morphs (e.g., the root of the composition hierarchy should override)"
	self owner ifNil: [ ^ self ].
	self owner requestTextEditingAt: aRectangle
]

{ #category : #'*PharoIM-Core' }
Morph >> textEdition: aTextEditionEvent [
]

{ #category : #'*PharoIM-Core' }
Morph >> textInput: aTextInputEvent [
]
