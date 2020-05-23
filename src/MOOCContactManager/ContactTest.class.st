Class {
	#name : #ContactTest,
	#superclass : #TestCase,
	#category : #MOOCContactManager
}

{ #category : #tests }
ContactTest >> testCreation [
	| contact |
	contact := Contact newNamed: 'Marcus Denker' email: 'marcus.denger@inria.fr'.
	self assert: contact fullname equals: 'Marcus Denker'.
	self assert: contact email equals: 'marcus.denger@inria.fr'.
]
