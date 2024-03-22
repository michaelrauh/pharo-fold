Class {
	#name : #Creator,
	#superclass : #Object,
	#instVars : [
		'book',
		'atoms'
	],
	#category : #PocketSquare
}

{ #category : #accessing }
Creator class >> withBook: aBook [
	| c |
	c := Creator new.
	c setBook: aBook.
	^ c
	
]

{ #category : #accessing }
Creator >> exNihilo: aPair [ 
	"a -> b -> d <- c <- a'"
	| a b cs ds a_primes cs_filtered a_primes_filtered to_add |
	to_add := OrderedCollection new.
	a := aPair first.
	b := aPair second. 
	ds := (book projectForward: b) flatten.
	cs := ((ds collect: [ :d | 
	 book projectBackward: d
	 ]) flatten) flatten.
	 cs_filtered := cs select: [ :i | i ~= b ].
	a_primes := ((cs_filtered collect: [ :c | 
	 	book projectBackward: c
	 	]) flatten) flatten.
	 a_primes_filtered := a_primes select: [ :a_prime | a = a_prime ].
	 a_primes_filtered do: [ :a_prime | 
	 	ds do: [ :d | 
	 		cs do: [ :c | 
	 			to_add add: (Ortho withA: a_prime withB: b withC: c withD: d)
	 		 ]
	 	]
	  ].
	 atoms addAll: to_add.
]

{ #category : #'as yet unclassified' }
Creator >> getBook [
	^ book.
]

{ #category : #accessing }
Creator >> gtAtomsFor: aView [
	<gtView>
	^ aView forward
		title: 'atoms';
		priority: 10;
		object: [ atoms ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Creator >> initialize [ 
atoms := OrderedCollection new
]

{ #category : #accessing }
Creator >> minimalCreatorExampleFor2x2 [
	<gtExample>
	|creator|
	creator := Creator withBook: ((Book new) minimalExampleFor2x2).
	(((creator getBook) pairs) do: [ :pair | (creator exNihilo: pair) ]).
	^ creator
]

{ #category : #accessing }
Creator >> setBook: aBook [
	book := aBook
]
