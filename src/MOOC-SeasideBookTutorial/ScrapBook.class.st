Class {
	#name : #ScrapBook,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #rendering }
ScrapBook >> renderContentOn: html [ 
	html paragraph: 'Fun with Smalltalk and Seaside.'.
	html paragraph: [ 
		10 timesRepeat: [ 
			html image 
				url: 'http://www.seaside.st/styles/logo-plain.png';
				width: 50 ].
			html horizontalRule  ]
]
