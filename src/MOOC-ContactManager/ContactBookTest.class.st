Class {
	#name : #ContactBookTest,
	#superclass : #TestCase,
	#category : #'MOOC-ContactManager'
}

{ #category : #tests }
ContactBookTest >> testAddContact [
	| contactToAdd contactBook |
	contactToAdd := Contact newNamed: 'Robert Hitchens' email: 'rhitchens@some.domain'.
	contactBook := ContactBook new.
	contactBook contacts."to initialize the contacts collection"
	contactBook addContact: contactToAdd .
	self assert: (contactBook contacts) isNotEmpty.
	self assert: (contactBook contacts at: 1) equals: contactToAdd.
	"TODO need to figure out how to access item in collection and test equals"
]

{ #category : #tests }
ContactBookTest >> testContactsEmpty [
	| contactBook |
	contactBook := ContactBook new.
	contactBook contacts.
	self assert: contactBook contacts isEmpty.
	
]

{ #category : #tests }
ContactBookTest >> testRemoveContact [
	| contactToRemove contactBook |
	contactToRemove := Contact newNamed: 'Robert Hitchens' email: 'rhitchens@some.domain'.
	contactBook := ContactBook new.
	contactBook contacts.
	contactBook addContact: contactToRemove.
	self assert: contactBook contacts isNotEmpty.
	contactBook removeContact: contactToRemove.
	self assert: contactBook contacts isEmpty.
	"TODO need to add test to test case where collection is empty when removing contact"
]

{ #category : #tests }
ContactBookTest >> testRemoveContactWhenEmpty [
	| contactToRemove contactBook |
	contactToRemove := Contact newNamed: 'Robert Hitchens' email: 'rhitchens@some.domain'.
	contactBook := ContactBook new.
	contactBook contacts.
	self should: [ contactBook removeContact: contactToRemove ] raise: NotFound.
]
