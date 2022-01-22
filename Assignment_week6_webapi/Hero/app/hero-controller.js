// controller->Model
//UserController=>User 
const db=require('../db/models');//index.js=>db
const Hero=db.Hero;
// 1. select * from users => findAll
exports.findAll=(req,resp)=>{
  Hero.findAll()
        .then(data=>resp.json(data))
        .catch(err=>{
            resp.status(500)
                .send({message:err.message||
                `Something went wrong`})
        });
};

// 2. seelct * from users where id=?=>findByPK

exports.findByPk=(req,resp)=>{
  const id=parseInt(req.params.id);
  Hero.findByPk(id)
      .then(data=>resp.json(data))
      .catch(err=>{
          resp.status(500)
              .send({message:err.message||
              `Something went wrong`})
      });
};

//insert into people (firstName,lastName,createdAt,updatedAt)
	// values(?,?,?,?)
	exports.create = (req, resp) => {
		if(!req.body.heroName){
			res.status(400).send({
				message: "Content can not be empty!"
			});
			return;
		}
		const newHero={
			heroName: req.body.heroName,
			film: req.body.film,
			createdAt:new Date(),
			updatedAt:new Date()
		}
		Hero.create(newHero)
			.then(data=>{resp.send(data);})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Some error Creating new Hero data"
				})
			})
	};

  //update people set firstName=?, lastName=? where id=?
	exports.update = (req, resp) => {
		const id = req.params.id;
	
		Hero.update(req.body, { where: { id: id } })
			.then(num => {
				if (num == 1) {
				resp.send({
					message: `Hero with id ${id} updated successfully.`
				});
				} else {
				resp.send({
					message: `Cannot update Hero with id=${id}. Maybe Hero was not found or req.body is empty!`
				});
				}
			})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Some error retriving Hero data"
				})
			})
	};

  //delete from people where id=?
	exports.delete = (req, resp) => {
		const id = req.params.id;
		Hero.destroy({ where: { id: id } })
			.then(num => {
				if (num == 1) {
					resp.send({ message: `Hero with id=${id} deleted successfully!` });
				} else {
					resp.send({ message: `Cannot delete Hero with id=${id}. Maybe Hero was not found!` });
				}
			})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Could not delete Hero with id=" + id
				})
			})
	};