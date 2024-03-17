Class {
	#name : #Book,
	#superclass : #Object,
	#instVars : [
		'text'
	],
	#category : #PocketSquare
}

{ #category : #accessing }
Book >> initialize [
	text := 'a b. c d. a c. b d.'
]
