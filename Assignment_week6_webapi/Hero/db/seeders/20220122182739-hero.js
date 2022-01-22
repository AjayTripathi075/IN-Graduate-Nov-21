'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
     await queryInterface.bulkInsert('Heros', [{
     heroName: 'John Abraham',
      film:'welcometwo',
      createdAt: new Date(),
      updatedAt: new Date()
      },
      {
        heroName: 'Kapil',
         film:'firangi',
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
