Class {
	#name : #PluggableContactListView,
	#superclass : #IAContactListView,
	#instVars : [
		'contactViewers',
		'editor'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #adding }
PluggableContactListView >> addContact: aContact [
	IAContact addContact: aContact.
	self addContactViewerFor: aContact 
]

{ #category : #adding }
PluggableContactListView >> addContactViewerFor: aContact [ 
	contactViewers 
		at: aContact 
		put: (ReadOnlyOneLinerContactView new 
			contact: aContact;
			parent: self;
			yourself)
]

{ #category : #'as yet unclassified' }
PluggableContactListView >> askAndCreateContact [ 
	| name emailAddress |
	name := self request: 'Name'.
	emailAddress := self request: 'Email address'.
	self addContact: (IAContact name: name emailAddress: emailAddress)
]

{ #category : #hooks }
PluggableContactListView >> children [ 
	^ contactViewers values
]

{ #category : #accessing }
PluggableContactListView >> contacts [ 
	^ IAContact contacts 
]

{ #category : #accessing }
PluggableContactListView >> editor: anEditor [
	editor := anEditor
]

{ #category : #initialization }
PluggableContactListView >> initialize [ 
	super initialize.
	editor := IAContactView new.
	contactViewers := IdentityDictionary new.
	self contacts do: [ :each | self addContactViewerFor: each ]
]

{ #category : #removing }
PluggableContactListView >> removeContact: aContact [
	contactViewers removeKey: aContact.
	IAContact removeContact: aContact 
]

{ #category : #rendering }
PluggableContactListView >> renderContentOn: html [ 
	contactViewers valuesDo: [ :each |
		 html render: each. html break ]
]
