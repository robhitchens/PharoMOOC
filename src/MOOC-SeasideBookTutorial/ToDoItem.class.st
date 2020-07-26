Class {
	#name : #ToDoItem,
	#superclass : #Object,
	#instVars : [
		'title',
		'due',
		'done'
	],
	#category : #'MOOC-SeasideBookTutorial-ToDo-Model'
}

{ #category : #'instance creation' }
ToDoItem class >> new [ 
	^ self basicNew initialize
]

{ #category : #accessing }
ToDoItem >> done [ 
	^ done
]

{ #category : #accessing }
ToDoItem >> done: aBoolean [
	done := aBoolean 
]

{ #category : #accessing }
ToDoItem >> due [
	^ due
]

{ #category : #accessing }
ToDoItem >> due: aDate [ 
	due := aDate asDate 
]

{ #category : #initialization }
ToDoItem >> initialize [ 
	self title: 'ToDo Item'.
	self due: Date tomorrow.
	self done: false.
]

{ #category : #testing }
ToDoItem >> isDone [
	^ self done
]

{ #category : #testing }
ToDoItem >> isOverdue [
	^ self isDone not and: [ Date today > self due ]
]

{ #category : #accessing }
ToDoItem >> title [ 
	^ title
]

{ #category : #accessing }
ToDoItem >> title: aString [ 
	title := aString
]
