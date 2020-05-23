"
I represent a person with a name and an email address. I'm usually part of a contact book.
"
Class {
	#name : #Contact,
	#superclass : #Object,
	#instVars : [
		'fullname',
		'email'
	],
	#category : #MOOCContactManager
}

{ #category : #'instance creation' }
Contact class >> newNamed: aNameString email: anEmailString [
	^ self new 
		fullname: aNameString;
		email: anEmailString;
		yourself
]

{ #category : #accessing }
Contact >> email [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	^ email
]

{ #category : #accessing }
Contact >> email: aString [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	email := aString
]

{ #category : #accessing }
Contact >> fullname [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	^ fullname
]

{ #category : #accessing }
Contact >> fullname: aString [
	"Further extensions You can add some extra logic to make sure that the name is 
	not surrounded by space. In addition handling whether you take care of note
	about lowercase and uppercase should be addressed. You can use messages such as asLowercase to,
	for example, store only lowercased strings"
	fullname := aString
]

{ #category : #printing }
Contact >> printOn: aStream [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	aStream 
		nextPutAll: self fullname;
		nextPutAll: ' <';
		nextPutAll: self email;
		nextPutAll: '>'
]
