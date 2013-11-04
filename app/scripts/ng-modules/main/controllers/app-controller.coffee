'use strict'

angular.module('main.controllers')
.controller 'AppCtrl', ($scope, $location, $state, MainConfig) ->

    # use the sate for various things like conditional css based on custom state data
    $scope.state = $state

    # Uses the url to determine if the selected
    # menu item should have the class active.
    $scope.$location = $location
    $scope.$watch('$location.path()', (path) ->
      $scope.activeNavId = path || '/'
    )

    $scope.searchPrice = MainConfig.SEARCH_PRICE
    $scope.currentDate = Date.now()

    # getClass compares the current url with the id.
    # If the current url starts with the id it returns 'active'
    # otherwise it will return '' an empty string. E.g.
    #
    #   # current url = '/products/1'
    #   getClass('/products') # returns 'active'
    #   getClass('/orders') # returns ''
    #
    $scope.getClass = (id) ->
      if $scope.activeNavId.substring(0, id.length) == id
        return 'active'
      else
        return ''
