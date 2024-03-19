Class {
	#name : #Book,
	#superclass : #Object,
	#instVars : [
		'text',
		'sentences',
		'pairs',
		'tokenized'
	],
	#category : #PocketSquare
}

{ #category : #accessing }
Book class >> fromText: aText [
	| b |
	b := Book new.
	b withText: aText.
	^ b
	
]

{ #category : #accessing }
Book >> gtPairsFor: aView [
	<gtView>
	^ aView forward
		title: 'pairs';
		priority: 10;
		object: [ pairs ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Book >> minimalExampleFor2x2 [
	<gtExample>
	^ Book fromText: 'a b. c d. a c. b d.'
]

{ #category : #accessing }
Book >> withText: aText [
	text := aText.
	pairs := OrderedCollection new.
	sentences := (text findTokens: '(\.|\?|;)\s*') collect: [ :sentence | sentence findTokens: ' ' ].
	sentences collect: [ :sentence | 
		1 to: sentence size - 1 do: [ :index |
			| p |
			p := OrderedCollection new.
			p add: (sentence at: index).
			p add: (sentence at: index + 1).
			pairs add: p
		]
	]

]
