'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.on('/').render('welcome')

Route.group(() => {

Route.post('login', 'UserController.Login')
Route.get('profile', 'UserController.Profile').middleware(['auth:jwt'])
Route.post('logout', 'UserController.Logout').middleware(['auth:jwt'])
Route.post('refreshlogin', 'UserController.RefreshToken').middleware(['auth:jwt'])
Route.post('register','UserController.register')
Route.post('subscribe','UserController.user_subscribe').middleware(['auth:jwt'])

Route.get('categories','CategoryController.index').middleware(['auth:jwt'])

Route.get('videos','VideoController.index').middleware(['auth:jwt'])
Route.get('videos/cached','VideoController.cached').middleware(['auth:jwt'])
Route.get('video/:id','VideoController.video_id').middleware(['auth:jwt'])
Route.get('videos/search','VideoController.videos_search').middleware(['auth:jwt'])
Route.get('video/:id/related','VideoController.video_related').middleware(['auth:jwt'])
Route.get('video/:id/series','VideoController.video_series').middleware(['auth:jwt'])
Route.get('videos/popular','VideoController.videos_popular').middleware(['auth:jwt'])
Route.get('videos/trending','VideoController.videos_trending').middleware(['auth:jwt'])

Route.post('video/insert','VideoController.video_insert').middleware(['auth:jwt'])
Route.post('videos/insert','VideoController.videos_insert').middleware(['auth:jwt'])

}).prefix('api/v1')

