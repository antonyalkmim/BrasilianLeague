// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Details {
    /// %@'
    internal static func eventTime(_ p1: Any) -> String {
      return L10n.tr("Localizable", "Details.eventTime", String(describing: p1))
    }
    /// %@' ⚽️
    internal static func goalEventTime(_ p1: Any) -> String {
      return L10n.tr("Localizable", "Details.goalEventTime", String(describing: p1))
    }
    internal enum Section {
      /// Lances
      internal static let highlights = L10n.tr("Localizable", "Details.Section.highlights")
    }
  }

  internal enum List {
    /// Última rodada
    internal static let title = L10n.tr("Localizable", "List.title")
    internal enum Error {
      internal enum Empty {
        /// Parece que ainda não aconteceu nenhuma partida nessa rodada. Aguarde para mais atualizações.
        internal static let message = L10n.tr("Localizable", "List.Error.Empty.message")
        /// Nenhum jogo encontrado
        internal static let title = L10n.tr("Localizable", "List.Error.Empty.title")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
