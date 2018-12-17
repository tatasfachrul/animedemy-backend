'use strict'
const Database = use('Database')
const ModelUser = use('App/Models/User')

class UserController {
	async register({request, response}){
		const data_insert = request.only(["username","email","name","password"])

		const check = await Database
		.from('users')
		.where('username', data_insert.username)
		.orWhere('email', data_insert.email)

		if (check != "") {
			return response.status(404).json({data: 'Insert Data Gagal'})
		}else{
			const data_user = new ModelUser()
			data_user.username = data_insert.username
			data_user.email = data_insert.email
			data_user.name = data_insert.name
			data_user.password = data_insert.password
			await data_user.save()
			return response.status(201).json(data_user)	
		}
	}


	async Login({ request, auth }) {
	  const { email, password } = request.all()
	  return auth
	    .authenticator('jwt')
	    .withRefreshToken()
	    .attempt(email, password)
	}

	async RefreshToken({request, auth}){
		const refreshToken = request.input('refresh_token')
		return await auth
		.newRefreshToken()
		.generateForRefreshToken(refreshToken)
	}

	async Logout({auth, response}){
		const apiToken = auth.getAuthHeader()
		await auth
		.authenticator('jwt')
		.revokeTokens([apiToken])
		return response.json({data: "Logout"})
	}

	async Profile({ response, auth }) {
	  return response.send(auth.current.user)
	}

}

module.exports = UserController
