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
	#category : #'MOOC-TinyBlog-Main'
}

{ #category : #demo }
TBBlog class >> createDemoPosts [
	"TBBlog createDemoPosts"

	self current
		writeBlogPost:
			((TBPost
				title: 'Welcome in TinyBlog'
				text: 'TinyBlog is a small blog engine made with Pharo.'
				category: 'TinyBlog') visible: true);
		writeBlogPost:
			((TBPost
				title: 'Report Pharo Sprint'
				text:
					'Friday, June 12 there was a Pharo spring / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done'
				category: 'Pharo') visible: true);
		writeBlogPost:
			((TBPost
				title: 'Brick on top of Bloc - Preview'
				text:
					'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG.
				Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.'
				category: 'Pharo') visible: true);
		writeBlogPost:
			((TBPost
				title: 'The sad story of unclassified blog posts'
				text: 'So sad that I can read this.') visible: true);
		writeBlogPost:
			((TBPost
				title: 'Working with Pharo on the Raspberry Pi'
				text:
					'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.'
				category: 'Pharo') visible: true)
]

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
TBBlog >> allCategoriesWithVisibleBlogPost [
	^ ((self allBlogPosts select: [ :post | post isVisible ])
		collect: [ :visiblePost | visiblePost category ]) asSet
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :post | post isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :post | post category = aCategory and: [ post isVisible ] ]
]

{ #category : #'as yet unclassified' }
TBBlog >> deleteCategoryAndPosts: aCategory [
	"TODO this seems a little tedious removing all posts and then re writing all posts that aren't in the 
	category to be deleted"

	| updatedPosts |
	updatedPosts := (self allBlogPosts
		reject: [ :post | post category = aCategory ]) asOrderedCollection.
	self removeAllPosts.
	updatedPosts do: [ :post | self writeBlogPost: post ]
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

{ #category : #'as yet unclassified' }
TBBlog >> renameCategory: oldCategoryName to: newCategoryName [
	self allBlogPosts do: [ :post | (post category = oldCategoryName) ifTrue: [ post category: newCategoryName ] ]
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
