List getWeatherImage(int conditnCode) {
  switch (conditnCode) {
    case 1000:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/overcast.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/clear-sky.png'
      ];
    case 1003:
    case 1006:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/cloudy (2).png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/cloudy.png'
      ];
    case 1009:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/snow.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/snow.png'
      ];
    case 1063:
      return ['', '', 'lib/assets/images/Lantern-cuate.png', ''];
    case 1180:
    case 1183:
    case 1186:
    case 1189:
    case 1192:
    case 1195:
    case 1198:
    case 1201:
    case 1204:
    case 1207:
    case 1210:
    case 1213:
    case 1216:
    case 1219:
    case 1222:
    case 1225:
    case 1237:
    case 1240:
    case 1243:
    case 1246:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/cloudy_rine.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/cloudy_rine.png'
      ];
    case 1066:
    case 1217:
    case 1228:
    case 1255:
    case 1258:
    case 1261:
    case 1264:
    case 1273:
    case 1276:
    case 1279:
    case 1282:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/cloudy_rine.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/cloudy_rine.png'
      ];
    case 1087:
    case 1270:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/rain.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/rain.png'
      ];
    default:
      return [
        'lib/assets/images/snowing night.jpg',
        'lib/assets/images/snow.png',
        'lib/assets/images/Clear1.jpg',
        'lib/assets/images/snow.png'
      ];
  }
}
