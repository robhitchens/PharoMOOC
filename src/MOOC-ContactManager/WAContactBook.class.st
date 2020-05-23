Class {
	#name : #WAContactBook,
	#superclass : #WAComponent,
	#instVars : [
		'contactBook'
	],
	#category : #'MOOC-ContactManager'
}

{ #category : #'class initialization' }
WAContactBook class >> initialize [ 
	(WAAdmin register: self asApplicationAt: 'contacts')
		addLibrary: JQDeploymentLibrary ;
		addLibrary: TBSDeploymentLibrary 
]

{ #category : #adding }
WAContactBook >> addContact [
	(self call: WAContact new)
		ifNotNil: [ :contact | contactBook addContact: contact ]
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
WAContactBook >> renderButtonsForContact: aContact on: html [ 
	html tbsButtonGroup: [ 
		self
			renderEditButtonForContact: aContact on: html;
			renderRemoveButtonForContact: aContact on: html ]
]

{ #category : #rendering }
WAContactBook >> renderContact: aContact on: html [ 
	html tableRow: [ 
		html 
			tableData: aContact fullname ;
			tableData: aContact email;
			tableData: [ self renderPhotoOf: aContact on: html ];
			tableData: [ self renderButtonsForContact: aContact on: html ] ]
]

{ #category : #rendering }
WAContactBook >> renderContactsOn: html [ 
	html tbsTable: [ 
		html tableHead: [ 
			html 
				tableHeading: 'Name';
				tableHeading: 'Email';
				tableHeading: 'Photo' ].
			self contactsDo: [ :contact | self renderContact: contact on: html ] ]
]

{ #category : #rendering }
WAContactBook >> renderContentOn: html [
	"Main entry point of the view. Render a title"

	"WAContactBook initialize"

	html
		tbsContainer: [ html heading
				level: 1;
				with: 'My Contact Book'.
			html tbsForm: [ self renderContactsOn: html.
				self renderGlobalButtonsOn: html ] ]
]

{ #category : #rendering }
WAContactBook >> renderEditButtonForContact: aContact on: html [ 
	html tbsButton 
		beSuccess;
		callback: [ self call: (WAContact editContact: aContact) ];
		with: 'Edit'
]

{ #category : #rendering }
WAContactBook >> renderGlobalButtonsOn: html [ 
	html tbsButtonGroup: [ 
		html tbsButton 
			beSuccess;
			callback: [ self addContact ];
			with: 'New contact' ]
]

{ #category : #rendering }
WAContactBook >> renderPhotoOf: aContact on: html [ 
	html image url: aContact gravatarUrl 
]

{ #category : #rendering }
WAContactBook >> renderRemoveButtonForContact: aContact on: html [ 
	html tbsButton 
		beDanger ;
		callback: [ self contactBook removeContact: aContact ];
		with: 'Remove'
]

{ #category : #updating }
WAContactBook >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot .
	anHtmlRoot title: 'Contact Book'
]
