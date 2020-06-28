Class {
	#name : #SimpleAnchor,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-Anchors'
}

{ #category : #rendering }
SimpleAnchor >> renderContentOn: html [ 
	html anchor 
		url: 'http://www.seaside.st';
		with: 'Seaside Website'
]
