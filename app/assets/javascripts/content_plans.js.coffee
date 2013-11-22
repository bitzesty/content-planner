# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
applyDiff = ->
  $("section.diff").each (index) ->
    GOVUK.diff $(this).attr("id")

$(document).ready applyDiff
$(document).on "page:load", applyDiff

jsNeeds = ->
  $("input.js-needs").select2
    tags: true
    initSelection: (element, callback) ->
      data = []
      $(element.val().split(",")).each ->
        data.push
          id: $.trim(this)
          text: $.trim(this)
      callback data
    ajax:
      url: "/needs"
      dataType: "json"
      data: (term, page) ->
        q: term
        page: page

      results: (data, page) ->
        results: data

$(document).ready jsNeeds
$(document).on "page:load", jsNeeds