Extension { #name : #OSSDL2BackendWindow }

{ #category : #'*PharoIM-Core' }
OSSDL2BackendWindow >> startTextInputAtRectangle: aRectangle [

	"See https://wiki.libsdl.org/SDL_StartTextInput"

	sdl2Window
		startTextInput;
		setTextInputRectangle: aRectangle asSDLRect
]

{ #category : #'*PharoIM-Core' }
OSSDL2BackendWindow >> visitTextEditingEvent: event [
	| osEvent |
	"Nothing for now"
	osEvent := OSTextEditingEvent for: osWindow.
	osEvent
		text: (ZnUTF8Encoder new decodeBytes: event text);
		position: self mousePosition;
		start: event start;
		length: event length.
	^ osEvent deliver
]

{ #category : #'*PharoIM-Core' }
OSSDL2BackendWindow >> visitTextInputEvent: event [
	| osEvent |
	
	osEvent := OSTextInputEvent for: osWindow.
	osEvent text: (ZnUTF8Encoder new decodeBytes: event text);
			position: self mousePosition.
	^ osEvent deliver
]
