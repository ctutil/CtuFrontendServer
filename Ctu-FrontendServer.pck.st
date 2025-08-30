'From Cuis7.0 [latest update: #6452] on 27 August 2025 at 6:40:53 pm'!
'Description '!
!provides: 'Ctu-FrontendServer' 1 137!
!requires: 'Cuis-Web' 1 38 nil!
!requires: 'Regex-Core' 1 6 nil!
!requires: 'WebClient' 1 35 nil!
SystemOrganization addCategory: #'Ctu-FrontendServer'!


!classDefinition: #D3Test category: #'Ctu-FrontendServer'!
TestCase subclass: #D3Test
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'D3Test class' category: #'Ctu-FrontendServer'!
D3Test class
	instanceVariableNames: ''!

!classDefinition: #FSServerTest category: #'Ctu-FrontendServer'!
TestCase subclass: #FSServerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSServerTest class' category: #'Ctu-FrontendServer'!
FSServerTest class
	instanceVariableNames: ''!

!classDefinition: #FSTextTest category: #'Ctu-FrontendServer'!
TestCase subclass: #FSTextTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSTextTest class' category: #'Ctu-FrontendServer'!
FSTextTest class
	instanceVariableNames: ''!

!classDefinition: #JSTest category: #'Ctu-FrontendServer'!
TestCase subclass: #JSTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'JSTest class' category: #'Ctu-FrontendServer'!
JSTest class
	instanceVariableNames: ''!

!classDefinition: #FSServer category: #'Ctu-FrontendServer'!
WebServer subclass: #FSServer
	instanceVariableNames: 'staticContentPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSServer class' category: #'Ctu-FrontendServer'!
FSServer class
	instanceVariableNames: ''!

!classDefinition: #FSApp category: #'Ctu-FrontendServer'!
Object subclass: #FSApp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSApp class' category: #'Ctu-FrontendServer'!
FSApp class
	instanceVariableNames: ''!

!classDefinition: #FSData category: #'Ctu-FrontendServer'!
Object subclass: #FSData
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSData class' category: #'Ctu-FrontendServer'!
FSData class
	instanceVariableNames: ''!

!classDefinition: #FSText category: #'Ctu-FrontendServer'!
Object subclass: #FSText
	instanceVariableNames: 'separator keyValues file'
	classVariableNames: 'DefaultSeparator'
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSText class' category: #'Ctu-FrontendServer'!
FSText class
	instanceVariableNames: ''!

!classDefinition: #FSWeb category: #'Ctu-FrontendServer'!
Object subclass: #FSWeb
	instanceVariableNames: 'rendered'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'FSWeb class' category: #'Ctu-FrontendServer'!
FSWeb class
	instanceVariableNames: ''!

!classDefinition: #D3 category: #'Ctu-FrontendServer'!
FSWeb subclass: #D3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'D3 class' category: #'Ctu-FrontendServer'!
D3 class
	instanceVariableNames: ''!

!classDefinition: #D3Server category: #'Ctu-FrontendServer'!
D3 subclass: #D3Server
	instanceVariableNames: 'fsServer services'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'D3Server class' category: #'Ctu-FrontendServer'!
D3Server class
	instanceVariableNames: ''!

!classDefinition: #JS category: #'Ctu-FrontendServer'!
FSWeb subclass: #JS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ctu-FrontendServer'!
!classDefinition: 'JS class' category: #'Ctu-FrontendServer'!
JS class
	instanceVariableNames: ''!


!FSData commentStamp: '<historical>' prior: 0!
"The database layer"!

!D3Test methodsFor: 'cases' stamp: 'tc 10/31/2022 19:52:45'!
testAsAndLet
	"
	D3Test run: #testAsAndLet.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 d3Let: 'mySelection';
	     select: '.a-class';
	     attr: 'a' attr: 'ax'.
	
	d3 d3As: 'mySelection';
	     attr: 'b' attr: 'bx'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3; let mySelection = d3.select(`.a-class`).attr(`a`, `ax`); mySelection.attr(`b`, `bx`);' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'tc 11/20/2022 20:23:35'!
testD3NewStatement
	"
	D3Test run: #testD3NewStatement.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: 'body';
	     html: 'something';
	     d3NewStatement;
	     select: 'new-div';
	     render.
			
	"then"
	self assert: 'd3.select(`body`).html(`something`);d3.select(`new-div`);' equals: rendered.
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 8/5/2022 18:57:44'!
testHtml
	"
	D3Test run: #testHtml.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: 'body';
	     html: 'something';
	     render.
			
	"then"
	self assert: 'd3.select(`body`).html(`something`);' equals: rendered.
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 7/26/2022 13:47:20'!
testHtmlTemplate
	"
	D3Test run: #testHtmlTemplate.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"
	rendered _ d3 select: '${this}'; renderIntoTemplate.
			
	"then"
	self assert: (rendered includesSubString: 'd3.min.js').! !

!D3Test methodsFor: 'cases' stamp: 'tc 12/30/2022 10:50:00'!
testLetAs
	"
	D3Test run: #testLetAs.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 d3Let: 'mySelection';
	     select: '.a-class';
	     attr: 'a' attr: 'ax'.
	
	d3 d3Let: 'newVar' as: 'mySelection';
	     attr: 'b' attr: 'bx'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3; let mySelection = d3.select(`.a-class`).attr(`a`, `ax`); let newVar = mySelection.attr(`b`, `bx`);' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'tc 1/7/2023 13:06:49'!
testOn
	"
	D3Test run: #testOn.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 select: '.test';
	     " parameters: d, i, e "
	     on: 'click'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3.select(`.test`).on(`click`)();' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 8/5/2022 19:06:00'!
testOnJs
	"
	D3Test run: #testOnJs.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 select: '.test';
	     " parameters: d, i, e "
	     on: 'click' js: 'alert("hello" + d);'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3.select(`.test`).on(`click`, function(d, i, e) {alert("hello" + d);});' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 7/26/2022 13:47:26'!
testRawRaw
	"
	D3Test run: #testRawRaw.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 raw: 'selectAll' raw:'.test'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3.selectAll(`.test`);' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'tc 12/18/2022 20:40:48'!
testRemove
	"
	D3Test run: #testRemove.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: 'p';
	     remove;
	     render.
			
	"then"
	self assert: 'd3.select(`p`).remove();' equals: rendered.
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 7/24/2022 09:15:32'!
testSelectAll
	"
	D3Test run: #testSelectAll.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	d3 selectAll: '.test'.
	
	"when"
	rendered _ d3 render.
	
	"then"
	self assert: 'd3.selectAll(`.test`);' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 7/24/2022 09:27:09'!
testSelectAndClassed
	"
	D3Test run: #testSelectAndClassed.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"
	rendered _ d3 select: '${this}';
	     classed: 'basic' classed: '${!!isSelected}';
	     render.
		
	"then"
	self assert: 'd3.select(`${this}`).classed(`basic`, `${!!isSelected}`);' equals: rendered.
	
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 7/26/2022 19:47:08'!
testSelectWithResult
	"
	D3Test run: #testSelectWithResult.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: '${this}';
	     classed: 'basic';
	     result: 'isSelected';
	     render.
			
	"then"
	self assert: 'let isSelected = d3.select(`${this}`).classed(`basic`);' equals: rendered.
	! !

!D3Test methodsFor: 'cases' stamp: 'tc 12/30/2022 10:51:07'!
testText
	"
	D3Test run: #testText.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: 'body';
	     text: 'something';
	     render.
			
	"then"
	self assert: 'd3.select(`body`).text(`something`);' equals: rendered.
	! !

!D3Test methodsFor: 'cases' stamp: 'Ctu 8/11/2022 19:42:52'!
testTransition
	"
	D3Test run: #testTransition.
	"
	| d3 rendered |
	
	"given"
	d3 _ D3 new.
	
	"when"	
	rendered _ d3 select: 'body';
	     transition;
	     render.
			
	"then"
	self assert: 'd3.select(`body`).transition();' equals: rendered.
	! !

!FSServerTest methodsFor: 'private' stamp: 'Ctu 7/26/2022 14:19:04'!
createTemporaryIndexFile
	| testFileName inputFile |

	testFileName _ './index.html'.
	testFileName asFileEntry delete.
	
	inputFile _ testFileName asFileEntry writeStream.
	inputFile nextPutAll: '<html><h1>It works</h1></html>';
	              close.
	! !

!FSServerTest methodsFor: 'cases' stamp: 'Ctu 7/24/2022 13:48:13'!
testEchoService
	"
	FSServerTest run: #testEchoService.
	"
	
	| fsServer response |
	
	"given"
	fsServer _ FSServer reset default.
	fsServer listenOn: 1111.
	
	"when"
	fsServer addService: '/echo' action: [ :request | 
		request send200Response: 'It works'
		contentType: 'text/plain; charset=utf-8'.
	].
	
	"then - features/WebClient"
	response _ WebClient httpGet: 'http://localhost:1111/echo' contents.
	self assert: 'It works' equals: (response content).
	
	FSServer reset.! !

!FSServerTest methodsFor: 'cases' stamp: 'tc 1/2/2023 20:17:11'!
testGetMimeTypeHtml
	"
	FSServerTest run: #testGetMimeTypeHtml.
	"
	| type |
	
	" given, when "
	type _ FSServer getMimeType: 'web/myfile.html'.	

	" then "
	self assert: 'text/html' equals: type.	! !

!FSServerTest methodsFor: 'cases' stamp: 'tc 1/2/2023 20:17:51'!
testGetMimeTypeJs
	"
	FSServerTest run: #testGetMimeTypeJs.
	"
	| type |
	
	" given, when "
	type _ FSServer getMimeType: 'web/myfile.js'.	

	" then "
	self assert: 'application/javascript' equals: type.	! !

!FSServerTest methodsFor: 'cases' stamp: 'tc 1/2/2023 20:40:16'!
testGetMimeTypeMultipleDots
	"
	FSServerTest run: #testGetMimeTypeMultipleDots.
	"
	| type |
	
	" given, when "
	type _ FSServer getMimeType: '/test/this is a file.with.js.dots.png'.	

	" then "
	self assert: 'image/png' equals: type.	! !

!FSServerTest methodsFor: 'cases' stamp: 'tc 2/4/2023 13:06:12'!
testGetMimeTypeUppercase
	"
	FSServerTest run: #testGetMimeTypeUppercase.
	"
	| type |
	
	" given, when "
	type _ FSServer getMimeType: 'gaz.PDF'.	

	" then "
	self assert: 'application/pdf' equals: type.	! !

!FSServerTest methodsFor: 'cases' stamp: 'Ctu 7/26/2022 14:20:01'!
testStaticContent
	"
	FSServerTest run: #testStaticContent.
	"
	
	| fsServer response |
	
	"given"
	fsServer _ FSServer reset default.
	fsServer listenOn: 1111.
	
	self createTemporaryIndexFile.

	"when"
	fsServer staticContent: './'. 
	
	"then - features/WebClient"
	response _ WebClient httpGet: 'http://localhost:1111/index.html' contents.
	self assert: '<html><h1>It works</h1></html>' equals: (response content).
	
	FSServer reset.! !

!FSTextTest methodsFor: 'cases' stamp: 'ct 8/27/2025 17:02:15'!
testDefaultSeparator
	"
	FSTextTest run: #testDefaultSeparator.
	"
	
	"given, when"
	| fsText |
	
	fsText := FSText new.
	
	"then"
	self assert: (fsText separator) equals: (FSText DefaultSeparator).! !

!FSTextTest methodsFor: 'cases' stamp: 'ct 8/27/2025 17:01:48'!
testReadAKey
	"
	FSTextTest run: #testReadAKey.
	"
	
	"given"
	| fsText data inputFile testFileName |
	
	testFileName := './fstext-test.txt'.
	testFileName asFileEntry delete.
	
	inputFile := testFileName asFileEntry writeStream.
	inputFile nextPutAll: 'name=Tamas Csurke';
			nextPutAll: (Character codePoint: 10) asString;
	             	nextPutAll: 'age=39';
	             close.
	
	fsText := FSText new.
	
	"when"
	data := fsText open: testFileName;
		read: 'name';
		read: 'age';
		CloseAndGet.
		
	"then"
	self assert: (data at: 'name') equals: 'Tamas Csurke'.
	self assert: (39 asString) equals: (data at: 'age').! !

!FSTextTest methodsFor: 'cases' stamp: 'ct 8/27/2025 16:59:08'!
testReadSpecialValue
	"
	FSTextTest run: #testReadSpecialValue.
	"
	
	"given"
	| fsText data inputFile testFileName |
	
	testFileName := './fstext-test.txt'.
	testFileName asFileEntry delete.
	
	inputFile := testFileName asFileEntry writeStream.
	inputFile nextPutAll: 'special=notemail@special,=2';
	             close.
	
	fsText := FSText new.
	
	"when"
	data := fsText open: testFileName;
		read: 'special';
		CloseAndGet.
		
	"then"
	self assert: (data at: 'special') equals: 'notemail@special,=2'.! !

!FSTextTest methodsFor: 'cases' stamp: 'ct 8/27/2025 17:00:55'!
testReadWithNonDefaultSeparator
	"
	FSTextTest run: #testReadWithNonDefaultSeparator.
	"
	
	"given"
	| fsText data inputFile testFileName |
	
	testFileName := './fstext-test.txt'.
	testFileName asFileEntry delete.
	
	inputFile := testFileName asFileEntry writeStream.
	inputFile nextPutAll: 'name: Tamas Csurke';
			nextPutAll: (Character codePoint: 10) asString;
	             	nextPutAll: 'age: 39';
	             close.
	
	fsText := FSText new.
	
	"when"
	data := fsText separator: '\: ';  ": must be escaped in regex"
		open: testFileName;
		read: 'name';
		read: 'age';
		CloseAndGet.
		
	"then"
	self assert: (data at: 'name') equals: 'Tamas Csurke'.
	self assert: (39 asString) equals: (data at: 'age').! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 8/11/2022 19:58:27'!
testConst
	"
	JSTest run: #testConst.
	"
	"given"
	| js rendered |
	js _ JS new.
	
	"when"
	rendered _ js const: 'a' eq: '3;'; render.
		
	"then"
	self assert: 'const a = 3;' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 8/11/2022 19:58:18'!
testConstWeb
	"
	JSTest run: #testConstWeb.
	"
	"given"
	| js js2 rendered |
	js _ JS new.
	js2 _ JS new.
	
	"when"
	rendered _ js const: 'a' webEq: (js2 raw: '"hello";'); render.
		
	"then"
	self assert: 'const a = "hello";' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 19:53:11'!
testLet
	"
	JSTest run: #testLet.
	"
	"given"
	| js rendered |
	js _ JS new.
	
	"when"
	rendered _ js let: 'a' eq: '3;'; render.
		
	"then"
	self assert: 'let a = 3;' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 19:57:16'!
testLetWeb
	"
	JSTest run: #testLetWeb.
	"
	"given"
	| js js2 rendered |
	js _ JS new.
	js2 _ JS new.
	
	"when"
	rendered _ js let: 'a' webEq: (js2 raw: '"hello";'); render.
		
	"then"
	self assert: 'let a = "hello";' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/24/2022 13:34:00'!
testRenderMultipleRaws
	"
	JSTest run: #testRenderMultipleRaws.
	"
	"given"
	| js rendered |
	js _ JS new.
	
	"when"
	rendered _ js raw: 'alert("hello");'; raw: 'var b=1;'; render.
		
	"then"
	self assert: 'alert("hello");var b=1;' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/24/2022 13:25:30'!
testRenderRaw
	"
	JSTest run: #testRenderRaw.
	"
	"given"
	| js rendered |
	js _ JS new.
	
	"when"
	rendered _ js raw: 'alert("hello");'; render.
		
	"then"
	self assert: 'alert("hello");' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 20:01:43'!
testVar
	"
	JSTest run: #testVar.
	"
	"given"
	| js rendered |
	js _ JS new.
	
	"when"
	rendered _ js var: 'a' eq: '3;'; render.
		
	"then"
	self assert: 'var a = 3;' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 20:02:18'!
testVarWeb
	"
	JSTest run: #testVarWeb.
	"
	"given"
	| js js2 rendered |
	js _ JS new.
	js2 _ JS new.
	
	"when"
	rendered _ js var: 'a' webEq: (js2 raw: '"hello";'); render.
		
	"then"
	self assert: 'var a = "hello";' equals: rendered.! !

!JSTest methodsFor: 'as yet unclassified' stamp: 'Ctu 8/5/2022 19:36:00'!
testWebRaw
	"
	JSTest run: #testWebRaw.
	"
	"given"
	| js js2 rendered |
	js _ JS new.
	
	js2 _ JS new.
	js2 raw: 'alert("hello");'.
	
	"when"
	rendered _ js webRaw: js2; render.
		
	"then"
	self assert: 'alert("hello");' equals: rendered.! !

!FSServer methodsFor: 'private' stamp: 'tc 1/2/2023 20:41:59'!
dispatchRequest: request url: dispatchUrl
	"Handle static content"
	
	staticContentPrefix ifNotNil: [
		request method = 'GET' ifTrue: [
			| fileData file |
			file _ (staticContentPrefix, dispatchUrl) asFileEntry.
			
			file exists ifTrue: [
			fileData _ file binaryContents readStream.
				^request
					stream200Response: fileData
					size: fileData size
					type: (FSServer getMimeType: dispatchUrl).
			].
		].
	].

	super dispatchRequest: request url: dispatchUrl.! !

!FSServer methodsFor: 'private' stamp: 'tc 1/22/2023 10:59:53'!
getFile: request url: dispatchUrl
	"Handle static content"
	
	staticContentPrefix ifNotNil: [
		request method = 'GET' ifTrue: [
			| fileData file |
			file _ dispatchUrl asFileEntry.
			
			file exists ifTrue: [
			fileData _ file binaryContents readStream.
				request
					stream200Response: fileData
					size: fileData size
					type: (FSServer getMimeType: dispatchUrl).
			]
			ifFalse: [
				request send404Response.
			].
		].
	].! !

!FSServer methodsFor: 'initialize' stamp: 'Ctu 4/24/2022 10:12:07'!
initialize
	self staticContent: nil.
	super initialize.! !

!FSServer methodsFor: 'public' stamp: 'Ctu 4/24/2022 12:37:34'!
staticContent: aStaticContentPrefix
	staticContentPrefix _ aStaticContentPrefix.! !

!FSServer class methodsFor: 'utility' stamp: 'tc 2/4/2023 13:08:32'!
getMimeType: file

	| type parts mimeTypes result |
	
	result _ 'application/octet-stream'. " default "
	
	mimeTypes _ Dictionary new.
	mimeTypes add: 'html' -> 'text/html'.
	mimeTypes add: 'js' -> 'application/javascript'.
	mimeTypes add: 'css' -> 'text/css'.
	mimeTypes add: 'txt' -> 'text/plain'.
	mimeTypes add: 'pdf' -> 'application/pdf'.
	mimeTypes add: 'jpg' -> 'image/jpeg'.
	mimeTypes add: 'png' -> 'image/png'.
	mimeTypes add: 'gif' -> 'image/gif'.
	
	parts _ file substrings: '.'.
	type _ parts at: (parts size).	
	type _ type asLowercase.

	(mimeTypes includesKey: type) ifTrue: [
		result _ mimeTypes at: type.
	].
	
	^result.! !

!FSApp methodsFor: 'initialization' stamp: 'tc 1/2/2023 21:05:59'!
initializeWithBootstrap5

	| d3Server d3s |

	d3Server _ D3Server new.
		d3Server startOn: 1111.	
	d3Server staticContent: './webBs/'.
		
	d3Server addService: '/index.st' action: [ :request |
		   | js |
		    js _  JS new.
				
		    d3s _ D3Server withServer: d3Server.
		    d3s select: 'body'; 
		        html: '<a href="#" class="btn btn-primary my-2">Welcome to Boostrap-Smalltalk combo</a>'.
	
		    js webRaw: d3s.
				
		    request send200Response: (js renderIntoTemplateBootstrap5) 
			contentType: 'text/html; charset=utf-8'.
		]. 
	! !

!FSApp methodsFor: 'initialization' stamp: 'ct 8/27/2025 18:40:47'!
initializeWithBulma

	| d3Server d3s |

	d3Server := D3Server new.
		d3Server startOn: 1111.	
	d3Server staticContent: './web/'.
		
	d3Server addService: '/index.st' action: [ :request |
		   | js model |
		    js :=  JS new.
				
		    d3s := D3Server withServer: d3Server.
		    d3s select: 'body'; 
		        html: '<button class="button is-link is-outlined">Say greeting from Smalltalk backend to </button>
		                 <input class="input is-primary" type="text" myrole="name"></input><br><br>
		                  ************<br><br>
		                 <input class="input is-primary fsdata-name" type="text" placeholder="name"></input><br>
		                 <input class="input is-primary fsdata-email" type="text" placeholder="email"></input><br>
		                 <button class="button is-link is-outlined myapp-fill">Fill out the form</button>'.
	
		     js webRaw: d3s.
	
		    d3s := D3Server withServer: d3Server.	
		    d3s select: 'body button';
		          on: 'click' service: '/greet' before: ['
		            requestBody = d3.select("[myrole=name]")
		                                     .property("value");
			    xhr.setRequestHeader("myheader", "hello");
		          '] 
		          action: [ :rg |			
			   rg send200Response: ('Hello dear ',  (rg content) ,' from Smalltalk :)', 
			   'with myheader: ', (rg headerAt: 'myheader')) 
			    contentType: 'text/html; charset=utf-8'.
			   ] 
		           after: ['
				alert(JSON.stringify(xhr.response));
			   '].
	
		    model := Dictionary 
				with: #name->'Thomas' 
				with: #email->'thomas@example.net'.
	
		    d3s d3NewStatement;
		           select: '.myapp-fill';
			    on: 'click' service: '/filloutmydata' before: [''] action: [ :rg |
				Transcript show: 'service /filloutmydata was called'; cr.
				rg send200Response: (WebUtils jsonEncode: model) contentType: 'application/json; charset=utf-8'.
			   ] 
		          after: ['
				var fsdata = JSON.parse(xhr.response);  // helper to do this (no other data is expected) syncToWeb: model
				// do not use d3 here (we should be as compatible as possible)
				var fsdatafield = document.querySelector(".fsdata-', ('name'), '");    // key
				fsdatafield.value = "', (model at: 'name'), '";    // value				
			   '].
	
"
				e.g.
				| a |

				a := Dictionary with: #a->#b.
				a keys do: [:k | Transcript show: k].

"	
	
		     js webRaw: d3s.
				
		    request send200Response: (js renderIntoTemplate) 
			contentType: 'text/html; charset=utf-8'.
		]. 
	! !

!FSText methodsFor: 'accessing' stamp: 'Ctu 5/10/2022 20:31:28'!
separator
	"Answer the value of separator"

	^ separator! !

!FSText methodsFor: 'read' stamp: 'Ctu 5/29/2022 12:33:26'!
CloseAndGet
	"Reads the file with the given keys, closes and gets the dictionary."
	
	[
		[ file atEnd ] whileFalse: [
			self fillKeyValuesFrom: file nextLine.
		]
	] ensure: [
		file ifNotNil: [file close].
	].
	
	^keyValues.! !

!FSText methodsFor: 'open' stamp: 'Ctu 5/22/2022 15:00:39'!
read: aKey
	keyValues at: aKey put: nil.
	! !

!FSText methodsFor: 'initialize' stamp: 'Ctu 5/28/2022 20:04:28'!
initialize
	separator _ (DefaultSeparator).
	keyValues _ Dictionary new.
	! !

!FSText methodsFor: 'initialize' stamp: 'Ctu 5/28/2022 19:42:20'!
open: aFileName
	file _ aFileName asFileEntry readStream.
	! !

!FSText methodsFor: 'initialize' stamp: 'tc 10/15/2022 16:32:43'!
separator: aSeparator
	"I can change the default separator to the given. My parameter is a regexp."
	separator _ aSeparator.! !

!FSText methodsFor: 'private' stamp: 'ct 8/27/2025 16:59:47'!
fillKeyValuesFrom: aLine
	keyValues keysDo: [ :key | 
		((keyValues at: key) isNil) ifTrue: [
			| rex |
			rex := (key, separator, '(.*)') asRegex.
			rex search: aLine.
			keyValues at: key put: (rex subexpression: 2).			
		].	
	].! !

!FSText class methodsFor: 'as yet unclassified' stamp: 'Ctu 5/10/2022 20:19:17'!
initialize
	DefaultSeparator _ '='.! !

!FSText class methodsFor: 'accessing' stamp: 'Ctu 5/28/2022 20:06:50'!
DefaultSeparator
	^DefaultSeparator.! !

!FSWeb methodsFor: 'initialization' stamp: 'Ctu 7/26/2022 13:33:49'!
initialize
	rendered _ ''.! !

!FSWeb methodsFor: 'content' stamp: 'Ctu 7/26/2022 13:32:21'!
raw: code
	rendered _ rendered, code.! !

!FSWeb methodsFor: 'rendering' stamp: 'Ctu 7/26/2022 13:30:20'!
render
	^rendered.! !

!FSWeb methodsFor: 'rendering' stamp: 'tc 1/4/2023 09:09:56'!
renderIntoTemplate
	self render.
	
	rendered _ '
<head>
    <meta charset="UTF-8">
    <link href="assets/bulma.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/bulma-tooltip.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/animate.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/fontawesome.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/brands.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/solid.css" rel="stylesheet" type="text/css"/>	  
    <link href="assets/app.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <script src="assets/d3.min.js"></script>
	 <script>
			// PlaceOfD3Script
	 </script>
</body>
' copyReplaceAll: '// PlaceOfD3Script' with: rendered.
	
	^rendered.! !

!FSWeb methodsFor: 'rendering' stamp: 'ct 5/20/2023 11:34:15'!
renderIntoTemplate: aTemplate
	" I can render a custom template. The template should contain your css and optionally the js code. 
	It is important that the template must contain 
	* the '// PlaceOfD3Script' comment in a <script> tag
	* a reference to the d3 library 
	
	For example:
	<head>
	   <link href='your_css'></link>
	</head>
	<body>
	   <script src='assets/d3.min.js'></script>
	   <script> // PlaceOfD3Script </script>
	</body>
	 "
	self render.
	
	rendered := aTemplate copyReplaceAll: '// PlaceOfD3Script' with: rendered.
	
	^rendered.! !

!FSWeb methodsFor: 'rendering' stamp: 'tc 1/4/2023 09:09:43'!
renderIntoTemplateBootstrap5
	self render.
	
	rendered _ '
<head>
    <meta charset="UTF-8">
    <link href="assets/bs/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/animate.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/fontawesome.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/brands.css" rel="stylesheet" type="text/css"/>
    <link href="assets/fontawesome/css/solid.css" rel="stylesheet" type="text/css"/>	  
    <link href="assets/app.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <script src="assets/d3.min.js"></script>
	 <script>
			// PlaceOfD3Script
	 </script>
    <script src="assets/bs/dist/js/bootstrap.bundle.min.js"></script>
</body>
' copyReplaceAll: '// PlaceOfD3Script' with: rendered.
	
	^rendered.! !

!FSWeb methodsFor: 'rendering' stamp: 'Ctu 7/26/2022 13:31:29'!
renderTo: fileName
	| appendStream |
	
	self render.
	
	appendStream _ fileName asFileEntry appendStream.
	appendStream nextPutAll: rendered.! !

!FSWeb methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 16:25:20'!
rendered
	"Answer the value of rendered"

	^ rendered! !

!FSWeb methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 16:25:20'!
rendered: anObject
	"Set the value of rendered"

	rendered _ anObject! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/5/2022 19:00:59'!
append: aString
	self raw: 'append' raw: aString.! !

!D3 methodsFor: 'public' stamp: 'ct 2/27/2023 20:27:39'!
append: aString append: before
	self raw: 'append' raw: aString raw: before.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/11/2022 19:37:49'!
attr: attr1
	self raw: 'attr' raw: attr1.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/11/2022 19:37:14'!
attr: attr1 attr: attr2
	self raw: 'attr' raw: attr1 raw: attr2.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/24/2022 07:46:50'!
classed: aClass
	self raw: 'classed' raw: aClass.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/24/2022 07:51:51'!
classed: class1 classed: class2
	self raw: 'classed' raw: class1 raw: class2.! !

!D3 methodsFor: 'public' stamp: 'tc 10/31/2022 19:51:17'!
d3As: aVariableName
	self raw: '; ', aVariableName.! !

!D3 methodsFor: 'public' stamp: 'tc 10/31/2022 19:51:23'!
d3Let: aVariableName
	self raw: '; let ', aVariableName, ' = d3'.! !

!D3 methodsFor: 'public' stamp: 'tc 12/30/2022 10:48:34'!
d3Let: aVariableName as: aSelectionVariable
	self raw: '; let ', aVariableName, ' = ', aSelectionVariable.! !

!D3 methodsFor: 'public' stamp: 'tc 11/20/2022 20:23:35'!
d3NewStatement
	" I close  the current d3 statement and add a new one. So you can add more d3 statements e.g.: 
	  d3.select('old');d3.select('new');"
	self raw: ';d3'.! !

!D3 methodsFor: 'public' stamp: 'tc 1/21/2023 21:25:15'!
d3Raw: raw
	self raw: '.', raw.! !

!D3 methodsFor: 'public' stamp: 'tc 12/27/2022 22:35:57'!
data: data
	self raw: 'data' raw: data.! !

!D3 methodsFor: 'public' stamp: 'tc 12/27/2022 22:36:22'!
enter
	self raw: '.enter()'.! !

!D3 methodsFor: 'public' stamp: 'tc 12/27/2022 22:37:31'!
exit
	self raw: '.exit()'.! !

!D3 methodsFor: 'public' stamp: 'tc 1/4/2023 12:05:28'!
html
	self raw: '.html()'.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/5/2022 18:55:30'!
html: aHtml
	self raw: 'html' raw: aHtml.! !

!D3 methodsFor: 'public' stamp: 'tc 1/3/2023 17:38:50'!
insert: aString
	self raw: 'insert' raw: aString.! !

!D3 methodsFor: 'public' stamp: 'tc 1/3/2023 17:50:13'!
insert: aString insert: before
	self raw: 'insert' raw: aString raw: before.! !

!D3 methodsFor: 'public' stamp: 'tc 12/30/2022 10:59:35'!
jsRaw: raw
	self raw: ';', raw.! !

!D3 methodsFor: 'public' stamp: 'tc 1/7/2023 13:03:48'!
on: eventName
	self raw: '.on(`', eventName, '`)()'.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/5/2022 19:05:36'!
on: eventName js: jsFunctionBody
	self raw: '.on(`', eventName, '`, function(d, i, e) {', jsFunctionBody, '})'.! !

!D3 methodsFor: 'public' stamp: 'tc 10/15/2022 15:26:44'!
property: property1
	self raw: 'property' raw: property1.! !

!D3 methodsFor: 'public' stamp: 'tc 10/15/2022 15:27:18'!
property: property1 property: property2
	self raw: 'property' raw: property1 raw: property2.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/26/2022 13:56:57'!
raw: raw1 raw: raw2
	self raw: '.', raw1, '(`', raw2, '`)'.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/26/2022 13:57:09'!
raw: raw1 raw: raw2 raw: raw3
	self raw: '.', raw1, '(`', raw2, '`, `', raw3 ,'`)'.! !

!D3 methodsFor: 'public' stamp: 'tc 12/18/2022 20:40:06'!
remove
	self raw: '.remove()'.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/26/2022 13:50:16'!
render
	rendered _ rendered, ';'.

	^rendered.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/24/2022 09:28:32'!
result: resultVariable
	rendered _ 'let ', resultVariable , ' = ', rendered.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/24/2022 07:53:05'!
select: aSelector
	self raw: 'select' raw: aSelector.! !

!D3 methodsFor: 'public' stamp: 'Ctu 7/23/2022 20:42:30'!
selectAll: aSelector
	self raw: 'selectAll' raw: aSelector.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/5/2022 19:02:14'!
style: name style: value
	self raw: 'style' raw: name raw: value.! !

!D3 methodsFor: 'public' stamp: 'tc 1/4/2023 12:11:10'!
text
	self raw: '.text()'.! !

!D3 methodsFor: 'public' stamp: 'tc 12/30/2022 10:50:42'!
text: aText
	self raw: 'text' raw: aText.! !

!D3 methodsFor: 'public' stamp: 'Ctu 8/11/2022 19:42:44'!
transition
	self raw: '.transition()'.! !

!D3 methodsFor: 'public' stamp: 'tc 1/3/2023 12:15:52'!
webRaw: webExpression
	self jsRaw: (webExpression render).! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:13:40'!
_append: aString
	self _raw: 'append' _raw: aString.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:13:26'!
_append: aString _append: before
	self _raw: 'append' _raw: aString _raw: before.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:13:07'!
_attr: attr1
	self _raw: 'attr' _raw: attr1.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:12:53'!
_attr: attr1 _attr: attr2
	self _raw: 'attr' _raw: attr1 _raw: attr2.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:12:34'!
_classed: aClass
	self _raw: 'classed' _raw: aClass.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:12:17'!
_classed: class1 _classed: class2
	self _raw: 'classed' _raw: class1 _raw: class2.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:11:47'!
_data: data
	self _raw: 'data' _raw: data.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:11:08'!
_html: aHtml
	self _raw: 'html' _raw: aHtml.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:10:55'!
_insert: aString
	self _raw: 'insert' _raw: aString.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:10:32'!
_insert: aString _insert: before
	self _raw: 'insert' _raw: aString _raw: before.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:07:00'!
_property: property1
	self _raw: 'property' _raw: property1.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:06:41'!
_property: property1 _property: property2
	self _raw: 'property' _raw: property1 _raw: property2.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:03:11'!
_raw: raw1 _raw: raw2
	self raw: '.', raw1, '(', raw2, ')'.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:04:10'!
_raw: raw1 _raw: raw2 _raw: raw3
	self raw: '.', raw1, '(', raw2, ', ', raw3 ,')'.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:05:57'!
_select: aSelector
	self _raw: 'select' _raw: aSelector.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:05:35'!
_selectAll: aSelector
	self _raw: 'selectAll' _raw: aSelector.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:05:07'!
_style: name _style: value
	self _raw: 'style' _raw: name _raw: value.! !

!D3 methodsFor: 'public' stamp: 'ct 6/4/2023 12:04:41'!
_text: aText
	self _raw: 'text' _raw: aText.! !

!D3 methodsFor: 'initialize' stamp: 'Ctu 7/23/2022 20:34:11'!
initialize
	rendered _ 'd3'.! !

!D3Server methodsFor: 'server' stamp: 'Ctu 8/7/2022 09:30:04'!
addService: aPath action: backendFunction
	fsServer addService: aPath action: backendFunction.! !

!D3Server methodsFor: 'server' stamp: 'Ctu 8/11/2022 19:54:52'!
addService: aPath action: backendFunction methods: methods
	fsServer addService: aPath action: backendFunction methods: methods.! !

!D3Server methodsFor: 'server' stamp: 'tc 12/22/2022 17:48:35'!
on: eventName service: aPath before: jsFunctionBodyBlockBefore action: backendBlock after: jsFunctionBodyBlockAfter
	self raw: '.on(`', eventName, '`, function(d, i, e) {',
	        'let requestBody = ""; // this will be sent to backend
		 const xhr = new XMLHttpRequest();
		 xhr.open("POST", "', aPath ,'");
	        ', 
		jsFunctionBodyBlockBefore value, 
		" call backend here "
		'xhr.onloadend = function() {
		   ', "xhr.response" jsFunctionBodyBlockAfter value, '
		 };
		 xhr.onerror = function() { console.error("error on request: " + "', aPath, '"); };
		 xhr.send(requestBody);
		', 
	'})'.
	
	(self services includes: aPath) ifFalse: [
		self addService: aPath action: backendBlock.
		self services add: aPath.
	].
! !

!D3Server methodsFor: 'server' stamp: 'tc 12/27/2022 11:03:30'!
service: aPath before: jsFunctionBodyBlockBefore action: backendBlock after: jsFunctionBodyBlockAfter
	self raw: '; {',
	        'let requestBody = ""; // this will be sent to backend
		 const xhr = new XMLHttpRequest();
		 xhr.open("POST", "', aPath ,'");'
	        , 
		jsFunctionBodyBlockBefore value, 
		" call backend here "
		'xhr.onloadend = function() {
		   ', "xhr.response" jsFunctionBodyBlockAfter value, '
		 };
		 xhr.onerror = function() { console.error("error on request: " + "', aPath, '"); };
		 xhr.send(requestBody);
		', 
	'}'.
	
	(self services includes: aPath) ifFalse: [
		self addService: aPath action: backendBlock.
		self services add: aPath.
	].
! !

!D3Server methodsFor: 'server' stamp: 'Ctu 8/7/2022 09:19:35'!
staticContent: aPath
	fsServer staticContent: aPath.! !

!D3Server methodsFor: 'server' stamp: 'tc 12/27/2022 16:59:44'!
upload: fileField idHeader: fileId service: aPath action: backendBlock afterSuccess: jsFunctionBodyBlockAfterSuccess afterError: jsFunctionBodyBlockAfterError

	"I'll upload a file 
	 * by the given eventName (on), 
	 * from the given fileField (upload).
	
	I'll send as a header the fileName and fileId (idHeader).
	
	I can handle the success and error cases as js bodies."

	self raw: '; {',
	'console.log("file upload client side reached");',
        'const files = document.getElementById(`', fileField, '`)["files"];
        if (!!files) {
          console.warn("No files are selected, nothing to upload.");
          return;
        }

        for (let i = 0; i < files.length; i++) {
            let reader = new FileReader();
            reader.readAsDataURL(files[i]);

            let xhr = new XMLHttpRequest();
            xhr.open("POST", "', aPath, '");
            reader.onload = function(evt) {
                xhr.setRequestHeader("fileName", files[i].name);
                xhr.setRequestHeader("fileId", ', fileId, ');
                xhr.send(evt.target.result);
            };
            reader.onerror = function(evt) {',
		jsFunctionBodyBlockAfterError, 
            '};
            reader.onloadend = function(evt) {', 
		jsFunctionBodyBlockAfterSuccess, 
            '};
        }
	
	if (files.length == 0) {',
	    jsFunctionBodyBlockAfterSuccess,
	'}
	
	};'.
	
	(self services includes: aPath) ifFalse: [
		self addService: aPath action: backendBlock.
		self services add: aPath.
	].
! !

!D3Server methodsFor: 'initialize' stamp: 'tc 10/16/2022 19:08:28'!
startOn: aPort
	fsServer _ FSServer reset default.
	fsServer listenOn: aPort.	
	services _ Set new.! !

!D3Server methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 17:29:18'!
fsServer
	"Answer the value of fsServer"

	^ fsServer! !

!D3Server methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 15:11:10'!
fsServer: anObject
	"Set the value of fsServer"

	fsServer _ anObject! !

!D3Server methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 15:53:25'!
services
	"Answer the value of services"

	^ services! !

!D3Server methodsFor: 'accessing' stamp: 'Ctu 8/7/2022 15:53:25'!
services: anObject
	"Set the value of services"

	services _ anObject! !

!D3Server class methodsFor: 'instance creation' stamp: 'Ctu 8/7/2022 17:34:01'!
withServer: aD3Server
	| d3Server |
	
	d3Server _ self new.
	d3Server fsServer: (aD3Server fsServer).
	d3Server services: (aD3Server services).
	d3Server rendered: 'd3'.
	
	^d3Server.! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 8/11/2022 19:57:04'!
const: jsVariable eq: expression
	self raw: 'const ', jsVariable, ' = ', expression.! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 8/11/2022 19:57:48'!
const: jsVariable webEq: webExpression
	self raw: 'const ', jsVariable, ' = ', (webExpression render).! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 19:51:26'!
let: jsVariable eq: expression
	self raw: 'let ', jsVariable, ' = ', expression.! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 19:52:00'!
let: jsVariable webEq: webExpression
	self raw: 'let ', jsVariable, ' = ', (webExpression render).! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 20:00:27'!
var: jsVariable eq: expression
	self raw: 'var ', jsVariable, ' = ', expression.! !

!JS methodsFor: 'as yet unclassified' stamp: 'Ctu 7/26/2022 20:00:38'!
var: jsVariable webEq: webExpression
	self raw: 'var ', jsVariable, ' = ', (webExpression render).! !

!JS methodsFor: 'as yet unclassified' stamp: 'tc 1/3/2023 12:15:15'!
webRaw: webExpression
	self raw: (webExpression render).! !
FSText initialize!
