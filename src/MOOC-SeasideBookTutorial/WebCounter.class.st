"
A counter that can count up and down
"
Class {
	#name : #WebCounter,
	#superclass : #WAComponent,
	#instVars : [
		'count'
	],
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #testing }
WebCounter class >> canBeRoot [ 
	^ true
]

{ #category : #'class initialization' }
WebCounter class >> initialize [ 
	"WebCounter initialize"
	
	| app |
	app := WAAdmin register: self asApplicationAt: 'webcounter'.
]

{ #category : #actions }
WebCounter >> decrease [
	count := count - 1
]

{ #category : #actions }
WebCounter >> increase [ 
	count := count + 1
]

{ #category : #initialization }
WebCounter >> initialize [ 
	super initialize.
	count := 0
]

{ #category : #rendering }
WebCounter >> renderContentOn: html [ 
	html heading: count.
	html anchor callback: [ self increase ]; with: '++'.
	html space.
	html anchor callback: [ self decrease ]; with: '--'.
]
