"
Counter is a simple concrete class which supports incrementing and decrementing a counter.

Its API is:
- decrement, increment
- count

Its creation API is message withValue:
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'MOOC-Counter'
}

{ #category : #initialization }
Counter class >> withValue: anInteger [
	| c |
	c := self new count: anInteger.
	^ c
]

{ #category : #accessing }
Counter >> count [ 
	"return the current value of the value instance variable"
	^ count
]

{ #category : #accessing }
Counter >> count: aNumber [
	count := aNumber
]

{ #category : #operation }
Counter >> decrement [
	self count: self count - 1
]

{ #category : #operation }
Counter >> increment [
	self count: self count + 1
]

{ #category : #initialization }
Counter >> initialize [
	self count: 0
]

{ #category : #printing }
Counter >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' with value: ';
		nextPutAll: self count.
]
