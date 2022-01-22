'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
      await queryInterface.bulkInsert('Books', [
        {
          bookName: 'Angular',
          authorName: 'Amay',
          publicationDate : new Date(),
          createdAt: new Date(),
          updatedAt: new Date()   
        },
        {
          bookName: 'C#',
          authorName: 'Dhruv',
          publicationDate : new Date(),
          createdAt: new Date(),
          updatedAt: new Date()   
        },
    ], {});
    
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
