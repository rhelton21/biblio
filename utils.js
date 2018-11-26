/*
 *  Sequelize init
 */

const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;
const db = new Sequelize('biblio', 'biblio', 'biblio', {
    host: 'localhost',
    dialect: 'mysql'
})

const BookDB = db.define('books',{
	title: DataTypes.STRING(255),
	publication : DataTypes.STRING(10),
	license_rights : DataTypes.STRING(40),
	language : DataTypes.STRING(20)
});


const Subject = db.define('subjects', {
    subject: DataTypes.STRING(100),
    book_id: DataTypes.INTEGER(5)
});

const Author = db.define('authors', {
    author: DataTypes.STRING(100),
    book_id: DataTypes.INTEGER(5)
});/*
 * Requires
 */
var fs = require('fs');
var path = require('path');
var xml2js = require('xml2js');
const Book = require('./models/books');
/*
 *  xmlFileToJs
 */
module.exports.xmlFileToJs = function(filename, cb){
    var filepath = path.normalize(path.join(__dirname, filename));
    fs.readFile(filepath, 'utf8', function (err, xmlStr) {
        if (err) throw (err);
       xml2js.parseString(xmlStr, {}, cb);
    });    
}
/*
 *  Get the subjects
 */ 
module.exports.getSubjects = function(level3) {
	//  Multiple subjects
	var subjects = [];
	var loopVar = true;
	var index  = 0;
	while(loopVar){
		try{
			var subject = JSON.stringify(level3['dcterms:subject'][index]['rdf:Description'][0]['rdf:value']);
		}catch(e){
			loopVar = false;
			break;
		}
		subject = subject.replace(/['"]+/g, '');
		subject = subject.replace('[' ,'');
		subject = subject.replace(']' ,'');
		subjects.push(subject);
		index++;
	}
	return subjects; 
}
/*
 *  Get the authors
 */ 
module.exports.getAuthors = function(level3) {
	//  Multiple authors possible
	var authors = [];
	var loopVar = true;
	var index  = 0;
	while(loopVar){
		try{
			var author = JSON.stringify(level3['dcterms:creator'][index]['pgterms:agent'][0]['pgterms:name']);
		}catch(e){
			loopVar = false;
			break;
		}
		author = author.replace(/['"]+/g, '');
		author = author.replace('[' ,'');
		author = author.replace(']' ,'');
		authors.push(author);
		index++;
	}
	return authors; 
}
/*
 *  Get the Book Info
 */ 
module.exports.saveToDB = function(book, authors, subjects) {
	var book = new Book();
    // Title
    var title = JSON.stringify(level3['dcterms:title']);
    title = title.replace(/['"]+/g, '');
    title = title.replace('[', '');
    title = title.replace(']', '');
	book.title = title;
	console.log('titlle--->'+book.title)
    // Language
    var languageTopLevel = level3['dcterms:language'];
    var languagePieces = JSON.stringify(languageTopLevel[0]['rdf:Description'][0]['rdf:value']).split(":");
    var languageSplits = languagePieces[1].split(",");
	console.log('language--->'+languageSplits[0]);
	var language = languageSplits[0].replace(/['"]+/g, '');
	language = language.replace(/['"]+/g, '');
	book.language = language;
    // License
    var license = JSON.stringify(level3['dcterms:rights']);
    license = license.replace(/['"]+/g, '');
    license = license.replace('[', '');
    license = license.replace(']', '');
	console.log('license--->'+license);
	book.license = license;
   // Publication
    var issuedTopSplit = JSON.stringify(level3['dcterms:issued']).split(":");
    var issued = issuedTopSplit[1].split(",");
    var publication = issued[0];  // works
	book.publication = publication;
	return book;
}
/*
 *  Get the Book Info
 */ 
module.exports.getBook = function(level3) {
	var book = new Book();
    // Title
    var title = JSON.stringify(level3['dcterms:title']);
    title = title.replace(/['"]+/g, '');
    title = title.replace('[', '');
    title = title.replace(']', '');
	book.title = title;
    // Language
    var languageTopLevel = level3['dcterms:language'];
    var languagePieces = JSON.stringify(languageTopLevel[0]['rdf:Description'][0]['rdf:value']).split(":");
    var languageSplits = languagePieces[1].split(",");
	book.language = languageSplits[0];
    // License
    var license = JSON.stringify(level3['dcterms:rights']);
    license = license.replace(/['"]+/g, '');
    license = license.replace('[', '');
    license = license.replace(']', '');
	book.license_rights = license;
   // Publication
    var issuedTopSplit = JSON.stringify(level3['dcterms:issued']).split(":");
    var issued = issuedTopSplit[1].split(",");
    var publication = issued[0];  // works
	publication = publication.replace(/['"]+/g, '');
	book.publication = publication;
	return book;
}

