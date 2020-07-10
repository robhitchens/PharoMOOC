Class {
	#name : #IAContactListView,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #adding }
IAContactListView >> addContact [ 
	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	IAContact addContact: (IAContact name: name emailAddress: emailAddress)
]

{ #category : #editing }
IAContactListView >> editContact: aContact [
 	| view copy |
	view := IAContactView new.
	copy := aContact copy.
	view contact: copy.
	(self call: view)
		ifTrue: [ IAContact removeContact: aContact; addContact: copy ].
"	self inform: 'Thanks for editing ', aContact name"
]

{ #category : #removing }
IAContactListView >> removeContact: aContact [
	(self confirm: 'Are you sure that you want to remove this contact?')
	ifTrue: [ IAContact removeContact: aContact ]
]

{ #category : #rendering }
IAContactListView >> renderContact: aContact on: html [ 
	html text: aContact name.
	html space.
	html anchor
		url: 'mailto:', aContact emailAddress;
		with: aContact emailAddress.
	html text: ' ('.
	html anchor 
		callback: [ self editContact: aContact ];
		with: 'edit'.
		html space.
	html anchor 
		callback: [ self removeContact: aContact ];
		with: 'remove'.
	html text: ')'
]

{ #category : #rendering }
IAContactListView >> renderContentOn: html [
	html anchor 
		callback: [ self addContact ];
		with: 'Add contact'.
	html unorderedList: [ 
		IAContact contacts do: [ :contact | 
			html listItem: [ self renderContact: contact on: html ] ] ]
]
