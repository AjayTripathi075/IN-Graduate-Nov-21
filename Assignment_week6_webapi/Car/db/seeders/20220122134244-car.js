'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
     await queryInterface.bulkInsert('Cars', [
    {
     carName: 'Lamborgini',
     brandName :'Lamborgini',
     createdAt: new Date(),
     updatedAt: new Date()
     },
     {
      carName: 'Nexon',
      brandName :'Tata',
      createdAt: new Date(),
      updatedAt: new Date()
     },
     {
      carName: 'Thar',
      brandName :'Mahindra',
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
