Class {
	#name : #WAContactBook,
	#superclass : #WAComponent,
	#instVars : [
		'contactBook'
	],
	#category : #MOOCContactManager
}

{ #category : #'class initialization' }
WAContactBook class >> initialize [ 
	WAAdmin register: self asApplicationAt: 'contacts'.
]

{ #category : #accessing }
WAContactBook >> contactBook [ 
	^ contactBook ifNil: [ contactBook := ContactBook createDefault ]
]

{ #category : #accessing }
WAContactBook >> contacts [
	^ self contactBook contacts
]

{ #category : #rendering }
WAContactBook >> renderContentOn: html [ 
	"Main entry point of the view. Render a title"
	"WAContactBook initialize"
	html heading 
		level: 1;
		with: 'My Contact Book'.
]

{ #category : #updating }
WAContactBook >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot .
	anHtmlRoot title: 'Contact Book'
]
