{ Model } = require 'backbone'
{ equal: eq, ok } = require 'assert'
attrs = require '../index.coffee'

describe 'backbone-attrs', ->
  it 'sets up ES5 getters/setters', ->
    class Foo extends Model
      attrs this, 'bar', 'qux'
    foo = new Foo bar: 1
    eq foo.bar, 1
    foo.qux = 2
    eq foo.get('qux'), 2
    foo.set 'qux', 3
    eq foo.qux, 3

  describe 'installing', ->
    attrs.install()

    it 'can be installed into Model.attrs()', ->
      class Foo extends Model
        @attrs 'bar', 'qux'
      foo = new Foo bar: 1
      eq foo.bar, 1

    it 'can be installed into a specific object', ->
      MyModel = {}
      attrs.install MyModel
      ok MyModel.attrs?

    it 'also works with `attrs` property, for JS users', ->
      Foo = Model.extend
        attrs: [ 'bar', 'qux' ]
      foo = new Foo bar: 1
      eq foo.bar, 1
      foo.qux = 2
      eq foo.get('qux'), 2
