"
This class contains methods as examples of coding in pharo with examples from the Pharo MOOC.
Most methods will be called using class side methods

Below are some more code examples from the MOOC, but are not challenges:
""'Hello World' asMorph openInWindow ""
""(ZnEasy getPng: 'http://pharo.org/web/files/pharo.png') asMorph openInWindow ""
""[ :x | x + 2 ] value: 5""
""ZnClient new 
url: 'https://en.wikipedia.org/w/index.php';
queryAt: 'title' put: 'Pharo';
queryAt: 'action' put: 'edit';
get.""
""1 to: 4 do: [ :i | Transcript show: i ; cr].""
""Don't know why they would use the << operator, whatever it is in the example""

""#(1 2 -4 -86) do: [ :each | Transcript show: each abs printString; cr ]""
""|fct|
fct := [ :x | x * x + 3].
fct value: 2.""

"
Class {
	#name : #MOOCChallenges,
	#superclass : #Object,
	#category : #'MOOC-Tutorial-Week1'
}

{ #category : #challenge }
MOOCChallenges class >> challengeFive [
	"This code does indeed work, also learning how to create a pair using '->' is pretty useful"

	| query result entries |
	query := UIManager default request: 'Find location for:'.
	result := STON
		fromString:
			(ZnClient new
				url: 'http://nominatim.openstreetmap.org/search/' , query;
				queryAt: 'format' put: 'jsonv2';
				queryAt: 'limit' put: '10';
				get;
				contents).
	entries := (result
		collect: [ :dct | 
			(dct at: 'display_name')
				-> ((dct at: 'lat') asNumber @ (dct at: 'lon') asNumber) ]).
	^ entries.
]

{ #category : #challenge }
MOOCChallenges class >> challengeFour [
	"This may not work since some of the assets are no longer available "
	"This code isn't tested, also I barely understand what is going on, still need to learn a little
	more before I can start working on a personal project using Pharo and Seaside."
	
	| window pane board background |
	background := AlphaImageMorph withForm: (ZnEasy getJpeg: 'http://i.imgur.com/XXxgr7x.jpeg').
	background lock.
	
	board := PasteUpMorph new.
	board
		color: Color gray;
		borderWidth: 3;
		borderColor: Color black;
		extent: background width@background height;
		backgroundMorph: background;
		addMorph: (CircleMorph new color: Color cyan; position: 41@23; yourself );
		addMorph: (Morph new color: Color orange; position: 1200@1200; yourself ).
	pane := ScrollPane new.
	pane scroller addMorph: board.
	
	window := pane openInWindow.
	window position: 20@20; extent: 420@420.
]

{ #category : #challenge }
MOOCChallenges class >> challengeOne [
	"Mooc challenge 1"
	"Get gravatar and display it in a morph"	
			
	| email url |
	email := 'stephane.ducasse@inria.fr'.
	url := 'http://www.gravatar.com/avatar/', (MD5 hashMessage: email trimBoth asLowercase) hex, '.jpg'.
	(ZnEasy getJpeg: url) asMorph openInWindow.
	"alternative would be to open in hand, but in order to close the morph 
	created by that method you would have to bring up the morphic halo using meta-click 
	(on windows is shift+alt+leftclick)
	"
]

{ #category : #challenge }
MOOCChallenges class >> challengeThree [
	"
		Two little challenges:
		* First, the web site http://api.geonames.org/countryInfoJSON gives information in JSON
		about countries and you chould extract the capitals. You can use the 'demo' and '' as login an password.
		* Second, the web site http://www.omdbapi.com/ offers an api to get information about movies. For
		example using t allows one to specify the title of a movie. Define a query to get the poster of 'The Terminator'
		
		Hints:
		* Have a look at ZnEasy or ZnClient.
		* To get the contents of an HTML request, send it the message contents.
		* To parse and convert a string representing JSON into Pharo collection,
		use the STON class (check the class side).
		* To pass a binding to a request, use the message queryAt:put:.
		* Using the inspector is a good idea to explore objects and query results
	"
	^ ((STON fromString: (
		ZnEasy 
			get: 'http://api.geonames.org/coutryInfoJSON'
			username: 'demo'
			password: '') contents) at: #geonames) collect: [ :d | d at: #capital ].
]

{ #category : #challenge }
MOOCChallenges class >> challengeThree_Two [
	"This call won't work since now omdbapi requires the use of an api key."
	"Alright, so this call won't work since I keep getting 404's on the poster api from omdb"
	(ZnEasy getJpeg: ((STON fromString: (ZnClient new 
		url: 'http://img.omdbapi.com/'; "Changed to make the api more correct with omdb"
		queryAt: 't' put: 'The Terminator';
		queryAt: 'apikey' put: 'f06e6189';
		get;"Don't know what's going on, it keeps saying the apikey is invalid although it should be activated now."
		contents)) at: #Poster)) inspect.
]

{ #category : #challenge }
MOOCChallenges class >> challengeTwo [
	"Extract sprites from a larger png file such as the one we can find at 
	http://gaurav.munjal.us/Universal-LPC-Spritesheet-Character-Generator/.
	Hints: 
		- You can read and convert a PNG into a form (a graphics pharo basic element) using PNGReadWriter.
		- Have a look at the message binaryReadStreamDo: .
		- Use asFileReference of FileSystem workingDirectory if the file is located close to the 
		pharo.image file to get to a file.
		- You can use the message / to specify a file name in the path.
		- Pay attention the stream should be binary.
		- You can access the size of a form using message width and height.
		- You can copy a part of a form using the message form copy: aRectangle.
		- Looking at the result of expressions with the inspector is a great idea.
	"
	"Solution:
		The file for reading in is located {pharo images location}/Pharo Mooc/images/Sprites.png
		to see the results inspect the output the self value of each form object will contain the png image.
	"
	| form sprites |
	form := 'images/Sprites.png' asFileReference
		binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ].
	sprites := OrderedCollection new.
	0 to: (form width - 64) by: 64 do: [ :x |
			0 to: (form height - 64) by: 64 do: [ :y |
					sprites add: (form copy: (x@y corner: (x+64)@(y+64)))
				]
		 ].
	^ sprites 
]

{ #category : #challenge }
MOOCChallenges class >> challengeZero [
	"MOOC challenge zero"
	"Get png of pharo logo and display in a morph"	
	
	(ZnEasy getPng: 'http://pharo.org/files/pharo.png') asMorph openInWindow.
]

{ #category : #justFun }
MOOCChallenges class >> getMoviePosterAsMorph: title [
	^ (ZnEasy getJpeg: ((STON fromString: (ZnClient new 
	url: 'http://www.omdbapi.com/';
	queryAt: 't' put: title;
	queryAt: 'apikey' put: 'f06e6189';
	get;
	contents)) at: #Poster)) asMorph.
]
