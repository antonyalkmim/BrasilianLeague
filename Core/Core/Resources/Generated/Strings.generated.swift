// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Error {
    internal enum Generic {
      /// Aconteceu um error e já estamos trabalhando para tudo voltar ao normal. Tente acessar novamente mais tarde!
      internal static let message = L10n.tr("Localizable", "Error.Generic.message")
      /// Algo de errado por aqui
      internal static let title = L10n.tr("Localizable", "Error.Generic.title")
    }
    internal enum Network {
      /// Oops! Perdemos conexão com a internet. Verifique o Wi-fi ou a sua rede móvel e tente novamente.
      internal static let message = L10n.tr("Localizable", "Error.Network.message")
      /// Sem conexão
      internal static let title = L10n.tr("Localizable", "Error.Network.title")
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
