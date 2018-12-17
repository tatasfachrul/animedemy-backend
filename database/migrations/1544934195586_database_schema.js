'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class DatabaseSchema extends Schema {
  up () {
    this.create('categories', (table) => {
      table.increments()
      table.string('title').notNullable()
      table.timestamps()
    })
    this.create('series', (table) => {
      table.increments()
      table.string('title').notNullable()
      table.timestamps()
    })
    this.create('videos', (table) => {
      table.increments()
      table.integer('episode').notNullable()
      table.integer('series_id').notNullable()
      table.string('title').notNullable()
      table.string('image_url').unique().notNullable()
      table.string('description').nullable()
      table.string('starring').notNullable()
      table.integer('category_id').notNullable()
      table.integer('age_restriction').notNullable()
      table.integer('imdb_score').notNullable()
      table.string('video_url').unique().notNullable()
      table.boolean('is_trending').defaultTo(false)
      table.boolean('is_popular').defaultTo(false)
      table.timestamps()
    })
  }

  down () {
    this.drop('categories')
    this.drop('series')
    this.drop('videos')
  }
}

module.exports = DatabaseSchema
