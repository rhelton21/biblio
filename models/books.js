/* jshint indent: 2 */
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;
const db = new Sequelize('biblio', 'biblio', 'biblio', {
    host: 'localhost',
    dialect: 'mysql'
})

module.exports = function(sequelize, DataTypes) {
  return db.define('books', {
    id: {
      type: Sequelize.INTEGER(5),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: Sequelize.STRING(255),
      allowNull: false,
	   get () { 
         return this.getDataValue('title');
       },	  
	   set(val) {
		this.setDataValue('title');
	   }
    },
    publication: {
      type: Sequelize.STRING(10),
      allowNull: false,
	   get () { 
         return this.getDataValue('publication');
       },	  
	   set(val) {
		this.setDataValue('publication');
	   }
    },
    createdAt: {
      type: Sequelize.DATE,
      allowNull: true
    },
    updatedAt: {
      type: Sequelize.DATE,
      allowNull: true
    },
    publisher: {
      type: Sequelize.STRING(10),
      allowNull: false,
      defaultValue: 'Gutenberg'
    },
    language: {
      type: Sequelize.STRING(20),
      allowNull: false,
      defaultValue: 'en',
	   get () { 
         return this.getDataValue('language');
       },	  
	   set(val) {
		this.setDataValue('language');
	   }
    },
    license_rights: {
      type: Sequelize.STRING(40),
      allowNull: true,
	   get () { 
         return this.getDataValue('license_rights');
       },	  
	   set(val) {
		this.setDataValue('license_rights');
	   }
    }
  }, {
    tableName: 'books'
  });
};
