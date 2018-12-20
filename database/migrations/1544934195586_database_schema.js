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
      table.integer('series_id').notNullable().unsigned().references('id').inTable('series')
      table.string('title').notNullable()
      table.text('image_url').notNullable()
      table.string('description').nullable()
      table.string('starring').notNullable()
      table.integer('category_id').notNullable().unsigned().references('id').inTable('categories')
      table.integer('age_restriction').notNullable()
      table.integer('imdb_score').notNullable()
      table.text('video_url').notNullable()
      table.boolean('is_trending').defaultTo(false)
      table.boolean('is_popular').defaultTo(false)
      table.timestamps()
    })
    this.create('subscribe', (table) => {
      table.increments()
      table.integer('user').notNullable()
      table.string('email').notNullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('categories')
    this.drop('series')
    this.drop('videos')
    this.drop('subscribe')
  }
}

module.exports = DatabaseSchema
