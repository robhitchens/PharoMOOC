Class {
	#name : #ComponentWithStyle,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-FileServer'
}

{ #category : #rendering }
ComponentWithStyle >> renderContentOn: html [
	html heading level: 1; with: 'Seaside'.
	html text: 'This component uses the Seaside style. '.
	html anchor url: (MyFileLibrary / #firebaseJson); with: 'firebase.json'.
]

{ #category : #updating }
ComponentWithStyle >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: 'http://seaside.st/styles/main.css'
]
