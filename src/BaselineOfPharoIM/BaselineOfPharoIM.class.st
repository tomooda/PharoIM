Class {
	#name : #BaselineOfPharoIM,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoIM
}

{ #category : #baselines }
BaselineOfPharoIM >> baselineOf: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'PharoIM-Core'.
		spec
			group: 'default' with: #( 'core' );
			group: 'core' with: #( 'PharoIM-Core' ).
		spec postLoadDoIt: #postLoad ]
]

{ #category : #script }
BaselineOfPharoIM >> postLoad [

	Smalltalk
		at: #RubAbstractTextArea
		ifPresent: [ :class | class installPharoIM ].
	Smalltalk at: #SDL_Event ifPresent: [ :class | class initialize ]
]
