Class {
	#name : #TBAdminComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'report'
	],
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #hooks }
TBAdminComponent >> children [ 
	^ super children copyWith: self report
]

{ #category : #actions }
TBAdminComponent >> disconnect [
	self session logged: false.
	self gotoPostsList
]

{ #category : #'as yet unclassified' }
TBAdminComponent >> gotoPostsList [
	self call: TBPostsListComponent new
]

{ #category : #initialization }
TBAdminComponent >> initialize [ 
	super initialize.
	self report: (TBPostsReport from: self blog)
]

{ #category : #rendering }
TBAdminComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html tbsContainer: [ 
		html heading: 'Blog Admin'.
		html tbsGlyphIcon perform: #iconEyeOpen.
		html anchor 
			callback: [ self answer ];
			with: 'Public Area'.
		self renderDisconnectOn: html.
		html horizontalRule.
		html render: self report. ]
]

{ #category : #rendering }
TBAdminComponent >> renderDisconnectOn: html [
	self session isLogged
		ifFalse: [ ^ self ].
	html tbsGlyphIcon perform: #iconLock.
	html anchor callback: [ self disconnect ]; with: 'Disconnect'.
]

{ #category : #accessing }
TBAdminComponent >> report [
	^ report
]

{ #category : #accessing }
TBAdminComponent >> report: aReport [
	report := aReport 
]
