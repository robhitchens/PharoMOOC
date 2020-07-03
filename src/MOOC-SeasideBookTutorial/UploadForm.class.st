Class {
	#name : #UploadForm,
	#superclass : #WAComponent,
	#instVars : [
		'file',
		'workingDirectory'
	],
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #'as yet unclassified' }
UploadForm >> downloadFile [
	self requestContext
		respond: [ :response | 
			| readStream |
			readStream := file binaryReadStream.
			[ response
				contentType: 'application/octet-stream';
				document: readStream contents;
				attachmentWithFileName: file asPath basename ]
			ensure: [ readStream close ] ] 
]

{ #category : #accessing }
UploadForm >> file [
	^ file
]

{ #category : #accessing }
UploadForm >> file: aFile [
	file := aFile
]

{ #category : #initialization }
UploadForm >> initialize [ 
	super initialize.
	self workingDirectory: ('C:\dev\uploads' asFileReference ensureCreateDirectory).
]

{ #category : #'as yet unclassified' }
UploadForm >> receiveFile: aFile [
	| stream |
	stream := (workingDirectory / aFile fileName) binaryWriteStream.
	[ stream nextPutAll: aFile rawContents ]
		ensure: [ stream close ].
		file := (workingDirectory / aFile fileName) asFileReference.
]

{ #category : #rendering }
UploadForm >> renderContentOn: html [ 
	html form multipart; with: [ 
		html fileUpload
			callback: [ :value | self receiveFile: value ].
		html submitButton: 'Send File' ].
	file ifNotNil: [ 
		html anchor 
			callback: [ self downloadFile ];
			with: 'Download' ]
]

{ #category : #accessing }
UploadForm >> workingDirectory [
	^ workingDirectory
]

{ #category : #accessing }
UploadForm >> workingDirectory: aFileReference [
	workingDirectory := aFileReference 
	
]
