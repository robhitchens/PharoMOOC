Class {
	#name : #HotelTask,
	#superclass : #WATask,
	#instVars : [
		'startDate',
		'endDate'
	],
	#category : #'MOOC-SeasideBookTutorial-Calendars'
}

{ #category : #running }
HotelTask >> go [
	startDate := self call: (WAMiniCalendar new 
		canSelectBlock: [ :date | date > Date today ];
		addMessage: 'Select your starting date';
		yourself).
	endDate := self call: (WAMiniCalendar new 
		canSelectBlock: [ :date | startDate isNil or: [ startDate < date ] ];
		addMessage: 'Select your leaving date';
		yourself).
	self inform: 'from ', startDate asString, ' to ', endDate asString, ' ',(endDate - startDate) days asString, ' days'
]
