#!/usr/bin/env ruby

pattern = /^[-A-Za-z0-9+\u3040-\u30FF\uFF61-\uFF9F０-９Ａ-Ｚａ-ｚ＋ー−$]+$/

p '3'.match(pattern).to_a
