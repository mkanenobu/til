# bloack
block a:
  for i in 0..10:
    block b:
      for j in 0..10:
        if i * j == 11: break b
        elif i * j > 20: break a
        echo i * j
