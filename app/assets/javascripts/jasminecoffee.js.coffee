#=require jquery-2.1.3
#=require jasmine
#=require jasmine-html
#=require boot
#=require jasmine-jquery-2.0.5

(->

  jasmine.getFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getStyleFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getJSONFixtures().fixturesPath = 'jasmine/fixtures/json'

  jasmine.coffee = {}
  jasmine.coffee.autoExecute = true

  currentWindowOnload = window.onload
  window.onload = ->
    currentWindowOnload()  if currentWindowOnload
)()
