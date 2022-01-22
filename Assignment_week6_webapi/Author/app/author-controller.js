// controller->Model
const db = require('../db/models');
const Author = db.Author;
// 1. select * from cars => findAll
exports.findAll=(req,res)=>
{
  Author.findAll()
   .then(data=>res.json(data))
   .catch(err=>{
       res.status(500)
       .send({message:err.message || 'something went wrong '})
   });
};

// 2. seelct * from cars where id=?=>findByPk

exports.findByPk=(req,res)=>{
const id = parseInt(req.params.id);
    Author.findByPk(id)
    .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });

};

exports.create=(req,res)=>{
  if(!req.body.authorName){
    res.status(400).send({
      message: "Content can not be empty!"
    });
    return;
  }
  const newAuthor ={
   authorName : req.body.carName,
   bookName: req.body.brandName,
   createdAt:new Date(),
	 updatedAt:new Date()
  }
  Car.create(newAuthor)
  .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });
};


exports.update=(req,res)=>{
  const id = req.params.id;
  Author.update(req.body, { where: { id: id } })
			.then(num => {
				if (num == 1) {
				res.send({
					message: `Author with id ${id} updated successfully.`
				});
				} else {
				res.send({
					message: `Cannot update Author with id=${id}. Maybe Author was not found or req.body is empty!`
				});
				}
			})
			.catch((err) => {
				res.status(500).send({
					message: err.message || " Some error retriving Author data"
				})
			})
};

//delete from people where id=?
exports.delete = (req, res) => {
  const id = req.params.id;
  Author.destroy({ where: { id: id } })
    .then(num => {
      if (num == 1) {
        res.send({ message: `Author with id=${id} deleted successfully!` });
      } else {
        res.send({ message: `Cannot delete Author with id=${id}. Maybe Author was not found!` });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || " Could not delete Person with id=" + id
      });
    });
};