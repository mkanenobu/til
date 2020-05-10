class progress_bar x =
  object
    val mutable max_val = x

    val mutable current_val = 0

    method update x = current_val <- x
  end
