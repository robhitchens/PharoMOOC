Class {
	#name : #AnchorCallbackExample,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'MOOC-SeasideBookTutorial-Anchors'
}

{ #category : #'as yet unclassified' }
AnchorCallbackExample >> anchorClicked [
	count := count + 1
]

{ #category : #initialization }
AnchorCallbackExample >> initialize [
	super initialize.
	count := 0.
]

{ #category : #rendering }
AnchorCallbackExample >> renderContentOn: html [ 
	html text: count.
	html break.
	html anchor 
		callback: [ self anchorClicked ];
		with: 'click to increment'
]
