import scala.util.Random

abstract class Notification
case class Email(sender: String, title: String, body: String) extends Notification
case class SMS(caller: String, message: String) extends Notification
case class VoiceRecording(contactName: String, link: String) extends Notification

object main {
  def matchTest(x: Int): String = x match {
    case 0 => "zero"
    case 1 => "one"
    case 2 => "two"
    case _ => "other"
  }

  def showNotification(notification: Notification): String = {
    notification match {
      case Email(sender, title, _) =>
        s"You got an email from $sender with title: $title"
      case SMS(number, message) =>
        s"You got an SMS from $number! Message: $message"
      case VoiceRecording(name, link) =>
        s"you received a Voice Recording from $name! Click the link to hear it: $link"
    }
  }

  def showImportantNotification(notification: Notification, importantPeopleInfo: Seq[String]): String = {
    notification match {
      // ガード, ifの条件がtrueの場合にのみマッチする
      case Email(sender, _, _) if importantPeopleInfo.contains(sender) =>
        "You got an email from special someone!"
      // ガード
      case SMS(number, _) if importantPeopleInfo.contains(number) =>
        "You got an SMS from special someone!"
      case other =>
        showNotification(other) // 上のパターンにマッチしなかった場合↑のメソッドに渡される
    }
  }

  def main(args: Array[String]): Unit = {
    val x: Int = Random.nextInt(5)
    println(matchTest(x))

    // ケースクラスのマッチング
    val someSms = SMS("867-5555", "Are you there?")
    val someVoiceRecording = VoiceRecording("Tom", "voicerecording.org/id/123")
    val importantEmail = Email("jenny@gmail.com", "Drinks tonight?", "I'm free after 5!")
    val importantSms = SMS("867-5309", "I'm here! Where are you?")

    val importantPeopleInfo = Seq("867-5309", "jenny@gmail.com")

    println(showImportantNotification(someSms, importantPeopleInfo))
    println(showImportantNotification(someVoiceRecording, importantPeopleInfo))
    println(showImportantNotification(importantEmail, importantPeopleInfo))
    println(showImportantNotification(importantSms, importantPeopleInfo))
  }
}
