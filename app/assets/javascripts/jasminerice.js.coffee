#=require jquery
#=require jasmine
#=require jasmine-html
#=require boot
#=require jasmine-jquery

(->

  env = jasmine.getEnv();

  jasmineInterface = jasmineRequire.interface(jasmine, env);

  extend = (destination, source) ->
    for property in source
      destination[property] = source[property]
    return destination;

  if (typeof(window) == "undefined" && typeof(exports) == "object")
    extend(exports, jasmineInterface);
  else
    extend(window, jasmineInterface);
  

  queryString = new jasmine.QueryString({
    getWindowLocation: ->
      return window.location
  });

  catchingExceptions = queryString.getParam("catch");

  if catchingExceptions == "undefined"
    env.catchExceptions true
  else
    env.catchExceptions catchingExceptions    


  htmlReporter = new jasmine.HtmlReporter({
    env: env,
    onRaiseExceptionsClick: ->
      queryString.setParam("catch", !env.catchingExceptions())
    ,
    getContainer: ->
      return document.body
    ,
    createElement: ->
      return document.createElement.apply(document, arguments)
    ,
    createTextNode: ->
      return document.createTextNode.apply(document, arguments);
    ,
    timer: new jasmine.Timer()
  });


  env.addReporter(jasmineInterface.jsApiReporter)
  env.addReporter(htmlReporter)

  specFilter = new jasmine.HtmlSpecFilter({
    filterString: ->
      return queryString.getParam("spec");
  });

  env.specFilter = (spec) ->
    return specFilter.matches(spec.getFullName());

  jasmine.getFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getStyleFixtures().fixturesPath = 'jasmine/fixtures'
  jasmine.getJSONFixtures().fixturesPath = 'jasmine/fixtures/json'

  jasmine.rice = {}
  jasmine.rice.autoExecute = true

  currentWindowOnload = window.onload

  window.onload = ->
    currentWindowOnload() if currentWindowOnload
    htmlReporter.initialize();
    env.execute();
)()
