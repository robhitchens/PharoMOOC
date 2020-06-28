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
	html table: [ 
		html tableRow: [ 
			html tableHeading: 'Calendars'.
			html tableData: '1/1/2006'.
			html tableData: 'Track events, holidays etc' ].
		html tableRow: [ 
			html tableHeading: 'TODO lists'.
			html tableData: '5/1/2006'.
			html tableData: 'Keep track of all the things to remember to do.' ].
		html tableRow: [ 
			html tableHeading: 'Shopping carts'.
			html tableData: '8/1/2006'.
			html tableData: 'Enable your customer to shop online.' ] ].
	html span class: 'error'; with: 'This site does not work yet'.
]

{ #category : #hooks }
ScrapBook >> style [ 
	^ 'h1 {text-align: center; color: green;}
	span.error {background-color: red; }'
]
