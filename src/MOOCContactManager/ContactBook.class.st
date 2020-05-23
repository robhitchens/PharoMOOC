"
I hold a collection of Contacts
"
Class {
	#name : #ContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #MOOCContactManager
}

{ #category : #adding }
ContactBook >> addContact: aContact [
	self contacts add: aContact
]

{ #category : #accessing }
ContactBook >> contacts [
	^ contacts ifNil: [ contacts := OrderedCollection new ]
]

{ #category : #adding }
ContactBook >> removeContact: aContact [
	self contacts remove: aContact 
]
