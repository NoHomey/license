module.exports = ($scope) ->
  @$inject = ["$scope"]
  $scope.x = 9
  $scope.y = 9
  picture = []
  lock = 0
  $scope.run = (x, y) ->
    $scope.x = x
    $scope.y = y
    $scope.start = true
    picture = new Array x
    for i in $scope.range x
      picture[i] = new Array y
      for j in $scope.range y
        picture[i][j] = 0
  $scope.range = (r) -> [0..(r - 1)]
  $scope.class = (i, j) ->
    switch picture[i][j]
      when 1 then "red-untouched"
      when 2 then "red-touched"
      when 3 then "blue-untouched"
      when 4 then "blue-touched"
      when 5 then "green-untouched"
      when 6 then "green-touched"
      else "default"
  $scope.draw = (x, y) ->
    if lock then return
    if picture[x][y] is 3
      picture[x][y] =  0
    else
      picture[x][y] =  3

  $scope.go = ->
    lock = 1
    x = y = 0
    setInterval ->
        old = picture[x][y]
        new = 1
        picture[x][y] = new
        switch old
          when 0 then new = 2
          when 3 then 6
          when 5 then "green-untouched"
          when 6 then "green-touched"
        picture[x++][y++] = new
        $scope.$digest()
      , 2000
  $scope
