// controller->Model
const db = require('../db/models');
const Account = db.Account;
// 1. select * from cars => findAll
exports.findAll=(req,res)=>
{
  Account.findAll()
   .then(data=>res.json(data))
   .catch(err=>{
       res.status(500)
       .send({message:err.message || 'something went wrong '})
   });
};

// 2. seelct * from cars where id=?=>findByPk

exports.findByPk=(req,res)=>{
const id = parseInt(req.params.id);
    Account.findByPk(id)
    .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });

};

exports.create=(req,res)=>{
  if(!req.body.accountno){
    res.status(400).send({
      message: "Content can not be empty!"
    });
    return;
  }
  const newAccount ={
   accountno : req.body.accountno,
   accountName: req.body.accountName,
   Balance: req.body.Balance,
   createdAt:new Date(),
	 updatedAt:new Date()
  }
  Account.create(newAccount)
  .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });
};

exports.update=(req,res)=>{
  const id = req.params.id;
  Account.update(req.body, { where: { id: id } })
			.then(num => {
				if (num == 1) {
				res.send({
					message: `Account with id ${id} updated successfully.`
				});
				} else {
				res.send({
					message: `Cannot update Account with id=${id}. Maybe Account was not found or req.body is empty!`
				});
				}
			})
			.catch((err) => {
				res.status(500).send({
					message: err.message || " Some error retriving Account data"
				})
			})
};

//delete from people where id=?
exports.delete = (req, res) => {
  const id = req.params.id;
  Account.destroy({ where: { id: id } })
    .then(num => {
      if (num == 1) {
        res.send({ message: `Account with id=${id} deleted successfully!` });
      } else {
        res.send({ message: `Cannot delete Account with id=${id}. Maybe Account was not found!` });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || " Could not delete Account with id=" + id
      });
    });
};