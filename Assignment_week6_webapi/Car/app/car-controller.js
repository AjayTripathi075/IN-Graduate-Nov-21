// controller->Model
const db = require('../db/models');
const Car = db.Car;
// 1. select * from cars => findAll
exports.findAll=(req,res)=>
{
   Car.findAll()
   .then(data=>res.json(data))
   .catch(err=>{
       res.status(500)
       .send({message:err.message || 'something went wrong '})
   });
};

// 2. seelct * from cars where id=?=>findByPk

exports.findByPk=(req,res)=>{
const id = parseInt(req.params.id);
    Car.findByPk(id)
    .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });

};

exports.create=(req,res)=>{
  if(!req.body.carName){
    res.status(400).send({
      message: "Content can not be empty!"
    });
    return;
  }
  const newCar ={
   carName : req.body.carName,
   brandName: req.body.brandName,
   createdAt:new Date(),
	 updatedAt:new Date()
  }
  Car.create(newCar)
  .then(data=>res.json(data))
    .catch(err=>{
       res.status(500)
       .send({message:err.message || 'Something went wrong'});
    });
};


exports.update=(req,res)=>{
  const id = req.params.id;
		Car.update(req.body, { where: { id: id } })
			.then(num => {
				if (num == 1) {
				res.send({
					message: `Car with id ${id} updated successfully.`
				});
				} else {
				res.send({
					message: `Cannot update Car with id=${id}. Maybe Car was not found or req.body is empty!`
				});
				}
			})
			.catch((err) => {
				res.status(500).send({
					message: err.message || " Some error retriving Car data"
				})
			})
};

//delete from people where id=?
exports.delete = (req, res) => {
  const id = req.params.id;
  Car.destroy({ where: { id: id } })
    .then(num => {
      if (num == 1) {
        res.send({ message: `Car with id=${id} deleted successfully!` });
      } else {
        res.send({ message: `Cannot delete Car with id=${id}. Maybe Car was not found!` });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || " Could not delete Person with id=" + id
      });
    });
};
