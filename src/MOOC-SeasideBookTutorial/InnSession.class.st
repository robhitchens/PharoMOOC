Class {
	#name : #InnSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'MOOC-SeasideBookTutorial-Calendars'
}

{ #category : #accessing }
InnSession >> isLoggedIn [
 ^ user isNil not
]

{ #category : #accessing }
InnSession >> login: aString [
	user := aString
]

{ #category : #accessing }
InnSession >> logout [
	user := nil.
	self expire.
	self redirectTo: 'http://www.seaside.st'
]

{ #category : #'parent/child' }
InnSession >> unregistered [
	super unregistered.
	user := nil
]

{ #category : #accessing }
InnSession >> user [
	^ user
]
