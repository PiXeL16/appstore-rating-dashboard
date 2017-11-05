Batman.Filters.dateFormat = (date) ->
  if moment(date).isValid() then moment(date).fromNow() else date

class Dashing.AppRating extends Dashing.Widget
  onData: (data) ->
    if data.averageUserRatingForCurrentVersion <= 1
      $(@node).css('background-color', '#a73737')
    else if data.averageUserRatingForCurrentVersion <= 2.5
      $(@node).css('background-color', '#ac7b41')
    else if data.averageUserRatingForCurrentVersion < 4
      $(@node).css('background-color', '#acac3c')
    else if data.averageUserRatingForCurrentVersion >= 4
      $(@node).css('background-color', '#43ac37')
  @accessor 'image', ->
    rating = @get('averageUserRatingForCurrentVersion')
    if (rating <= 1) then 'assets/star-rating-1.svg'
    else if (rating <= 2) then 'assets/star-rating-2.svg'
    else if (rating <= 3) then 'assets/star-rating-3.svg'
    else if (rating <= 4) then 'assets/star-rating-4.svg'
    else 'assets/star-rating-5.svg' 
