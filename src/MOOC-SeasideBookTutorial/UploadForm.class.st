Class {
	#name : #UploadForm,
	#superclass : #WAComponent,
	#category : #'MOOC-SeasideBookTutorial'
}

{ #category : #'as yet unclassified' }
UploadForm >> receiveFile: aFile [
	| workingDirectory stream |
	workingDirectory := ('C:\dev\uploads' asFileReference ensureCreateDirectory).
	stream := (workingDirectory / aFile fileName) binaryWriteStream.
	[ stream nextPutAll: aFile rawContents ]
		ensure: [ stream close ]
]

{ #category : #rendering }
UploadForm >> renderContentOn: html [ 
	html form multipart; with: [ 
		html fileUpload
			callback: [ :value | self receiveFile: value ].
		html submitButton: 'Send File' ]
]
