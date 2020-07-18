Class {
	#name : #IAContactView,
	#superclass : #WAComponent,
	#instVars : [
		'contact'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #actions }
IAContactView >> cancel [ 
	self answer: false
]

{ #category : #accessing }
IAContactView >> contact [
	^ contact ifNil: [ contact := IAContact contacts first ]
]

{ #category : #accessing }
IAContactView >> contact: anIAContact [
	contact := anIAContact 
]

{ #category : #initialization }
IAContactView >> initialize [
	super initialize.
	self addDecoration: (WAFormDecoration new buttons: #(cancel save)).
]

{ #category : #rendering }
IAContactView >> renderContentOn: html [ 
	html form: [ 
		self renderNameOn: html.
		self renderEmailOn: html.
		self renderGenderOn: html.
		self renderSendUpdatesOn: html.
		self renderDateOn: html.
		"self renderSaveOn: html" ]
]

{ #category : #rendering }
IAContactView >> renderDateOn: html [
	"Date Input"
	html text: 'Birthday: '.
	html dateInput 
		callback: [ :value | self contact birthdate: value ];
		with: self contact birthdate.
	html break.
]

{ #category : #rendering }
IAContactView >> renderEmailOn: html [ 
	html text: 'Email address: '.
	html textInput on: #emailAddress of: self contact.
	html break.
]

{ #category : #rendering }
IAContactView >> renderGenderOn: html [ 
	| group |
	"Radio Buttns"
	html text: 'Gender: '.
	group := html radioGroup.
	group radioButton 
		selected: self contact isMale;
		callback: [ self contact beMale ].
	html text: 'Male'.
	group radioButton 
		selected: self contact isFemale;
		callback: [ self contact beFemale ].
	html text: 'Female'.
	html break.
]

{ #category : #rendering }
IAContactView >> renderNameOn: html [
	html text: 'Name: '.
	html textInput on: #name of: self contact.
	html break.
]

{ #category : #rendering }
IAContactView >> renderSaveOn: html [
	html submitButton on: #cancel of: self.
	html submitButton on: #save of: self
]

{ #category : #rendering }
IAContactView >> renderSendUpdatesOn: html [ 
	"Checkbox"
	html text: 'Send email updates: '.
	html checkbox 
		value: self contact requestsEmailUpdates;
		callback: [ :value | self contact requestsEmailUpdates: value ].
	html break.
]

{ #category : #actions }
IAContactView >> save [ 
	self answer: true
	"For now let's just display the contact information"
	"self inform: self contact name,
	 	'--', self contact emailAddress,
		'--', self contact gender,
		'--', self contact requestsEmailUpdates printString,
		'--', self contact birthdate printString"
]
