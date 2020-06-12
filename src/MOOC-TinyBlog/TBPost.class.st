"
No real description, just following the TinyBlog MOOC tutorial
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'MOOC-TinyBlog-Main'
}

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: someText [
	^ self new
		title: aTitle;
		text: someText;
		category: (self unclassifiedTag);
		yourself 
]

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: someText category: aCategory [
	^ self new
		title: aTitle;
		text: someText;
		category: aCategory;
		yourself
]

{ #category : #'as yet unclassified' }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #actions }
TBPost >> beVisible [
	self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject 
]

{ #category : #accessing }
TBPost >> date [ 
	^ date
]

{ #category : #accessing }
TBPost >> date: anObject [
	date := anObject
	
]

{ #category : #descriptions }
TBPost >> descriptionCategory [
	<magritteDescription>
	^ MAStringDescription new 
		label: 'Category';
		priority: 300;
		accessor: #category;
		comment: 'Unclassified if empty';
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
TBPost >> descriptionContainer [ 
	<magritteContainer>
		^ super descriptionContainer 
			componentRenderer: TBSMagritteFormRenderer;
			yourself
]

{ #category : #descriptions }
TBPost >> descriptionDate [
	<magritteDescription>
	^ MADateDescription new 
		label: 'Date';
		priority: 400;
		accessor: #date;
		beRequired;
		"Not sure if this is the correct way to validate that the date "
		min: (Date new);"Don't know if this works or not."
		yourself
]

{ #category : #descriptions }
TBPost >> descriptionText [
	<magritteDescription>
	^ MAMemoDescription new 
		label: 'Text';
		priority: 200;
		accessor: #text;
		beRequired;
		requiredErrorMessage: 'A blog post must contain a text.';
		comment: 'Please enter a text';
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #descriptions }
TBPost >> descriptionTitle [ 
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		priority: 100;
		accessor: #title;
		requiredErrorMessage: 'A blog post must have a title.';
		comment: 'Please enter a title';
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
		yourself 
]

{ #category : #descriptions }
TBPost >> descriptionVisible [ 
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Visible';
		priority: 500;
		accessor: #visible;
		componentClass: TBSMagritteCheckboxComponent;
		beRequired;
		yourself 
]

{ #category : #initialization }
TBPost >> initialize [
	self category: self class unclassifiedTag.
	self date: Date today.
	self notVisible 
]

{ #category : #testing }
TBPost >> isUnclassified [
	^ self category = self class unclassifiedTag 
]

{ #category : #actions }
TBPost >> isVisible [ 
	^ self visible
]

{ #category : #actions }
TBPost >> notVisible [
	self visible: false
]

{ #category : #accessing }
TBPost >> text [ 
	^ text
]

{ #category : #accessing }
TBPost >> text: anObject [
	text := anObject 
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: anObject [
	title := anObject 
]

{ #category : #accessing }
TBPost >> visible [
	^ visible 
]

{ #category : #accessing }
TBPost >> visible: anObject [
	visible := anObject 
]
