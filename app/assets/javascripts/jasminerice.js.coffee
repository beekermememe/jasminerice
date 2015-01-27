#=require jasmine
#=require jasmine-html
#=require boot
#=require jasmine-jquery-1.5.8

(->

  jasmine.getFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getStyleFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getJSONFixtures().fixturesPath = 'jasmine/fixtures/json'

  jasmine.rice = {}
  jasmine.rice.autoExecute = true

  currentWindowOnload = window.onload
  window.onload = ->
    currentWindowOnload()  if currentWindowOnload
    if jasmine.rice.autoExecute
      execJasmine()
)()
