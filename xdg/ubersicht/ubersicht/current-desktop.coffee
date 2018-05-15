command: "echo $(/usr/local/opt/chunkwm/bin/chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  """
    <div class="currentDesktop-container">
      <ul>
        <li id="desktop1">1</li>
        <li id="desktop2">2</li>
        <li id="desktop3">3</li>
        <li id="desktop4">4</li>
        <li id="desktop5">5</li>
      <ul>
    </div>
  """

style: """
  bottom: 6px
  font: 12px "DejaVu Sans", sans-serif
  color: #888888
  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0
  li
    display: inline
    margin: 0 10px
    img
      max-height: 20px
      max-width: 20px
  li.active
    color: #ffffff
    border-bottom: 2px solid #4c7899
"""

update: (output, domEl) ->
  if ($(domEl).find('li.active').id isnt output)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#desktop' + output).addClass('active')

  $('#desktop1').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 1'"
  $('#desktop2').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 2'"
  $('#desktop3').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 3'"
  $('#desktop4').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 4'"
  $('#desktop5').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 5'"
