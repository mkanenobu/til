import scala.util.Random

@main
def main(): Unit = {
  {
    // パターンマッチングの指揮には値、matchキーワード、1つ以上のcase句が含まれる
    val x: Int = Random.nextInt(10)
    x match {
      case 0 => "zero"
      case 1 => "one"
      case 2 => "two"
      // `_` はプレースホルダーで全てにマッチする
      case _ => "other"
    }
  }

  {
    // パターンマッチングは式なので値を返す
    def matchTest(x: Int): String = x match {
      case 1 => "one"
      case 2 => "two"
      case _ => "other"
    }
    println(matchTest(3))
    println(matchTest(1))
  }

  {
    // case classのパターンマッチング
    sealed trait Notification
    case class Email(sender: String, title: String, body: String) extends Notification
    case class SMS(caller: String, message: String) extends Notification
    case class VoiceRecording(contactName: String, link: String) extends Notification

    def showNotification(notification: Notification): String = {
      notification match {
        case Email(sender, title, _) =>
          s"You got an email from $sender with title: $title"
        case SMS(number, message) =>
          s"You got an SMS from $number! Message: $message"
        case VoiceRecording(name, link) =>
          s"You recived an Voice Recording form $name! Click the link to hear it: $link"
      }
    }

    val someSms = SMS("12345", "Are you there?")
    val someVoiceRecording = VoiceRecording("Tom", "voicerecording.org/id/123")
    println(showNotification(someSms))
    println(showNotification(someVoiceRecording))

    // パターンガード
    // パターンの後に if <boolean expression> を追加する
    def showImportantNotification(notification: Notification, importantPeopleInfo: Seq[String]): String = {
      notification match {
        case Email(sender, _, _) if importantPeopleInfo.contains(sender) =>
          "You got an email from special someone!"
        case SMS(number, _) if importantPeopleInfo.contains(number) =>
          "You got and SMS from special someone!"
        case other =>
          showNotification(other)
      }
    }

    val importantPeopleInfo = Seq("867-5309", "jenny@example.com")
    val notifications = List(
      SMS("123-4567", "Are you there?"),
      VoiceRecording("Tom", "voicerecording.org/id/123"),
      // important
      Email("jenny@example.com", "Drinks tonight?", "I'm free after 5!"),
      SMS("867-5309", "I'm here! Where are you?")
    )
    notifications.foreach(notification => println(showImportantNotification(notification, importantPeopleInfo)))
  }

  {
    // 型のみのマッチング
    sealed trait Device
    case class Phone(model: String) extends Device:
      def screenOff = "Turning screen off"
    case class Computer(model: String) extends Device:
      def screenSaverOn = "Turning screen saver on..."
    // 型のみでマッチングさせることが出来る
    // これはメソッドを呼び出す必要があるときに便利
    def goIdle(device: Device): String = device match {
      case p: Phone => p.screenOff
      case c: Computer => c.screenSaverOn
    }

    // 一致したパターンを変数にバインドする
    // 変数バインディングを使用すると一致したパターンからインスタンスそのものとフィールドを同時に抽出できる
    def goIdleWithModel(device: Device): String = device match {
      case p @ Phone(model) => s"$model: ${p.screenOff}"
      case c @ Computer(model) => s"$model: ${c.screenSaverOn}"
    }
    println(goIdleWithModel(Phone("Samsung")))
    println(goIdleWithModel(Computer("Mac")))
  }

  {
    // sealed types
    // 今までの例でベースになる型にsealedキーワードが付いていることがあった
    // ベースの型にsealedキーワードが付いている場合、パターンマッチのケースが網羅的であることをコンパイラがチェックする
    // 基本型にsealedキーワードが付いている場合、その基本型の定義と同じファイル内で全てのサブタイプを定義する必要がある
  }
}
