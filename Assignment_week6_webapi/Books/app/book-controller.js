// controller->Model
//UserController=>User 
const db=require('../db/models');//index.js=>db
const Book=db.Book;
// 1. select * from users => findAll
exports.findAll=(req,resp)=>{
      	Book.findAll()
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
  Book.findByPk(id)
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
		if(!req.body.bookName){
			res.status(400).send({
				message: "Content can not be empty!"
			});
			return;
		}
		const newBook={
			bookName: req.body.bookName,
			authorName: req.body.authorName,
      publicationDate : new Date(),
			createdAt:new Date(),
			updatedAt:new Date()
		}
		Book.create(newBook)
			.then(data=>{resp.send(data);})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Some error Creating new Book data"
				})
			})
	};

  //update people set firstName=?, lastName=? where id=?
	exports.update = (req, resp) => {
		const id = req.params.id;
	
		Book.update(req.body, { where: { id: id } })
			.then(num => {
				if (num == 1) {
				resp.send({
					message: `Book with id ${id} updated successfully.`
				});
				} else {
				resp.send({
					message: `Cannot update Book with id=${id}. Maybe Book was not found or req.body is empty!`
				});
				}
			})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Some error retriving Book data"
				})
			})
	};

  //delete from people where id=?
	exports.delete = (req, resp) => {
		const id = req.params.id;
		Book.destroy({ where: { id: id } })
			.then(num => {
				if (num == 1) {
					resp.send({ message: `Book with id=${id} deleted successfully!` });
				} else {
					resp.send({ message: `Cannot delete Book with id=${id}. Maybe Book was not found!` });
				}
			})
			.catch((err) => {
				resp.status(500).send({
					message: err.message || " Could not delete Book with id=" + id
				})
			})
	};