make_gtkrc() {
  local dest="${1}"
  local name="${2}"
  local theme="${3}"
  local color="${4}"
  local size="${5}"
  local ctype="${6}"
  local window="${7}"

  [[ "${color}" == '-light' ]] && local ELSE_LIGHT="${color}"
  [[ "${color}" == '-dark' ]] && local ELSE_DARK="${color}"

  local GTKRC_DIR="${SRC_DIR}/main/gtk-2.0"
  local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

  if [[ "${color}" != '-dark' ]]; then
    case "$theme" in
      '')
        theme_color='#3c84f7'
        ;;
      -purple)
        theme_color='#AB47BC'
        ;;
      -pink)
        theme_color='#EC407A'
        ;;
      -red)
        theme_color='#E53935'
        ;;
      -orange)
        theme_color='#F57C00'
        ;;
      -yellow)
        theme_color='#FBC02D'
        ;;
      -green)
        theme_color='#4CAF50'
        ;;
      -teal)
        theme_color='#009688'
        ;;
      -grey)
        theme_color='#464646'
        ;;
    esac

    if [[ "$ctype" == '-stonerose' ]]; then
      case "$theme" in
        '')
          theme_color='#9DAEBF'
          ;;
        -purple)
          theme_color='#AE9DBF'
          ;;
        -pink)
          theme_color='#BF9BAE'
          ;;
        -red)
          theme_color='#BF9D9D'
          ;;
        -orange)
          theme_color='#BFAE9D'
          ;;
        -yellow)
          theme_color='#BFAE9D'
          ;;
        -green)
          theme_color='#AEBF9D'
          ;;
        -teal)
          theme_color='#9DBFAE'
          ;;
        -grey)
          theme_color='#B4B4BF'
          ;;
      esac
    fi

    if [[ "$ctype" == '-dracula' ]]; then
      case "$theme" in
        '')
          theme_color='#a679ec'
          ;;
        -purple)
          theme_color='#a679ec'
          ;;
        -pink)
          theme_color='#f04cab'
          ;;
        -red)
          theme_color='#f44d4d'
          ;;
        -orange)
          theme_color='#f8a854'
          ;;
        -yellow)
          theme_color='#e8f467'
          ;;
        -green)
          theme_color='#4be772'
          ;;
        -teal)
          theme_color='#20eed9'
          ;;
        -grey)
          theme_color='#3c3f51'
          ;;
      esac
    fi
  else
    case "$theme" in
      '')
        theme_color='#5b9bf8'
        ;;
      -purple)
        theme_color='#BA68C8'
        ;;
      -pink)
        theme_color='#F06292'
        ;;
      -red)
        theme_color='#F44336'
        ;;
      -orange)
        theme_color='#FB8C00'
        ;;
      -yellow)
        theme_color='#FFD600'
        ;;
      -green)
        theme_color='#66BB6A'
        ;;
      -teal)
        theme_color='#4DB6AC'
        ;;
      -grey)
        theme_color='#DDDDDD'
        ;;
    esac

    if [[ "$ctype" == '-stonerose' ]]; then
      case "$theme" in
        '')
          theme_color='#9DAEBF'
          ;;
        -purple)
          theme_color='#AE9DBF'
          ;;
        -pink)
          theme_color='#BF9BAE'
          ;;
        -red)
          theme_color='#BF9D9D'
          ;;
        -orange)
          theme_color='#BFAE9D'
          ;;
        -yellow)
          theme_color='#BFAE9D'
          ;;
        -green)
          theme_color='#AEBF9D'
          ;;
        -teal)
          theme_color='#9DBFAE'
          ;;
        -grey)
          theme_color='#B4B4BF'
          ;;
      esac
    fi

    if [[ "$ctype" == '-dracula' ]]; then
      case "$theme" in
        '')
          theme_color='#bd93f9'
          ;;
        -purple)
          theme_color='#bd93f9'
          ;;
        -pink)
          theme_color='#ff79c6'
          ;;
        -red)
          theme_color='#ff5555'
          ;;
        -orange)
          theme_color='#ffb86c'
          ;;
        -yellow)
          theme_color='#f1fa8c'
          ;;
        -green)
          theme_color='#50fa7b'
          ;;
        -teal)
          theme_color='#50fae9'
          ;;
        -grey)
          theme_color='#d9dae3'
          ;;
      esac
    fi
  fi

  if [[ "$blackness" == 'true' ]]; then
    case "$ctype" in
      '')
        background_light='#FFFFFF'
        background_dark='#0F0F0F'
        background_darker='#121212'
        background_alt='#212121'
        titlebar_light='#F2F2F2'
        titlebar_dark='#030303'
        ;;
      -stonerose)
        background_light='#B4B4BF'
        background_dark='#303033'
        background_darker='#48484D'
        background_alt='#303033'
        titlebar_light='#CCCCD9'
        titlebar_dark='#48484D'
        ;;
      -dracula)
        background_light='#f9f9fb'
        background_dark='#0d0d11'
        background_darker='#0f1015'
        background_alt='#1c1e26'
        titlebar_light='#f0f1f4'
        titlebar_dark='#020203'
        ;;
    esac
  else
    case "$ctype" in
      '')
        background_light='#FFFFFF'
        background_dark='#2C2C2C'
        background_darker='#3C3C3C'
        background_alt='#464646'
        titlebar_light='#F2F2F2'
        titlebar_dark='#242424'
        ;;
      -stonerose)
        background_light='#B4B4BF'
        background_dark='#303033'
        background_darker='#48484D'
        background_alt='#303033'
        titlebar_light='#CCCCD9'
        titlebar_dark='#48484D'
        ;;
      -dracula)
        background_light='#f9f9fb'
        background_dark='#242632'
        background_darker='#343746'
        background_alt='#3c3f51'
        titlebar_light='#f0f1f4'
        titlebar_dark='#1f2029'
        ;;
    esac
  fi

  cp -r "${GTKRC_DIR}/gtkrc${ELSE_DARK:-}-default"                              "${THEME_DIR}/gtk-2.0/gtkrc"
  sed -i "s/#FFFFFF/${background_light}/g"                                      "${THEME_DIR}/gtk-2.0/gtkrc"
  sed -i "s/#2C2C2C/${background_dark}/g"                                       "${THEME_DIR}/gtk-2.0/gtkrc"
  sed -i "s/#464646/${background_alt}/g"                                        "${THEME_DIR}/gtk-2.0/gtkrc"

  if [[ "${color}" == '-dark' ]]; then
    sed -i "s/#5b9bf8/${theme_color}/g"                                         "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#3C3C3C/${background_darker}/g"                                   "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#242424/${titlebar_dark}/g"                                       "${THEME_DIR}/gtk-2.0/gtkrc"
  else
    sed -i "s/#3c84f7/${theme_color}/g"                                         "${THEME_DIR}/gtk-2.0/gtkrc"
    sed -i "s/#F2F2F2/${titlebar_light}/g"                                      "${THEME_DIR}/gtk-2.0/gtkrc"
  fi
}
