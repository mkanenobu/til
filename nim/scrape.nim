import os, strutils, strformat
from htmlparser import parseHtml
import nimquery, httpclient, xmltree

proc getContentById*(url: string, id: string): string =
  ## Scraping like javascript's document.getElementById
  ##
  ## Returns string
  let
    c = newHttpClient()
    webHtml: string = c.getContent(&"{url}")
    xml = parseHtml(webHtml)
  return $xml.querySelector(&"#{id}")

proc getElementById*(url: string, id: string): XmlNode =
  ## Scraping like javascript's document.getElementById
  ##
  ## Returns XmlNode
  let
    c = newHttpClient()
    webHtml: string = c.getContent(&"{url}")
    xml = parseHtml(webHtml)
  return xml.querySelector(&"#{id}")

proc getContentsByQuery*(url: string, query: string): string =
  let
    c = newHttpClient()
    webHtml: string = c.getContent(&"{url}")
    xml = parseHtml(webHtml)
  return $xml.querySelector(&"{query}")

proc getElementsByQuery*(url: string, query: string): XmlNode =
  let
    c = newHttpClient()
    webHtml: string = c.getContent(&"{url}")
    xml = parseHtml(webHtml)
  return xml.querySelector(&"{query}")

func removeTabSpace*(s: string): string =
  return s.replace("\t", "").replace(" ", "")

if isMainModule:
  var
    url = ""
    htmlId = ""

  echo getContentById(url, htmlId).removeTabSpace
