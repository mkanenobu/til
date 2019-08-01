open Core

class vals =
  object(self)
    val mutable source_lang = "en"
    val mutable target_lang = "ja"
    val mutable translate_text = ""
    val mutable endpoint = ""
    method http_request =
      print_endline "not impl"
  end

let main =
  print_endline "Hellom World!";
