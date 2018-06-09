#
# ──────────────────────────────────────────────── II ──────
#   :::::: I N F O : :  :   :    :     :        :          :
# ──────────────────────────────────────────────────────────
#

  #
  # ─── ALL COMMANDS ───────────────────────────────────────────────────────────
  #

  commands =
    battery:  "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto " +
              "| cut -f1 -d';'"
    time:     "/usr/local/bin/bash-fuzzy-clock"
    volume:   "osascript -e 'output volume of (get volume settings)'"
    charging: "pmset -g batt"

  #
  # ─── COLORS ─────────────────────────────────────────────────────────────────
  #

  colors =
    focused:   "#ffffff"

  #
  # ─── COMMAND ────────────────────────────────────────────────────────────────
  #

  command: "echo " +
           "$(#{ commands.battery }):::" +
           "$(#{ commands.time }):::" +
           "$(#{ commands.volume }):::" +
           "$(#{ commands.charging }):::"

  #
  # ─── REFRESH ────────────────────────────────────────────────────────────────
  #

  refreshFrequency: 1000

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  render: ( ) ->
    """
    <link rel="stylesheet" href="./font-awesome/font-awesome.min.css" />

    <div class="info-item volume">
      <div class="icon"><span class="volume-icon"></span></div>
      <span class="volume-output"></span>
    </div>
    <div class="info-item battery">
      <div class="icon"><span class="battery-icon"></span></div>
      <span class="battery-output"></span>
    </div>
    <div class="info-item time">
      <div class="icon"><i class="fa fa-clock-o"></i></div>
      <span class="time-output"></span>
    </div>
    """

  #
  # ─── RENDER ─────────────────────────────────────────────────────────────────
  #

  update: ( output ) ->
    output = output.split( /:::/g )

    battery  = output[ 0 ]
    time     = output[ 1 ]
    volume   = output[ 2 ]
    charging = output[ 3 ]

    $( ".battery-output" ) .text( "#{ battery }" )
    $( ".time-output" )    .text( "#{ time }" )
    $( ".volume-output" )  .text( "#{ volume }%" )

    @handleBattery(
      Number( battery.replace( /%/g, "" ) ),
      !charging.indexOf( "discharging" ) >= 0
    )
    @handleVolume( Number( volume ) )

  #
  # ─── HANDLE BATTERY ─────────────────────────────────────────────────────────
  #

  handleBattery: ( percentage, charging ) ->
    batteryIcon = switch
      when charging          then "fa-bolt"
      when percentage <=  12 then "fa-battery-0"
      when percentage <=  25 then "fa-battery-1"
      when percentage <=  50 then "fa-battery-2"
      when percentage <=  75 then "fa-battery-3"
      when percentage <= 100 then "fa-battery-4"
    $( ".battery-icon" ).html( "<i class=\"fa #{ batteryIcon }\"></i>" )

  #
  # ─── HANDLE VOLUME ──────────────────────────────────────────────────────────
  #

  handleVolume: ( volume ) ->
    volumeIcon = switch
      when volume ==   0 then "fa-volume-off"
      when volume <=  50 then "fa-volume-down"
      when volume <= 100 then "fa-volume-up"
    $( ".volume-icon" ).html( "<i class=\"fa #{ volumeIcon }\"></i>" )

  #
  # ─── STYLE ──────────────────────────────────────────────────────────────────
  #

  style: """
    .info-item
      display: flex
      padding: 0 5px 0 0
      margin-right: 15px
      .icon
        padding: 1px 5px
        margin-right: 5px

    display: flex

    bottom: 3.5px
    right: 0px
    font-family: 'DejaVu Sans'
    font-size: 12px
    font-smoothing: antialiasing
    z-index: 0
    color: #{ colors.focused }
  """

# ──────────────────────────────────────────────────────────────────────────────
