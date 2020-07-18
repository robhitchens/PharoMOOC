Class {
	#name : #GuessingGameTask,
	#superclass : #WATask,
	#category : #'MOOC-SeasideBookTutorial-GuessingGame'
}

{ #category : #running }
GuessingGameTask >> go [ 
	| number guess numberOfGuesses |
	numberOfGuesses := 0.
	number := 100 atRandom.
	[ guess := (self request: 'Current attempts [',numberOfGuesses asString ,']. Enter your guess:') asNumber.
		guess < number
			ifTrue: [ 
				self inform: 'Your guess was too low'.
				numberOfGuesses := numberOfGuesses + 1 ].
		guess > number
			ifTrue: [ self inform: 'Your guess was too high'.
				 numberOfGuesses := numberOfGuesses + 1. ].
		guess = number ] whileFalse.
	self inform: 'You got it!'.
	numberOfGuesses := 0
]
