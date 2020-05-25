"
This is a TinyBlog Blog class
"
Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MOOC-TinyBlog'
}

{ #category : #accessing }
TBBlog class >> current [
	"answer the instance of the TBRepository"
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'class initialization' }
TBBlog class >> initialize [ 
	self reset
]

{ #category : #initialization }
TBBlog class >> reset [ 
	uniqueInstance := nil
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
TBBlog >> allBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :post | post category = aCategory ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allCategories [
	^ (self allBlogPosts collect: [ :post | post category ]) asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :post | post isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :post | post category = aCategory and: [ post isVisible ] ]
]

{ #category : #initialization }
TBBlog >> initialize [
	super initialize.
	posts := OrderedCollection new.
]

{ #category : #removing }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new
]

{ #category : #accessing }
TBBlog >> size [ 
	^ posts size
]

{ #category : #writing }
TBBlog >> writeBlogPost: aPost [
	"Write the blog post in database"
	posts add: aPost
]
