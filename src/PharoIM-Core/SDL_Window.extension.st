Extension { #name : #'SDL_Window' }

{ #category : #'*PharoIM-Core' }
SDL_Window >> setTextInputRectangle: aSDL2Rectangle [

	^ self ffiCall: #(void SDL_SetTextInputRect(SDL_Rect* aSDL2Rectangle))
]
