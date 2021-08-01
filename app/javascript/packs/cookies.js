
export function setCookie(cookie_name, cookie_value, expiring_days = 365) {
  cookie_value = JSON.stringify(cookie_value)
  const date = new Date();
  date.setTime(date.getTime() + (expiring_days*24*60*60*1000));
  let expires = "expires="+ date.toUTCString();
  document.cookie = `${cookie_name}=${cookie_value};${expires};path=/`;
}

function cookieItem(cookie_name) {
  let name = cookie_name + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i <ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

export function getCookie(cookie_name){
  let cookie_data = cookieItem(cookie_name)
  return cookie_data !== "" ? JSON.parse(cookie_data) : cookie_data
}

export  function deleteCookie(cookie_name){
  document.cookie = `${cookie_name}=; path=/;`;
}

