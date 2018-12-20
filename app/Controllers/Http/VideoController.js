'use strict'

const Redis = use('Redis')
const Database = use('Database')
const ModelVideos = use('App/Models/Video')

class VideoController {
	async index({response}){
		const data_movies = await Database.from('videos').orderBy('id', 'desc')
		return response.json(data_movies)
	}
	async cached(){
		const cachedVideos = await Redis.get('videos')
	    if (cachedVideos) {
	      return cachedVideos
	    }

	    const videos = await ModelVideos.all()
	    await Redis.set('users', JSON.stringify(videos))
	    return videos
	}
	async video_id({params, response}){
		const id = params.id
		const data_movie = await Database.from('videos').where('id', id)
		if (data_movie == "") {
			return response.status(404).json({data: 'data tidak ditemukan'})	
		}else{
			return response.json(data_movie)		
		}
	}
	async videos_search({params, request, response}){
		const search = request.input('search')
		const data_movies = await Database.
		select(
				'videos.id as id',
				'videos.title as title',
				'videos.episode',
				'videos.image_url',
				'videos.starring',
				'videos.description',
				'videos.age_restriction',
				'videos.imdb_score',
				'videos.video_url',
				'videos.is_trending',
				'videos.is_popular',
				'categories.title as category',
				'series.title as series',
			)
		.from('videos')
		.leftJoin('categories', function () {
		    this
		      .on('videos.category_id', 'categories.id')
		})
		.leftJoin('series', function () {
		    this
		      .on('videos.series_id', 'series.id')
		})
		.where('videos.title','like', '%'+search+'%')
		.orWhere('videos.episode','like', '%'+search+'%')
		.orWhere('videos.starring','like','%'+search+'%')
		.orWhere('videos.description','like','%'+search+'%')
		.orWhere('videos.age_restriction','like','%'+search+'%')
		.orWhere('videos.imdb_score','like','%'+search+'%')
		.orWhere('categories.title','like','%'+search+'%')
		.orWhere('series.title','like','%'+search+'%')
		.orderBy('videos.id', 'desc')
		if (data_movies == "") {
			return response.status(404).json({data: 'data tidak ditemukan'})	
		}
		return response.json(data_movies)
	}
	async video_related({params, response}){
		const id = params.id
		const data_movies = await Database.
		select(
				'videos.id as id',
				'videos.title as title',
				'videos.episode',
				'videos.image_url',
				'videos.starring',
				'videos.description',
				'videos.age_restriction',
				'videos.imdb_score',
				'videos.video_url',
				'videos.is_trending',
				'videos.is_popular',
				'categories.title as category',
				'series.title as series',
			)
		.from('videos')
		.leftJoin('categories', function () {
		    this
		      .on('videos.category_id', 'categories.id')
		})
		.leftJoin('series', function () {
		    this
		      .on('videos.series_id', 'series.id')
		})
		.where('category_id',id)
		if (data_movies == "") {
			return response.status(404).json({data: 'data tidak ditemukan'})	
		}
		return response.json(data_movies)
	}
	async video_series({params, response}){
		const id = params.id
		const data_movies = await Database.
		select(
				'videos.id as id',
				'videos.title as title',
				'videos.episode',
				'videos.image_url',
				'videos.starring',
				'videos.description',
				'videos.age_restriction',
				'videos.imdb_score',
				'videos.video_url',
				'videos.is_trending',
				'videos.is_popular',
				'categories.title as category',
				'series.title as series',
			)
		.from('videos')
		.leftJoin('categories', function () {
		    this
		      .on('videos.category_id', 'categories.id')
		})
		.groupBy('videos.series_id')
		.leftJoin('series', function () {
		    this
		      .on('videos.series_id', 'series.id')
		})
		.where('series_id',id)
		if (data_movies == "") {
			return response.status(404).json({data: 'data tidak ditemukan'})	
		}
		return response.json(data_movies)
	}
	async videos_popular({response}){
		const data_movies = await Database.from('videos').where('is_popular', 1).orderBy('id', 'desc')
		return response.json(data_movies)
	}
	async videos_trending({response}){
		const data_movies = await Database.from('videos').where('is_trending', 1).orderBy('id', 'desc')
		return response.json(data_movies)
	}
	async videos_seriesList({response}){
		const data_series = await Database.from('series')
		return response.json(data_series)
	}
	async videos_by_series({params, response}){
		const id_series = params.id
		const data_videos = await Database.from('videos').where('series_id', id_series)
		return response.json(data_videos)
	}
	async videos_by_category({params, response}){
		const id_category = params.id
		const data_videos = await Database.from('videos').where('category_id', id_category)
		return response.json(data_videos)
	}
	async series({response}){
		const data_series = await Database
		.select('series.id as id','series.title as series', 'videos.image_url')
		.from('series')
		.leftJoin('videos', function(){
			this
			.on('series.id', 'videos.series_id')
		})
		return response.json(data_series)
	}

	async video_insert({request, response}){
		const data_insert = request.only(
				[
					"episode",
					"series_id",
					"title",
					"image_url",
					"description",
					"starring",
					"category_id",
					"age_restriction",
					"imdb_score",
					"video_url",
					"is_trending",
					"is_popular",
				]
			)
		const data_video = new ModelVideos()
		data_video.episode = data_insert.episode
		data_video.series_id = data_insert.series_id
		data_video.title = data_insert.title
		data_video.image_url = data_insert.image_url
		data_video.description = data_insert.description
		data_video.starring = data_insert.starring
		data_video.category_id = data_insert.category_id
		data_video.age_restriction = data_insert.age_restriction
		data_video.imdb_score = data_insert.imdb_score
		data_video.video_url = data_insert.video_url
		data_video.is_trending = data_insert.is_trending
		data_video.is_popular = data_insert.is_popular

		await data_video.save()
		return response.json(data_video)
	}
}

module.exports = VideoController
