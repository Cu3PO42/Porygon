for _, pkm of pokedex_dictionary
    effectivity = weaknesschart[pkm.types[0]]
    effectivity = {[type, val*effectivity[type]] for type, val of weaknesschart[pkm.types[1]]} if pkm.types[1]?
    pkm.effectivity = {[val, []] for val in <[0 0.25 0.5 1 2 4]>}
    for type, val of effectivity
        pkm.effectivity[val].push(type)
porygon = angular.module 'porygon', [], ($interpolateProvider) ->
    $interpolateProvider.startSymbol('[[')
    $interpolateProvider.endSymbol(']]')
porygon.controller 'Pkmn', ($scope) ->
    $scope.pkmn = pokedex_dictionary
angular.bootstrap(document, ['porygon'])
