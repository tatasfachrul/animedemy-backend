'use strict'

/*
|--------------------------------------------------------------------------
| Factory
|--------------------------------------------------------------------------
|
| Factories are used to define blueprints for database tables or Lucid
| models. Later you can use these blueprints to seed your database
| with dummy data.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

Factory.blueprint('App/Models/Video', (faker) => {
  return {
    episode:faker.integer({min:1,max:12}),
    series_id:faker.integer({min:1,max:5}),
    title:faker.sentence({words:6}),
    image_url:faker.url({extensions: ['gif', 'jpg', 'png']}),
    description:faker.sentence({words:10}),
    starring:faker.sentence({words:5}),
    category_id:faker.integer({min:1,max:5}),
    age_restriction:faker.integer({min:10,max:50}),
    imdb_score:faker.integer({min:10,max:50}),
    video_url:faker.url({extensions: ['gif', 'jpg', 'png']}),
    is_trending:faker.integer({min:0,max:1}),
    is_popular:faker.integer({min:0,max:1})
  }
})
