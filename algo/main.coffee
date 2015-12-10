dependencies = require "./dependencies"
angular = dependencies.angular
moduleName = "main"

deps = [
  dependencies["angular-animate"]
  dependencies["angular-aria"]
  dependencies["angular-messages"]
  dependencies["angular-material"]
]

angular
  .module moduleName, deps
    .controller "main", require "./controller"

angular
  .element document
    .ready -> angular.bootstrap document, [moduleName]
