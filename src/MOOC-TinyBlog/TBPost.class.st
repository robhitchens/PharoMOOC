"
No real description, just following the TinyBlog MOOC tutorial
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'MOOC-TinyBlog'
}

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject 
]

{ #category : #accessing }
TBPost >> date [ 
	^ date
]

{ #category : #accessing }
TBPost >> date: anObject [
	date := anObject
	
]

{ #category : #accessing }
TBPost >> text [ 
	^ text
]

{ #category : #accessing }
TBPost >> text: anObject [
	text := anObject 
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: anObject [
	title := anObject 
]

{ #category : #accessing }
TBPost >> visible [
	^ visible 
]

{ #category : #accessing }
TBPost >> visible: anObject [
	visible := anObject 
]
