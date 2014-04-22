for _, pkm of pokedex_dictionary
    effectivity = weaknesschart[pkm.types[0]]
    effectivity = {[type, val*effectivity[type]] for type, val of weaknesschart[pkm.types[1]]} if pkm.types[1]?
    pkm.effectivity = {[val, []] for val in <[0 0.25 0.5 1 2 4]>}
    for type, val of effectivity
        pkm.effectivity[val].push(type)
    pkm["gender ratio"] = {"m": 0.5, "f": 0.5} unless pkm["gender ratio"]?
    pkm["gender ratio"] = {[type, val*100] for type, val of pkm["gender ratio"]} if pkm["gender ratio"] != "n"
porygon = angular.module 'porygon', [], ($interpolateProvider) ->
    $interpolateProvider.startSymbol('[[')
    $interpolateProvider.endSymbol(']]')
porygon.controller 'Pkmn', ($scope) ->
    $scope.pkmn = pokedex_dictionary
    $scope.bar = (width, color1, color2) ->
        (for pref in ["-webkit-" "-o-" "-moz-" ""]
            "background: #{pref}linear-gradient(left, #{color1} 0%, #{color1} #{width}%, #{color2} #{width}%, #{color2} 100%)"
        ).join(";")
    $scope.gender = $scope.base = true
angular.bootstrap(document, ['porygon'])
