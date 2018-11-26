/*
 *  Sequelize init
 */

const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;
const db = new Sequelize('biblio', 'biblio', 'biblio', {
    host: 'localhost',
    dialect: 'mysql'
})

const Book = require('./models/books');
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
});

/*
 * Requires
 */
var fs = require('fs');
var path = require('path');
var xml2js = require('xml2js');
var utils = require('./utils');

/*
 *  Main Entry
 */
 // Non-blocking example with fs.readFile
const fileNames = process.argv.splice(2);

var main = function () {
    console.log('Starting....');
	fileNames.forEach(fileName => {
	console.log('Parsing filename--->' +fileName);
		utils.xmlFileToJs(fileName, function (err, obj) {
			if (err) throw (err);
			jsToDB(obj, function (err) {
				if (err) console.log(err);
			})
		});
	});

}

if (require.main === module) {
    main();
}


/*
 *  jsToDB
 */
function jsToDB(obj, cb) {
    const level1 = obj['rdf:RDF'];
    const level2 = level1['pgterms:ebook'];
    const level3 = level2['0'];
    const book = utils.getBook(level3);
    const subjects = utils.getSubjects(level3);
    const authors = utils.getAuthors(level3);
	saveToDB(book, authors, subjects);


}
/*
 *  Save to DB
 */ 
function saveToDB(book, authors, subjects) {
	try{
		BookDB.create({
			title: book.title,
			language : book.language, 
			license_rights : book.license_rights, 
			publication : book.publication
			}).then(function(result){
				for (var i in subjects) {
					Subject.create({
						subject: subjects[i],
						book_id: result.id
					})
				}
				for (var i in authors) {
					Author.create({
						author: authors[i],
						book_id: result.id
					})
				}
			});
			
	}catch(e){
		console.error(e);
	} 
}
setTimeout((function() {  
	console.log('Finishing....');
    return process.kill(process.pid);
}), 5000);