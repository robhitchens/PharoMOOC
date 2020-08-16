Class {
	#name : #ComponentWithForm,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial-FileServer'
}

{ #category : #rendering }
ComponentWithForm >> renderContentOn: html [
	html image form: (EllipseMorph new 
		color: Color orange;
		extent: 200 @ 100;
		borderWidth: 3;
		imageForm)
]
