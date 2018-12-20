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
    Route.get('profile', 'UserController.Profile')
    Route.post('logout', 'UserController.Logout')
    Route.post('refreshlogin', 'UserController.RefreshToken')
    Route.post('register','UserController.register')
    Route.post('subscribe','UserController.user_subscribe')
    
    Route.get('categories','CategoryController.index')
    Route.get('series', 'VideoController.series')
    Route.get('videos_series', 'VideoController.videos_seriesList')
    
    Route.get('videos','VideoController.index')
    Route.get('videos/cached','VideoController.cached')
    Route.get('video/:id','VideoController.video_id')
    Route.get('videos/search','VideoController.videos_search')
    Route.get('video/:id/related','VideoController.video_related')
    Route.get('video/:id/series','VideoController.video_series')
    Route.get('videos/popular','VideoController.videos_popular')
    Route.get('videos/trending','VideoController.videos_trending')
    
    Route.get('videos/series/:id', 'VideoController.videos_by_series')
    Route.get('videos/category/:id', 'VideoController.videos_by_category')
    
    Route.post('video/insert','VideoController.video_insert').middleware(['auth:jwt'])
    Route.post('videos/insert','VideoController.videos_insert').middleware(['auth:jwt'])

}).prefix('api/v1')

