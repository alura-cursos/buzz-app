//
//  NewsListDetailsPresenter.swift
//  Buzz
//
//  Created by Giovanna Moeller on 29/05/24.
//

import UIKit

protocol NewsListDetailsPresentationLogic {
    func presentFetchedNewsById()
    func presentError(error: Error)
}

class NewsListDetailsPresenter: NewsListDetailsPresentationLogic {
        
    func presentFetchedNewsById() {
        //
    }
    
    func presentError(error: any Error) {
        //
    }
}
