Class {
	#name : #TBSession,
	#superclass : #WASession,
	#instVars : [
		'logged'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #accessing }
TBSession >> initialize [ 
	super initialize.
	self logged: false.
]

{ #category : #accessing }
TBSession >> isLogged [
	^ self logged
]

{ #category : #accessing }
TBSession >> logged [ 
	^ logged
]

{ #category : #accessing }
TBSession >> logged: anObject [ 
	logged := anObject
]
