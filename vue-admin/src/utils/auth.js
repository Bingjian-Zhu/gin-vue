import Cookies from 'js-cookie'

const TokenKey = 'jwt-token'
const TokenExpireKey = 'token-expire'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}

export function getTokenExpire() {
  return Cookies.get(TokenExpireKey)
}

export function setTokenExpire(tokenExpire) {
  return Cookies.set(TokenExpireKey, tokenExpire)
}

export function removeTokenExpire() {
  return Cookies.remove(TokenExpireKey)
}
