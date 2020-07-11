Class {
	#name : #IAAddressTwoComponents,
	#superclass : #IAAddress,
	#instVars : [
		'list'
	],
	#category : #'MOOC-SeasideBookTutorial-iAddress'
}

{ #category : #hooks }
IAAddressTwoComponents >> children [ 
	^ super children , (Array with: list)
]

{ #category : #initialization }
IAAddressTwoComponents >> initialize [ 
	super initialize.
	list := PluggableContactListView new.
	list editor: editor
]

{ #category : #rendering }
IAAddressTwoComponents >> renderBarOn: html [
	html anchor 
		callback: [ list askAndCreateContact ];
		with: 'Add contact'
]

{ #category : #rendering }
IAAddressTwoComponents >> renderContentOn: html [ 
	html form: [ 
		self renderTitleOn: html.
		self renderBarOn: html.
		html break.
		html render: list.
		html horizontalRule.
		html render: editor ]
]
