Class {
	#name : #MiniInn,
	#superclass : #WAComponent,
	#instVars : [
		'calendar1',
		'calendar2',
		'startDate',
		'endDate'
	],
	#category : #'MOOC-SeasideBookTutorial-Calendars'
}

{ #category : #'class initialization' }
MiniInn class >> initialize [ 
	| application |
	application := WAAdmin register: self asApplicationAt: 'miniInn'.
	application preferenceAt: #sessionClass put: InnSession.
	"TODO the expiryPolicy message doesn't seem to exist anymore."
"	application cache expiryPolicy configuration at: #cacheTimeout put: 1200"
]

{ #category : #hooks }
MiniInn >> children [ 
	^ Array with: calendar1 with: calendar2 
]

{ #category : #initialization }
MiniInn >> initialize [ 
	super initialize.
	calendar1 := WAMiniCalendar new.
	calendar1 
		canSelectBlock: [ :date | Date today < date ];
		onAnswer: [ :date | startDate := date ].
	calendar2 := WAMiniCalendar new.
	calendar2
		canSelectBlock: [ :date | startDate isNil or: [ startDate < date ] ];
		onAnswer: [ :date | endDate := date ]
]

{ #category : #'private protocol' }
MiniInn >> login [ 
	self session login: (self request: 'Enter your name:')
]

{ #category : #'private protocol' }
MiniInn >> logout [
	self session logout
]

{ #category : #rendering }
MiniInn >> renderContentOn: html [
	self renderLogin: html.
	html heading: 'Starting date'.
	html render: calendar1.
	startDate ifNotNil: [ html text: 'Selected start: ', startDate asString ].
	html heading: 'Ending date'.
	html render: calendar2.
	(startDate isNotNil and: [ endDate isNotNil ]) 
		ifTrue: [ 
			html text: (endDate - startDate) days asString,
			' days from ', startDate asString, ' to ', endDate asString,' ' ].
	self session isLoggedIn 
		ifTrue: [ self renderSpecialPrice: html ]
]

{ #category : #'private protocol' }
MiniInn >> renderLogin: html [
	self session isLoggedIn 
		ifTrue: [ 
			html text: 'Logged in as: ', self session user, ' '.
			html anchor 
				callback: [ self logout ];
				with: 'Logout' ]
		ifFalse: [ 
			html anchor
				callback: [ self login ];
				with: 'Login' ]
]

{ #category : #'private protocol' }
MiniInn >> renderSpecialPrice: html [ 
	html text: 'Dear ', self session user, ', you can benefit from out special prices!'
]
