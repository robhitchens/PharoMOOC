Class {
	#name : #ScrapBook,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #rendering }
ScrapBook >> renderContentOn: html [ 
	html paragraph: [ 
		html text: 'today: '.
		html text: Date today ]
]
