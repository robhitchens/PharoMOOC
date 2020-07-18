Class {
	#name : #IAAddress,
	#superclass : #WAComponent,
	#instVars : [
		'editor'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #adding }
IAAddress >> addContact: aContact [ 
	IAContact addContact: aContact 
]

{ #category : #'as yet unclassified' }
IAAddress >> askAndCreateContact [
	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	self addContact: (IAContact name: name emailAddress: emailAddress)
]

{ #category : #hooks }
IAAddress >> children [ 
	^ Array with: editor 
]

{ #category : #accessing }
IAAddress >> contacts [ 
	^ IAContact contacts 
]

{ #category : #editing }
IAAddress >> editContact: aContact [ 
	editor contact: aContact 
]

{ #category : #initialization }
IAAddress >> initialize [ 
	super initialize.
	editor := IAContactView new.
	editor contact: self contacts first.
	editor addMessage: 'Editing...'.
	editor onAnswer: [ :answer | self inform: 'Saved', answer printString ]
]

{ #category : #removing }
IAAddress >> removeContact: aContact [ 
	(self confirm: 'Are you sure that you want to remove this contact?')
		ifTrue: [ IAContact removeContact: aContact ]
]

{ #category : #rendering }
IAAddress >> renderBarOn: html [
	html anchor 
		callback: [ self askAndCreateContact ];
		with: 'Add contact'
]

{ #category : #rendering }
IAAddress >> renderContact: aContact on: html [ 
	html tableData: [ 
		html anchor 
			callback: [ self editContact: aContact ];
			with: aContact name ].
	html tableData: aContact emailAddress.
		html tableData: [ 
			html anchor 
				callback: [ self removeContact: aContact ];
				with: '--' ]
]

{ #category : #rendering }
IAAddress >> renderContentOn: html [ 
	html form: [ 
		self renderTitleOn: html.
		self renderBarOn: html.
		html table: [ 
			html tableRow: [ 
				html tableHeading: 'Name'.
				html tableHeading: 'Address' ].
			self renderDatabaseRowsOn: html ].
		html horizontalRule.
		html render: editor ]
]

{ #category : #rendering }
IAAddress >> renderDatabaseRowsOn: html [ 
	self contacts do: [ :contact |
		html tableRow: [ self renderContact: contact on: html ] ]
]

{ #category : #rendering }
IAAddress >> renderTitleOn: html [
	html heading level: 2; with: 'iAddress'
]
