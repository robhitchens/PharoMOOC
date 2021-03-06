Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'MOOC-TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [ 
	blog := TBBlog current.
	blog removeAllPosts.
	
	first := TBPost title: 'A title' text: 'A text' category: 'First Category'.
	blog writeBlogPost: first.
	
	post := (TBPost title: 'Another title' text: 'Another text' category: 'Second Category') beVisible 
]

{ #category : #running }
TBBlogTest >> tearDown [ 
	TBBlog reset
]

{ #category : #tests }
TBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPostsFromCategory [
	self assert: (blog allBlogPostsFromCategory: 'First Category')
		size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllCategoriesWithVisibleBlogPost [
	blog writeBlogPost: post.
	self assert: blog allCategoriesWithVisibleBlogPost size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First Category') size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: 'Second Category') size equals: 1
]

{ #category : #tests }
TBBlogTest >> testDeleteACategoryAndPosts [
	| categoryToDelete |
	categoryToDelete := 'Second Category'.
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2.
	self assert: ((blog allBlogPostsFromCategory: categoryToDelete) size) equals: 1.
	blog deleteCategoryAndPosts: categoryToDelete.
	self assert: blog allCategories size equals: 1.
	self assert: ((blog allBlogPostsFromCategory: categoryToDelete) size) equals: 0
]

{ #category : #tests }
TBBlogTest >> testMovePostToCategory [
	| testPost newPostCategory existingPostCategory |
	testPost := TBPost title: 'test' text: 'some text' category: 'ExampleCategory'.
	existingPostCategory := testPost category.
	newPostCategory := 'NewCategory'.
	self assert: testPost category equals: existingPostCategory.
	blog movePost: testPost to: newPostCategory.
	self assert: testPost category equals: newPostCategory
]

{ #category : #tests }
TBBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testRemoveBlogPost [
	self assert: blog size equals: 1.
	blog removeBlogPost: blog allBlogPosts anyOne.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testRenameCategoryTo [
	| categoryToRename newCategoryName |
	categoryToRename := 'Second Category'.
	newCategoryName := 'First Category'.
	blog writeBlogPost: post.
	self assert: (blog allCategories size) equals: 2.
	blog renameCategory: categoryToRename to: newCategoryName.
	self assert: (blog allCategories size) equals: 1.
	"TODO need to figure out how to verify that the set element's category is newCategoryName"
	"self assert: (blog allCategories at: 1) category equals: newCategoryName"
]

{ #category : #tests }
TBBlogTest >> testSize [ 
	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allBlogPosts select: [ :thisPost | thisPost isUnclassified ]) size equals: 0
]
