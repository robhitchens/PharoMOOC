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

{ #category : #rendering }
MiniInn >> renderContentOn: html [
	html heading: 'Starting date'.
	html render: calendar1.
	startDate ifNotNil: [ html text: 'Selected start: ', startDate asString ].
	html heading: 'Ending date'.
	html render: calendar2.
	(startDate isNotNil and: [ endDate isNotNil ]) 
		ifTrue: [ 
			html text: (endDate - startDate) days asString,
			' days from ', startDate asString, ' to ', endDate asString,' ' ]
]
