const utils = require('./utils');

it('Open file and parse', () => {
  utils.xmlFileToJs('pg3.rdf', function (err, obj) {
        if (err) throw (err);
    });
});
it('Check Subjects', () => {
  utils.xmlFileToJs('pg3.rdf', function (err, obj) {
        if (err) throw (err);
		var level1 = obj['rdf:RDF'];
		var level2 = level1['pgterms:ebook'];
		var level3 = level2['0'];
		var subjects = utils.getSubjects(level3);
		if(subjects.length < 3){
			throw new Error(`Expected 3 values in Subjects.`);
		}
    });
});
it('Check Authors', () => {
  utils.xmlFileToJs('pg3.rdf', function (err, obj) {
        if (err) throw (err);
		var level1 = obj['rdf:RDF'];
		var level2 = level1['pgterms:ebook'];
		var level3 = level2['0'];
		var authors = utils.getAuthors(level3);
		if(authors.length < 1){
			throw new Error(`Expected 1 values in Authors.`);
		}
    });
});
it('Check Book', () => {
  utils.xmlFileToJs('pg3.rdf', function (err, obj) {
        if (err) throw (err);
		var level1 = obj['rdf:RDF'];
		var level2 = level1['pgterms:ebook'];
		var level3 = level2['0'];
		var book = utils.getBook(level3);
		if(book.title !='John F. Kennedys Inaugural Address'){
			throw new Error(`Book had wrong title.`);
		}
    });
});
