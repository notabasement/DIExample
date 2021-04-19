//
//  DetailsViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/15/21.
//

import Foundation
import DIExampleDomain

public protocol DetailsViewModelResponder {
    
    func titleDidUpdate()
}

public protocol DetailsViewModelInput {
    
    func updateTitle(with name: String, lastUpdated: Date)
}

public protocol DetailsViewModelOutput {
    
    var item: Title { get }
    var numChapters: Int { get }
}

public protocol DetailsViewModel: DetailsViewModelInput & DetailsViewModelOutput {}

public class DefaultDetailsViewModel: DetailsViewModel {
    
    public let item: Title
    public let numChapters: Int
    private let updateTitleUseCase: UpdateTitleUseCase
    private let responder: DetailsViewModelResponder
    
    public init(id: String,
                getTitleDetailUseCase: GetTitleDetailUseCase,
                updateTitleUseCase: UpdateTitleUseCase,
                getChapterListUseCase: GetChapterListUseCase,
                responder: DetailsViewModelResponder) {
        self.updateTitleUseCase = updateTitleUseCase
        self.responder = responder
        self.item = getTitleDetailUseCase.execute(with: id) ?? Title(id: "", name: "Test", lastUpdated: Date())
        self.numChapters = getChapterListUseCase.execute(with: id).count
    }
}

extension DefaultDetailsViewModel: DetailsViewModelOutput {
    
}

extension DefaultDetailsViewModel: DetailsViewModelInput {
    
    public func updateTitle(with name: String, lastUpdated: Date) {
        updateTitleUseCase.execute(id: item.id, name: name, lastUpdated: lastUpdated)
        responder.titleDidUpdate()
    }
}
