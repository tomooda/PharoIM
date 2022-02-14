Extension { #name : #RubTextEditor }

{ #category : #'*PharoIM-Core' }
RubTextEditor >> cursorLeft: aKeyboardEvent [ 
	"Private - Move cursor left one character if nothing selected, otherwise 
	move cursor to beginning of selection. If the shift key is down, start 
	selecting or extending current selection. Don't allow cursor past 
	beginning of text"

	textArea editing ifTrue: [ ^ false ].
	self closeTypeIn.
	self
		moveCursor:[:position | position - 1 max: 1]
		forward: false
		specialBlock:[:position | self previousWord: position]
		event: aKeyboardEvent.
	^ true
]

{ #category : #'*PharoIM-Core' }
RubTextEditor >> cursorRight: aKeyboardEvent [ 
	"Private - Move cursor right one character if nothing selected, 
	otherwise move cursor to end of selection. If the shift key is down, 
	start selecting characters or extending already selected characters. 
	Don't allow cursor past end of text"

	textArea editing ifTrue: [ ^ false ].
	self closeTypeIn.
	self
		moveCursor: [:position | position + 1]
		forward: true
		specialBlock:[:position | self nextWord: position]
		event: aKeyboardEvent.
	^ true
]

{ #category : #'*PharoIM-Core' }
RubTextEditor >> moveCursor: directionBlock forward: forward specialBlock: specialBlock event: aKeyboardEvent [
	"Private - Move cursor.
	directionBlock is a one argument Block that computes the new Position from a given one.
	specialBlock is a one argumentBlock that computes the new position from a given one under the alternate semantics.
	Note that directionBlock always is evaluated first."
	| shift indices newPosition |
	shift := aKeyboardEvent shiftPressed.
	indices := self setIndices: shift forward: forward.
	newPosition := directionBlock value: (indices at: #moving).
	(aKeyboardEvent commandKeyPressed or: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [newPosition := specialBlock value: newPosition].
	shift
		ifTrue: [self selectMark: (indices at: #fixed) point: newPosition - 1]
		ifFalse: [self selectAt: newPosition].
	self setEmphasisHereFromTextForward: forward.

	textArea
		requestTextEditingAt: (textArea cursor positionInWorld
			corner: textArea cursor positionInWorld).
]
