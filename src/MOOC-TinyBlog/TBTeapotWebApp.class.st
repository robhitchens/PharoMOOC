Class {
	#name : #TBTeapotWebApp,
	#superclass : #Object,
	#instVars : [
		'teapot'
	],
	#classVars : [
		'Server'
	],
	#category : #'MOOC-TinyBlog-Teapot'
}

{ #category : #'start/stop' }
TBTeapotWebApp class >> start [ 
	Server ifNil: [ Server := self new start ]
]

{ #category : #'start/stop' }
TBTeapotWebApp class >> stop [ 
	Server ifNotNil: [ Server stop. Server := nil ]
]

{ #category : #'as yet unclassified' }
TBTeapotWebApp >> allPosts [
	^ TBBlog current allVisibleBlogPosts 
]

{ #category : #route }
TBTeapotWebApp >> homePage [
	^ String streamContents: [ :s | 
		self renderPageHeaderOn: s.
		s << '<h1>TinyBlog Web App</h1>'.
		s << '<ul>'.
		self allPosts do: [ :aPost |
			s << ('<li>', aPost title, '</li>') ].
		s << '</ul>'.
		self renderPageFooterOn: s. ]
]

{ #category : #initialization }
TBTeapotWebApp >> initialize [ 
	super initialize.
	"Note: example from document was using a runtime array '{}' don't know if using a compile time array will cause a problem.
	Using an array literal for pairs did indeed cause a problem"
	teapot := Teapot configure: { 
		#port -> 8081.
		#debugMode -> true }.
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageFooterOn: aStream [
	aStream << '</body></html>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageHeaderOn: aStream [
	aStream << '<html><body>'
]

{ #category : #server }
TBTeapotWebApp >> start [ 
	teapot 
		GET: '/' -> [ self homePage ];
		start
]

{ #category : #server }
TBTeapotWebApp >> stop [ 
	teapot stop
]
