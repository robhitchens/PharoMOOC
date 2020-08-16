Class {
	#name : #ComponentWithExternalResource,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-FileServer'
}

{ #category : #rendering }
ComponentWithExternalResource >> renderContentOn: html [
"	html image url: 'http://www.seaside.st/styles/logo-plain.png'"
	html image resourceUrl: 'styles/logo-plain.png'
]
