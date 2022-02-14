Class {
	#name : #TextInputEvent,
	#superclass : #UserInputEvent,
	#instVars : [
		'text'
	],
	#category : #'PharoIM-Core'
}

{ #category : #testing }
TextInputEvent >> isTextInputEvent [

	^true
]

{ #category : #dispatching }
TextInputEvent >> sentTo: anObject [

	^anObject handleTextInputEvent: self
]

{ #category : #accessing }
TextInputEvent >> text [
	^ text
]

{ #category : #accessing }
TextInputEvent >> text: aString [

	text := aString
]
