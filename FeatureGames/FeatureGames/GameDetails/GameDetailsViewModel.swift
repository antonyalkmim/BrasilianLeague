//
//  GameDetailsViewModel.swift
//  FeatureGames
//
//  Created by antony.alkmim on 31/12/22.
//

import Foundation

struct GameDetailsViewModel {

    let gameSummary: GameSummary

    private let service: GamesService

    // MARK: Initializers

    init(
        gameSummary: GameSummary,
        service: GamesService = .live()
    ) {
        self.gameSummary = gameSummary
        self.service = service
    }

    // MARK: Inputs

    // swiftlint:disable line_length
    func loadGameDetails() async -> State {
        let game = Game(
            id: "asdasd",
            title: "Avaí se despede da Série A com vitória sobre o Flamengo",
            description: "Na última rodada do Brasileiro, Avaí vence o Flamengo por 2 a 1, neste sábado, no estádio do Maracanã. O jogo teve tom de festa com o estádio lotado para as despedidas de Diego Ribas, que anunciou a aposentadoria, e Diego Alves, que não terá o contrato renovado. Em campo, apenas jogadores do time catarinense fizeram gol, Wellington marcou contra e abriu o placar. Mas Marcinho e Felipe Silva garantiram a virada na despedida do Avaí da Série A.",
            highlights: [
                GameHighlight(
                    id: "1",
                    description: "Avaí tenta transição para o ataque, André recupera a bola, dribla dois marcadores, mas perde a bola perto da área do Avaí",
                    eventMinute: 59,
                    type: .normal
                ),
                GameHighlight(
                    id: "1",
                    description: "Cartão para Robinho",
                    eventMinute: 34,
                    type: .normal
                ),
                GameHighlight(
                    id: "1",
                    description: "Ronaldinho gaucho marcou o segundo do time catarinense",
                    eventMinute: 21,
                    type: .goal
                ),
                GameHighlight(
                    id: "1",
                    description: "Lance perigoso",
                    eventMinute: 7,
                    type: .normal
                )
            ]
        )
        return .loaded(game)
//        do {
//            let items = try await service.getGameDetails(gameSummary.id)
//            return .loaded(items)
//        } catch {
//            return State.error(error)
//        }
    }

    // MARK: State

    enum State {
        case loaded(Game)
        case error(Error)
    }

}
