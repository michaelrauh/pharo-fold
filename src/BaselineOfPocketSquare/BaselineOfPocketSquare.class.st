Class {
	#name : #BaselineOfPocketSquare,
	#superclass : #BaselineOf,
	#category : #BaselineOfPocketSquare
}

{ #category : #baseline }
BaselineOfPocketSquare >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'PocketSquare'
		]
]
