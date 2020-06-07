Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #acccessing }
TBScreenComponent >> blog [
	"Return the current blog, in the future we will ask the session to return the blog of the currently logged user."
	^ TBBlog current
]

{ #category : #hooks }
TBScreenComponent >> children [ 
	^ OrderedCollection with: header
]

{ #category : #initialization }
TBScreenComponent >> initialize [ 
	super initialize .
	header := TBHeaderComponent new.
]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [ 
	html render: header 
]
