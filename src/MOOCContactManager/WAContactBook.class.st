Class {
	#name : #WAContactBook,
	#superclass : #WAComponent,
	#instVars : [
		'contactBook'
	],
	#category : #MOOCContactManager
}

{ #category : #rendering }
WAContactBook >> renderContentOn: html [ 
	"Main entry point of the view. Render a title"
	
	html heading 
		level: 1;
		with: 'My Contact Book'.
]