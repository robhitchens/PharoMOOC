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
		html horizontalRule.
		html render: self report. ]
]

{ #category : #accessing }
TBAdminComponent >> report [
	^ report
]

{ #category : #accessing }
TBAdminComponent >> report: aReport [
	report := aReport 
]
