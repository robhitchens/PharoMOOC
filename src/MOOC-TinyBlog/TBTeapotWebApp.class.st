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
TBTeapotWebApp class >> restart [ 
	Server ifNil: [ Server := self new start ] ifNotNil: [ Server stop. Server start ]
]

{ #category : #'start/stop' }
TBTeapotWebApp class >> start [ 
	Server ifNil: [ Server := self new start ]
]

{ #category : #'start/stop' }
TBTeapotWebApp class >> stop [ 
	Server ifNotNil: [ Server stop. Server := nil ]
]

{ #category : #private }
TBTeapotWebApp >> allCategories [
	^ TBBlog current allCategories
]

{ #category : #private }
TBTeapotWebApp >> allPosts [
	^ TBBlog current allVisibleBlogPosts 
]

{ #category : #private }
TBTeapotWebApp >> allPostsForCategory: aCategory [
	^ TBBlog current allBlogPostsFromCategory: aCategory
]

{ #category : #route }
TBTeapotWebApp >> categoriesPage [
	^ String streamContents: [ :s |
		self renderPageHeaderOn: s.
		s << '<h1>All post categories</h1>'.
		s << '<ul>'.
		self allCategories do: [ :category | 
			s << '<li>'.
			(self renderLinkForCategory: category on: s).
			s << '</li>' ].
		s << '</ul>'.
		self renderHomeLinkOn: s.
		self renderPageFooterOn: s. ]
]

{ #category : #route }
TBTeapotWebApp >> errorPage [
	^ String streamContents: [ :s |
		self renderPageHeaderOn: s.
		s << '<p>Oups, an error occurred</p>'.
		self renderHomeLinkOn: s.
		self renderPageFooterOn: s ]
]

{ #category : #route }
TBTeapotWebApp >> homePage [
	^ String streamContents: [ :s | 
		self renderPageHeaderOn: s.
		s << '<h1>TinyBlog Web App</h1>'.
		s << '<ul>'.
		self allPosts withIndexDo: [ :aPost :index |
			s << '<li>';
				<< ('<a href="/post/', index asString, '">');
				<< aPost title;
				<< '</a></li>'].
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

{ #category : #route }
TBTeapotWebApp >> pageForCategory: aCategory [
	| currentPostsForCategory returnErrorPage |
	returnErrorPage := [ ^ self errorPage ].
	aCategory ifNil: returnErrorPage; ifEmpty: returnErrorPage.
	currentPostsForCategory := (self allPostsForCategory: aCategory).
	^ String streamContents: [ :s |
		self renderPageHeaderOn: s.
		s << '<h1>All posts for category "'; << aCategory; << '"</h1>'.
		currentPostsForCategory do: [ :post | 
				self renderPost: post on: s.
			].
		self renderHomeLinkOn: s.
		self renderPageFooterOn: s. ]
]

{ #category : #route }
TBTeapotWebApp >> pageForPostNumber: aPostNumber [
	| currentPost |
	currentPost := self allPosts at: aPostNumber ifAbsent: [ ^ self errorPage ].
	^ String streamContents: [ :s | 
			self renderPageHeaderOn: s.
			self renderPost: currentPost on: s.
"			s << ('<h1>', currentPost title, '</h1>').
			s << ('<h3>', currentPost date mmddyyyy, '</h3>').
			s << ('<p> Category: ', currentPost category, '</p>').
			s << ('<p>', currentPost text, '</p>')."
			self renderHomeLinkOn: s.
			self renderPageFooterOn: s ]
]

{ #category : #rendering }
TBTeapotWebApp >> renderHomeLinkOn: aStream [
	aStream << '<p><a href="/">Back to home page.</a></p>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderLinkForCategory: aCategory on: aStream [
	aStream << ('<a href="/posts/',aCategory,'">'); << aCategory ; << '</a>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageFooterOn: aStream [
	aStream << '</body></html>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderPageHeaderOn: aStream [
	aStream << '<html><body>'
]

{ #category : #rendering }
TBTeapotWebApp >> renderPost: aPost on: aStream [
	aStream << ('<h1>', aPost title, '</h1>');
			 	<< ('<h3>', aPost date mmddyyyy, '</h3>');
				<< ('<p> Category: ', aPost category, '</p>');
				<< ('<p>', aPost text, '</p>').
]

{ #category : #server }
TBTeapotWebApp >> start [ 
	teapot 
		GET: '/' -> [ self homePage ];
		GET: '/post/<id>' -> [ :request | self pageForPostNumber: (request at: #id) asNumber ];
		GET: '/categories' -> [ self categoriesPage ];
		GET: '/posts/<category>' -> [ :request | self pageForCategory: (request at: #category) asString];
		start
]

{ #category : #server }
TBTeapotWebApp >> stop [ 
	teapot stop
]
