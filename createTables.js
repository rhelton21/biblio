
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


db.sync({ alter: true })
  .then(() => {
    console.log(`Database & tables created!`)
  })
