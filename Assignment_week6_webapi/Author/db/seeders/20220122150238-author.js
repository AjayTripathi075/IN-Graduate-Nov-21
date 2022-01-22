'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
   
      await queryInterface.bulkInsert('Authors', [
        {
          authorName: 'Amit',
          bookName: 'Angular',
          createdAt: new Date(),
          updatedAt: new Date()       
   
        },
        {
          authorName: 'c#',
          bookName: 'perry',
          createdAt: new Date(),
          updatedAt: new Date()       
   
        },
        {
          authorName: 'python',
          bookName: 'tytuy',
          createdAt: new Date(),
          updatedAt: new Date()       
   
        }
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
