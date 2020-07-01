Class {
	#name : #IAContactView,
	#superclass : #WAComponent,
	#instVars : [
		'contact'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #accessing }
IAContactView >> contact [
	^ contact ifNil: [ contact := IAContact contacts first ]
]

{ #category : #accessing }
IAContactView >> contact: anIAContact [
	contact := anIAContact 
]

{ #category : #rendering }
IAContactView >> renderContentOn: html [ 
	| group |
	html form: [ 
		html text: 'Name: '.
		html textInput on: #name of: self contact.
		html break.
		html text: 'Email address: '.
		html textInput on: #emailAddress of: self contact.
		html break.
		
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
		"Checkbox"
		html text: 'Send email updates: '.
		html checkbox 
			value: self contact requestsEmailUpdates;
			callback: [ :value | self contact requestsEmailUpdates: value ].
		html break.
		"Date Input"
		html text: 'Birthday: '.
		html dateInput 
			callback: [ :value | self contact birthdate: value ];
			with: self contact birthdate.
		html break.
		html submitButton on: #save of: self ]
]

{ #category : #actions }
IAContactView >> save [ 
	"For now let's just display the contact information"
	self inform: self contact name,
	 	'--', self contact emailAddress,
		'--', self contact gender,
		'--', self contact requestsEmailUpdates printString,
		'--', self contact birthdate printString
]
