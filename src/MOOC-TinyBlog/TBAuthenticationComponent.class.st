Class {
	#name : #TBAuthenticationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'password',
		'account',
		'component'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #'instance creation' }
TBAuthenticationComponent class >> from: aComponent [
	^ self new component: aComponent 
]

{ #category : #accessing }
TBAuthenticationComponent >> account [
	^ account
]

{ #category : #accessing }
TBAuthenticationComponent >> account: anObject [
	^ account := anObject 
]

{ #category : #accessing }
TBAuthenticationComponent >> component [ 
	^ component 
]

{ #category : #accessing }
TBAuthenticationComponent >> component: anObject [
	component := anObject
]

{ #category : #accessing }
TBAuthenticationComponent >> password [ 
	^ password
]

{ #category : #accessing }
TBAuthenticationComponent >> password: anObject [
	^ password := anObject 
]

{ #category : #rendering }
TBAuthenticationComponent >> renderContentOn: html [
	html tbsModal 
		id: 'myAuthDialog';
		with: [ html tbsModalContent: [ 
				self renderHeaderOn: html.
				html tbsModalBody: [ 
					html form: [ 
						self renderInputAccountOn: html.
						html break.
						self renderInputPasswordOn: html.
						html break.
						html break.
						html tbsModalFooter: [ 
							self renderOkCancelOn: html ] ] ] ] ]
]

{ #category : #rendering }
TBAuthenticationComponent >> renderHeaderOn: html [ 
	html tbsModalHeader: [ 
		html tbsModalCloseIcon.
		html tbsModalTitle 
			level: 4;
			with: 'Authentication' ]
]

{ #category : #rendering }
TBAuthenticationComponent >> renderInputAccountOn: html [ 
	html text: 'Account:'.
	html break.
	html textInput 
		callback: [ :value | account := value ];
		value: account
]

{ #category : #rendering }
TBAuthenticationComponent >> renderInputPasswordOn: html [ 
	html text: 'Password:'.
	html break.
	html passwordInput 
		callback: [ :value | password := value ];
		value: password
]

{ #category : #rendering }
TBAuthenticationComponent >> renderOkCancelOn: html [ 
	html tbsButton 
		attributeAt: 'type' put: 'button';
		value: 'Cancel'.
	html tbsSubmitButton 
		bePrimary;
		callback: [ self validate ];
		value: 'SignIn'
]

{ #category : #accessing }
TBAuthenticationComponent >> validate [
 "TODO don't know if alert will be implemented later or if this part of the tutorial isn't correct"
	(self account = 'admin' and: [ self password = 'password' ])
		ifTrue: [ self component alertSuccess: 'Success!' ]
]
