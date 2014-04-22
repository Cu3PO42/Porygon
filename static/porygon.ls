porygon = angular.module 'porygon', [], ($interpolateProvider) ->
    $interpolateProvider.startSymbol('[[')
    $interpolateProvider.endSymbol(']]')
porygon.controller 'Pkmn', ($scope) ->
    $scope.pkmn = pokedex_dictionary
angular.bootstrap(document, ['porygon'])
