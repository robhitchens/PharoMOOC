Class {
	#name : #ToDoListView,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-ToDo-View'
}

{ #category : #'class initialization' }
ToDoListView class >> initialize [ 
	"self initialize"
	WAAdmin register: self asApplicationAt: 'todo'
]

{ #category : #adding }
ToDoListView >> add [
	self model add: ToDoItem new
]

{ #category : #actions }
ToDoListView >> edit: anItem [
	| edited |
	edited := self call: (ToDoItemView new model: anItem copy).
	edited isNil 
		ifFalse: [ self model replace: anItem with: edited ]
		
]

{ #category : #accessing }
ToDoListView >> model [ 
	^ ToDoList default
]

{ #category : #removing }
ToDoListView >> remove: anItem [
	(self confirm: 'Are you sure you want to remove ', anItem title printString, '?')
	ifTrue: [ self model remove: anItem ]
]

{ #category : #rendering }
ToDoListView >> renderContentOn: html [
	html heading: self model title.
	html form: [  
	html anchor 
		callback: [ self add ];
		with: 'add'.
	html unorderedList: [ self renderItemsOn: html ] .
	html submitButton: 'Save' ]
]

{ #category : #rendering }
ToDoListView >> renderItem: anItem on: html [ 
	html listItem 
		class: 'done' if: anItem isDone;
		class: 'overdue' if: anItem isOverdue;
		with: [ 
			html checkbox 
				value: anItem done;
				callback: [ :value | anItem done: value ].
			html text: anItem title.
			html space.
			html anchor 
				callback: [ self edit: anItem ];
				with: 'edit'.
			html space.
			html anchor 
				callback: [ self remove: anItem ];
				with: 'remove' ]
]

{ #category : #rendering }
ToDoListView >> renderItemsOn: html [
	self model items 
		do: [ :each | self renderItem: each on: html ]
]

{ #category : #hooks }
ToDoListView >> style [ 
	^ '
	body{
		color: #222;
		font-size: 75%;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	h1 {
		color: #111;
		font-size: 2em;
		font-weight: normal;
		margin-bottom: 0.5em;
	}
	ul { 
		list-style: none;
		padding-left: 0;
		margin-bottom: 1em;
	}
	li.overdue { 
		color: #8a1f11;
	}
	li.done { 
		color: #264409;
	}'
]
