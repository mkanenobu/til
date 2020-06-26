package controllers

import javax.inject.Inject
import play.api.libs.json._
import play.api.mvc._

class HelloController @Inject() (cc: ControllerComponents)
    extends AbstractController(cc) {
  // conf.routes で指定されたメソッドは Action 型を返す必要がある
  def hello(): Action[AnyContent] = {
    val result: Result = Ok("Hello World")
    Action(result.as("text/plain"))
  }

  def helloJson(): Action[AnyContent] =
    Action({
      val json: JsValue =
        Json.obj("hello" -> "world", "language" -> "scala")

      Ok(json)
    })
}
