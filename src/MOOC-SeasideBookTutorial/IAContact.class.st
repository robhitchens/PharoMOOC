Class {
	#name : #IAContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'emailAddress',
		'gender',
		'requestsEmailUpdates',
		'birthdate'
	],
	#classVars : [
		'Database'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #adding }
IAContact class >> addContact: aContact [
	self contacts add: aContact
]

{ #category : #accessing }
IAContact class >> contacts [ 
	"Answers an OrderedCollection of the contact information instances."
	Database ifNil: [ self createSampleDatabase  ].
	^ Database

]

{ #category : #'as yet unclassified' }
IAContact class >> createSampleDatabase [
	Database := OrderedCollection new
		add: (self name: 'Bob Jones' emailAddress: 'bob@nowhere.com');
		add: (self name: 'Steve Smith' emailAddress: 'sm@somewhere.com');
		yourself
]

{ #category : #'as yet unclassified' }
IAContact class >> name: nameString emailAddress: emailString [
	^ self new 
			name: nameString;
			emailAddress: emailString;
			yourself
]

{ #category : #removing }
IAContact class >> removeContact: aContact [
	self contacts remove: aContact 
]

{ #category : #'as yet unclassified' }
IAContact >> beFemale [
	gender := #Female
]

{ #category : #'as yet unclassified' }
IAContact >> beMale [
	gender := #Male
]

{ #category : #accessing }
IAContact >> birthdate [
	^ birthdate ifNil: [ birthdate := (Date today) ]
]

{ #category : #accessing }
IAContact >> birthdate: anObject [
	birthdate := anObject
]

{ #category : #accessing }
IAContact >> emailAddress [
	^ emailAddress
]

{ #category : #accessing }
IAContact >> emailAddress: aString [
	emailAddress := aString
]

{ #category : #accessing }
IAContact >> gender [
	^ gender ifNil: [ gender := #Male ]
]

{ #category : #testing }
IAContact >> isFemale [
	^ self gender = #Female
]

{ #category : #testing }
IAContact >> isMale [
 	^ self gender = #Male
]

{ #category : #accessing }
IAContact >> name [
	^ name
]

{ #category : #accessing }
IAContact >> name: aString [
	name := aString
]

{ #category : #accessing }
IAContact >> requestsEmailUpdates [
	^ requestsEmailUpdates ifNil: [ requestsEmailUpdates := false ]
]

{ #category : #accessing }
IAContact >> requestsEmailUpdates: aBoolean [
	requestsEmailUpdates := aBoolean 
]
