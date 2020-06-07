Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #testing }
TBApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
TBApplicationRootComponent class >> initialize [ 
	"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app 
		addLibrary: JQDeploymentLibrary ;
		addLibrary: JQUiDeploymentLibrary ;
		addLibrary: TBSDeploymentLibrary 
]

{ #category : #hooks }
TBApplicationRootComponent >> children [ 
	"Note: the use of curly braces here is to indicate a runtime array literal"
	^ { main }
]

{ #category : #initialization }
TBApplicationRootComponent >> initialize [ 
	super initialize.
	main := TBPostsListComponent new.
]

{ #category : #accessing }
TBApplicationRootComponent >> main: aComponent [
	main := aComponent 
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [ 
	html render: main
]

{ #category : #updating }
TBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'.
]
