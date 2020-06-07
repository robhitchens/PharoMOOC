Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'MOOC-TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	"TODO: further enhancement is to get header title from TBBlog"
	html tbsNavbar beDefault with: [ 
		html tbsNavbarBrand 
			url: '#'; 
			with: 'TinyBlog' ]
]
