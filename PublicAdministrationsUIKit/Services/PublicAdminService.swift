//
//  PublicAdminService.swift
//  PublicAdministrationsUIKit
//
//  Created by Peter Delgado on 9/10/23.
//

import Foundation
import Combine


class PublicAdministrationService {

	@Published var allAdministrations: [PublicAdministrationModel] = []
	var adminSubscription: AnyCancellable?

	init() {
		getPublicAdmins()
	}

	public func getPublicAdmins() {
		guard let url = URL(string:"https://pre.es.tulotero.net/tuloteroweb/rest/admins")
		else {return}

		adminSubscription = NetworkManager.download(url: url)
			.decode(type: [PublicAdministrationModel].self, decoder: JSONDecoder())
			.sink(receiveCompletion:  NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedAdmins) in
				self?.allAdministrations = returnedAdmins
				self?.adminSubscription?.cancel()
			})
	}

}

