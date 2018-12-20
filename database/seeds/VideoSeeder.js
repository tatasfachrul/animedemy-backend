'use strict'

/*
|--------------------------------------------------------------------------
| VideoSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class VideoSeeder {
  async run () {
    await Factory.get('videos').createMany(5)
  }
}

module.exports = VideoSeeder
