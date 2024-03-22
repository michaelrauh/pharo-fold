Class {
	#name : #Ortho,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #PocketSquare
}

{ #category : #accessing }
Ortho class >> withA: a withB: b withC: c withD: d [ 
	| o data |
	o := Ortho new.
	data := OrderedCollection new.
	data add: a.
	data add: b.
	data add: d.
	data add: c.
	o setData: data.
	^ o
]

{ #category : #accessing }
Ortho >> gtInspectorItemsIn: aComposite [
    <gtInspector>
    aComposite 
        display: [ data ].

]

{ #category : #accessing }
Ortho >> gtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'data';
		priority: 10;
		object: [ data ];
		view: #gtItemsFor:
]

{ #category : #accessing }
Ortho >> minimalExampleFor2x2 [
	<gtExample>
	| o |
	o := Ortho withA: 'a' withB: 'b' withC: 'c' withD: 'd'.
	^ o
]

{ #category : #accessing }
Ortho >> setData: someData [
	data:= someData
]
