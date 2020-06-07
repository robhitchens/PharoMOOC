Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #accessing }
TBPostsListComponent >> currentCategory [
	^ currentCategory 
]

{ #category : #accessing }
TBPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject 
]

{ #category : #'as yet unclassified' }
TBPostsListComponent >> readSelectedPosts [
	^ self currentCategory 
		ifNil: [ self blog allVisibleBlogPosts ]
		ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #rendering }
TBPostsListComponent >> renderCategoryColumnOn: html [ 
	html tbsColumn 
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ 
"			self basicRenderCategoriesOn: html."
			self renderSignInOn: html ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html render: (TBCategoriesComponent 
		categories: (self blog allCategories) postsList: self).
	html tbsContainer: [ 
		self readSelectedPosts do: [ :post | 
			html render: (TBPostComponent new post: post) ] ]
	"	html render: (TBAuthenticationComponent from: self).
	html tbsContainer: [ 
		html tbsRow 
			showGrid ;
			with: [ self renderCategoryColumnOn: html.
				self renderPostColumnOn: html ] ]"
]

{ #category : #rendering }
TBPostsListComponent >> renderSignInOn: html [ 
	html tbsGlyphIcon perform: #iconLock.
	html html: '<a data-toggle="modal" href="#myAuthDialog" class="link">SignIn</a>'.
]
