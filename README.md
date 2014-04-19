# backbone-attrs

ES5 getters/setters for Backbone models

### Install

```bash
npm install backbone-attrs
```

### Use

#### JavaScript
```js
var attrs = require('backbone-attrs');

var User = Model.extend();
attrs(User, 'username', 'email');

var user = new User;
user.username = 'john';     // -> user.set('username', 'john')
console.log(user.username); // -> user.get('username')

// Can also optionally install() into Model for easier usage
require('backbone-attrs').install();
var User = Model.extend({
  attrs: [ 'username', 'email' ]
});
```

#### CoffeeScript 
```coffee
attrs = require 'backbone-attrs'

class User extends Model
  attrs this, 'username', 'email'

user = new User
user.username = 'john'    # -> user.set 'username', 'john'
console.log user.username # -> user.get 'username'

# Can also optionally install into Model.attrs() for easier usage
require('backbone-attrs').install()

class User extends Model
  @attrs 'username', 'email'
```

#### Test
```bash
npm test
```

#### License
MIT
