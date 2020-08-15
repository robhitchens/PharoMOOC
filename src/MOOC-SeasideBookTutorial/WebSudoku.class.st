Class {
	#name : #WebSudoku,
	#superclass : #WAComponent,
	#instVars : [
		'sudoku'
	],
	#category : #'MOOC-SeasideBookTutorial-ML-WebSudoku'
}

{ #category : #'class initialization' }
WebSudoku class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WebSudoku class >> description [ 
	^ 'Play Sudoku'
]

{ #category : #'class initialization' }
WebSudoku class >> initialize [ 
	WAAdmin register: self asApplicationAt: 'sudoku'
]

{ #category : #initialization }
WebSudoku >> initialize [ 
	super initialize.
	sudoku := MLSudoku new
]

{ #category : #rendering }
WebSudoku >> renderBoardOn: html [ 
	html table: [ 
		html tableRow: [ 
			self renderHeaderFor: '' on: html.
			1 to: 9 do: [ :col |
				self renderHeaderFor: col asString on: html ] ].
		1 to: 9 do: [ :row |
			html tableRow: [ 
				self renderHeaderFor: row asSudokuRow on: html.
				1 to: 9 do: [ :col | self renderCellAtRow: row col: col on: html ] ] ] ]
]

{ #category : #rendering }
WebSudoku >> renderCellAtRow: rowInteger col: colInteger on: html [ 
	html tableData 
		class: 'sudokuHBoarder' if: rowInteger \\ 3 == 0;
		class: 'sudokuVBoarder' if: colInteger \\ 3 == 0;
		with: [ self renderCellContentAtRow: rowInteger col: colInteger on: html ]
]

{ #category : #rendering }
WebSudoku >> renderCellContentAtRow: rowInteger col: colInteger on: html [ 
	| currentCell possibilities |
	currentCell := MLCell row: rowInteger col: colInteger.
	possibilities := sudoku possibilitiesAt: currentCell.
	possibilities numberOfPossibilities = 1 
		ifTrue: [ ^ html text: possibilities asCompactString ].
	html span 
		class: 'sudokuPossibilities';
		with: possibilities asCompactString.
	html break.
	html form: [ 
		html textInput 
			size: 2;
			callback: [ :value |
				| integerValue |
				integerValue := value asInteger.
				integerValue isNil ifFalse: [ 
					(possibilities includes: integerValue)
						ifTrue: [ self setCell: currentCell to: integerValue ] ] ] ]
]

{ #category : #rendering }
WebSudoku >> renderContentOn: html [ 
	html div id: 'sudokuBoard'; with: [
		self renderBoardOn: html. 
		sudoku solved ifFalse: [ 
			html break.
			html anchor 
				callback: [ sudoku := sudoku solve ];
				with: 'Solve' ] ]
]

{ #category : #rendering }
WebSudoku >> renderHeaderFor: aString on: html [ 
	html tableData 
		class: 'sudokuHeader';
		class: 'sudokuHBorder';
		class: 'sudokuVBorder';
		with: aString
]

{ #category : #initialization }
WebSudoku >> setCell: aCurrentCell to: anInteger [
	sudoku := sudoku copy 
		atCell: aCurrentCell 
		removeAllPossibilitiesBut: anInteger 
]

{ #category : #hooks }
WebSudoku >> states [
	^ Array with: self
]

{ #category : #hooks }
WebSudoku >> style [ 
	^ '
	#sudokuBoard .sudokuHeader { 
		font-weight: bold;
		color: white;
		background-color: #888888;
	}
	#sudokuBoard .sudokuHBorder { 
		border-bottom: 2px solid black;
	}
	#sudokuBoard .sudokuVBorder {
		border-right: 2px solid black;
	}
	#sudokuBoard .sudokuPossibilities { 
		font-size: 9px;
	}
	#sudokuBoard td { 
		border: 1px solid #dddddd;
		text-align: center;
		width: 55px;
		height: 55px;
		font-size: 14px;
	}
	#sudokuBoard table {  
		border-collapse: collapse;
	}
	#sudokuBoard a {  
		text-decoration: none;
		color: #888888;
	}
	#sudokuBoard a:hover {  
		color: black;
	}
	'
]
