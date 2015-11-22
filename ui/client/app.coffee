template = require "./template"
angular = require "angular"
animate = require "angular-animate"
aria = require "angular-aria"
material = require "angular-material"
messages = require "angular-messages"
router = require "ui-router"
upload = require "ng-file-upload"

angular
  .module "cntrls", []
    .controller "homeCtrl", ($state, Upload, $location) ->
      vm = @
      btns = -> ["register", "show", "csv", "exel"]
      vm.$inject = ["$state", "Upload", "$location"]
      vm.btns = btns()
      vm.go = (state, i) ->
        vm.select = [false, false, false, false]
        vm.select[i] = true
        $state.go "home.#{state}"
      init = ->
        states = btns()
        select = [false, false, false, false]
        location = $location.path()
        check = (url) -> if "/#{url}" is location then select[states.indexOf url] = true
        check state for state in states
        select
      vm.select = init()
      vm
    .controller "registerCtrl", ($state) ->
      vm = @
      vm.$inject = ["$state"]
      vm.state = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12"]
      vm.select = [false, false, false, false, false, false, false, false, false, false, false, false]
      vm.go = (state, i) ->
        vm.index = i
        vm.select = [false, false, false, false, false, false, false, false, false, false, false, false]
        vm.select[i] = true
        $state.go "home.register.#{state}"
      vm.empl = 0
      vm.len = 0
      vm.inc = -> if vm.empl < 2 then vm.empl++
      vm.incl = -> vm.len++
      vm.index = 0
      vm.date = -> new Date()
      vm.next = -> vm.go vm.state[++vm.index], vm.index
      vm.prev = -> vm.go vm.state[--vm.index], vm.index
      vm.reg = {}
      vm.btns = [
        "Personal Details"
        "Employment Details"
        "Payment Details"
        "Emergensy Contact"
        "Legal Entithement"
        "Employment Record"
        "Languages"
        "References"
        "Additional Information"
        "Health"
        "Photo and CV"
        "Declaration"
      ]
      vm.health = [
        "Are you presently receiving any treatments from your doctor ?"
        "Are you presently taking a any drugs or medication, prescribed or otherwise ?"
        "Have you been hospitalizated for the past years ?"
        "Do you have any allergies ?"
        "Do you have any disability ?"
      ]
      vm.relation = ["Spouce", "Parent", "Sibling", "Child", "Friend", "Partner", "Other"]
      vm.autoFill = (val, set) ->
        if val
          fill = (f) -> set["Emergensy#{f}"] = set[f]
          fields = [
            "Address"
            "AddressLine2"
            "Town"
            "PostCode"
          ]
          fill field for field in fields
      vm.submit = ->
        map = {
            "Address": 0
            "Statement": 1
            "Paylist": 2
            "EmergensyTitle": 3
        }
        check = (key, val) -> if not vm.reg[key]? then vm.go vm.state[val], val
        check k, v for k, v of map
      vm.go "s1", 0
      vm

dependencies = [
  router
  material
  messages
  upload
  aria
  animate
  "cntrls"
]

angular
  .module "app", dependencies
  .config ($stateProvider) ->
    vm = @
    vm.$inject = ["$stateProvider"]
    $stateProvider
      .state "home", template: (template "homeView"), controller: "homeCtrl as home"
      .state "home.register", template: (template "registerView"), controller: "registerCtrl as register", url: "/register"
      .state "home.register.s1", template: template "s1"
      .state "home.register.s2", template: template "s2"
      .state "home.register.s3", template: template "s3"
      .state "home.register.s4", template: template "s4"
      .state "home.register.s5", template: template "s5"
      .state "home.register.s6", template: template "s6"
      .state "home.register.s7", template: template "s7"
      .state "home.register.s8", template: template "s8"
      .state "home.register.s9", template: template "s9"
      .state "home.register.s10", template: template "s10"
      .state "home.register.s11", template: template "s11"
      .state "home.register.s12", template: template "s12"
      .state "home.show", template: "showView"  #,controller: "showCtrl as show", url: "/show"
      .state "home.csv", template: "Download CSV", url: "/csv"
      .state "home.exel", template: "Download Exel", url: "/exel"
  .run ($state) ->
    vm = @
    vm.$inject = ["$state"]
    $state.go "home"
  .filter "range", ->
    (input, total) ->
      total = parseInt total
      [0..total]

angular.bootstrap document.body, ["app"]
