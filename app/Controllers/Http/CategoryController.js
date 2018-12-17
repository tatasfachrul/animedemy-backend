'use strict'
const Database = use('Database')
class CategoryController {
	async index({response}){
		const data_movies = await Database.from('categories')
		return response.json(data_movies)
	}
}

module.exports = CategoryController
