Class {
	#name : #ToDoList,
	#superclass : #Object,
	#instVars : [
		'title',
		'items'
	],
	#classVars : [
		'Default'
	],
	#category : #'MOOC-SeasideBookTutorial-ToDo-Model'
}

{ #category : #accessing }
ToDoList class >> default [ 
	^ Default ifNil: [ Default := self new ]
]

{ #category : #initialization }
ToDoList class >> initializeExamples [
	"self initializeExamples"
	
self default 
	title: 'Seaside ToDo';
	add: (ToDoItem new 
		title: 'Finish todo app chapter';
		due: '11/15/2007' asDate;
		done: false);
	add: (ToDoItem new 
		title: 'Annotate first chapter';
		due: '04/21/2008' asDate;
		done: true);
	add: (ToDoItem new
		title: 'Watch out for UNIX Millenium bug';
		due: '01/19/2038' asDate;
		done: false)
]

{ #category : #'instance creation' }
ToDoList class >> new [ 
	^ self basicNew initialize
]

{ #category : #initialization }
ToDoList class >> reset [ 
	Default := nil
]

{ #category : #adding }
ToDoList >> add: aTodoItem [
	self items add: aTodoItem 
]

{ #category : #initialization }
ToDoList >> initialize [ 
	self items: OrderedCollection new
]

{ #category : #accessing }
ToDoList >> items [ 
	^ items
]

{ #category : #accessing }
ToDoList >> items: aList [
	items := aList
]

{ #category : #removing }
ToDoList >> remove: aTodoItem [
	self items remove: aTodoItem 
]

{ #category : #adding }
ToDoList >> replace: aTodoItem with: anotherItem [
	self items at: (self items indexOf: aTodoItem) put: anotherItem 
]

{ #category : #accessing }
ToDoList >> title [ 
	^ title
]

{ #category : #accessing }
ToDoList >> title: aString [
	title := aString
]
