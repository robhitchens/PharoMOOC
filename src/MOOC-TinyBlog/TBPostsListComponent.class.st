Class {
	#name : #TBPostsListComponent,
	#superclass : #WAComponent,
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> renderCategoryColumnOn: html [ 
	html tbsColumn 
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ 
			self basicRenderCategoriesOn: html.
			self renderSignInOn: html ]
]

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html render: (TBAuthenticationComponent from: self).
	html tbsContainer: [ 
		html tbsRow 
			showGrid ;
			with: [ self renderCategoryColumnOn: html.
				self renderPostColumnOn: html ] ]
]

{ #category : #rendering }
TBPostsListComponent >> renderSignInOn: html [ 
	html tbsGlyphIcon perform: #iconLock.
	html html: '<a data-toggle="modal" href="#myAuthDialog" class="link">SignIn</a>'.
]
