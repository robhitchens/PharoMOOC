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
	(WAAdmin register: self asApplicationAt: 'contacts')
		addLibrary: JQDeploymentLibrary ;
		addLibrary: TBSDeploymentLibrary 
]

{ #category : #accessing }
WAContactBook >> contactBook [ 
	^ contactBook ifNil: [ contactBook := ContactBook createDefault ]
]

{ #category : #accessing }
WAContactBook >> contacts [
	^ self contactBook contacts
]

{ #category : #enumerating }
WAContactBook >> contactsDo: aBlock [
	self contacts do: aBlock
]

{ #category : #rendering }
WAContactBook >> renderContact: aContact on: html [ 
	html tableRow: [ 
		html 
			tableData: aContact fullname ;
			tableData: aContact email ]
]

{ #category : #rendering }
WAContactBook >> renderContactsOn: html [ 
	html table: [ 
		html tableHead: [ 
			html 
				tableHeading: 'Name';
				tableHeading: 'Email' ].
			self contactsDo: [ :contact | self renderContact: contact on: html ] ]
]

{ #category : #rendering }
WAContactBook >> renderContentOn: html [ 
	"Main entry point of the view. Render a title"
	"WAContactBook initialize"
	html heading 
		level: 1;
		with: 'My Contact Book'.
	self renderContactsOn: html
]

{ #category : #updating }
WAContactBook >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot .
	anHtmlRoot title: 'Contact Book'
]
