attrs = (ctor, names...) ->
  names.forEach (name) ->
    Object.defineProperty ctor::, name,
      get: -> @get name
      set: (val) -> @set name, val
      enumerable: true
      configurable: true

# `+''` is to make browserify ignore this
attrs.install = (target = require('backbone'+'').Model) ->
  target.attrs = (names...) -> attrs this, names...
  extend = target.extend
  target.extend = (protoProps, staticProps) ->
    child = extend.call this, protoProps, staticProps
    if protoProps.attrs?
      attrs child, protoProps.attrs...
    child

module.exports = attrs
