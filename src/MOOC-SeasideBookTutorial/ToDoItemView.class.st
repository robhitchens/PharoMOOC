Class {
	#name : #ToDoItemView,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'MOOC-SeasideBookTutorial-ToDo-View'
}

{ #category : #accessing }
ToDoItemView >> model [ 
	^ model
]

{ #category : #accessing }
ToDoItemView >> model: aModel [ 
	model := aModel
]

{ #category : #rendering }
ToDoItemView >> renderContentOn: html [
	html heading: 'Edit'.
	html form: [ 
		html text: 'Title:'; break.
		html textInput 
			value: self model title;
			callback: [ :value | self model title: value ].
		html break.
		html text: 'Due:'; break.
		html dateInput 
			value: self model due;
			callback: [ :value | self model due: value ].
		html break.
		html submitButton 
			callback: [ self answer: self model ];
			text: 'Save'.
		html cancelButton 
			callback: [ self answer: nil ];
			text: 'Cancel' ]
]

{ #category : #hooks }
ToDoItemView >> style [ 
	^ '
	body {
		color: #222;
		font-size: 75%;
		font-family: "Helvetica Neue", Helvetica, Arial, snas-serif;
	}
	h1 {
		color: #111;
		font-size: 2em;
		font-weight: normal;
		margin-bottom: 0.5em;
	}'
]
