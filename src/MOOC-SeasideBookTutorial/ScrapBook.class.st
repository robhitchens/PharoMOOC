Class {
	#name : #ScrapBook,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #accessing }
ScrapBook >> items [ 
	^ #('Calendars' 'Todo lists' 'Shopping carts' 'And lots more...')
]

{ #category : #rendering }
ScrapBook >> renderContentOn: html [
	html heading: 'Hello world'.
	html
		paragraph:
			'Welcome to my Seaside web site. In the future you will find all sorts of applications here such as:'.
	html
		orderedList: [ 
			self items do: [ :each | html listItem: each ] ]
]
