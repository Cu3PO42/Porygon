// Generated by LiveScript 1.2.0
(function(){
  var _, ref$, pkm, effectivity, res$, type, ref1$, val, i$, len$, porygon;
  for (_ in ref$ = pokedex_dictionary) {
    pkm = ref$[_];
    effectivity = weaknesschart[pkm.types[0]];
    if (pkm.types[1] != null) {
      res$ = {};
      for (type in ref1$ = weaknesschart[pkm.types[1]]) {
        val = ref1$[type];
        res$[type] = val * effectivity[type];
      }
      effectivity = res$;
    }
    res$ = {};
    for (i$ = 0, len$ = (ref1$ = ['0', '0.25', '0.5', '1', '2', '4']).length; i$ < len$; ++i$) {
      val = ref1$[i$];
      res$[val] = [];
    }
    pkm.effectivity = res$;
    for (type in effectivity) {
      val = effectivity[type];
      pkm.effectivity[val].push(type);
    }
  }
  porygon = angular.module('porygon', [], function($interpolateProvider){
    $interpolateProvider.startSymbol('[[');
    return $interpolateProvider.endSymbol(']]');
  });
  porygon.controller('Pkmn', function($scope){
    return $scope.pkmn = pokedex_dictionary;
  });
  angular.bootstrap(document, ['porygon']);
}).call(this);
