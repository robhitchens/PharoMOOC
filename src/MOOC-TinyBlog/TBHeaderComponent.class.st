Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault with: [ 
		html tbsNavbarBrand 
			url: '#'; 
			with: 'TinyBlog' ]
]
