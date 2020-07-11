Class {
	#name : #ReadOnlyOneLinerContactView,
	#superclass : #IAContactView,
	#instVars : [
		'parent'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #accessing }
ReadOnlyOneLinerContactView >> parent: aParent [
	parent := aParent 
]

{ #category : #rendering }
ReadOnlyOneLinerContactView >> renderContentOn: html [ 
	html anchor 
		callback: [ parent editContact: self contact ];
		with: self contact name.
	html space.
	html text: self contact emailAddress.
	html space.
	html anchor 
		callback: [ parent removeContact: self contact ];
		with: '--'.
	html break.
]
