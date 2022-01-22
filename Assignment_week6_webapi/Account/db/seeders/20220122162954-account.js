'use strict';

const { now } = require("lodash");

module.exports = {
  async up (queryInterface, Sequelize) {
      await queryInterface.bulkInsert('Accounts', [
        {
        accountno: 656788,
        accountName: 'Saving Account',
        Balance :25000.00,
        createdAt : new Date(),
        updatedAt : new Date()
        },
        {
          accountno: 656788,
          accountName: 'Current Account',
          Balance :20000.00,
          createdAt : new Date(),
          updatedAt : new Date()
        },
        {
          accountno: 656788,
          accountName: 'Saving Account',
          Balance :28000.00,
          createdAt : new Date(),
          updatedAt : new Date()
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
